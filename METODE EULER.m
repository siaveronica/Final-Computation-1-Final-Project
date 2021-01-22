clc
clear all
close all
%Nathasya Veronica
%NRP : 01111840000047
%memasukkan nilai variabel yang diketahui
b=0.0529;   %beta
cd=0.5;     %dengan gesekan udara
cl=0.33;    %dengan gerak spin vertikal
cs=1.5;     %dengan gerak spin horizontal
g=9.8;      %percepatan gravitasi
x(1)=0;
y(1)=0;
z(1)=0;
vx(1)= 5;
vy(1)= 5;
vz(1)= 5;
t(1)=0;
%menentukan nilai dan jumlah loop untuk n
a=0; 
beta=1;
N=100;
h=(beta-a)/N;
%menghitung variabel awal yang diperlukan
v(1)=((vx(1))^2+(vy(1))^2+(vz(1))^2)^0.5;
vt(1)=((vx(1))^2+(vy(1))^2)^0.5;
%memasukkan fungsi persamaan diferensial yang digunakan
f=@(vx,vy,vz,x,y,z,t) (-b*v*(cd*vx+((cl*vx*vz)+(cs*v*vy))/vt))
f1=@(vx,vy,vz,x,y,z,t) (-b*v*(cd*vy+((cl*vy*vz)+(cs*v*vx))/vt))
f2=@(vx,vy,vz,x,y,z,t) (b*v*((-cd*vz)+(cd*vt))-g)
g1=@(vx,vy,vz,x,y,z,t) (vx)
g2=@(vx,vy,vz,x,y,z,t) (vy)
g3=@(vx,vy,vz,x,y,z,t) (vz)
%menentukan proses yang iterasi
for j=2:N
    t(j)=t(1)+(j-1)*h;
end
%menyelesaikan persamaan menggunakan metode Euler
for jj=1:N-1
    v(jj+1)=((vx(jj))^2+(vy(jj))^2+(vz(jj))^2)^0.5;
    vt(jj+1)=((vx(jj))^2+(vy(jj))^2)^0.5;
    x(jj+1)=x(jj)+h*g1(vx(jj),vy(jj),vz(jj),x(jj),y(jj),z(jj),t(jj));
    y(jj+1)=y(jj)+h*g2(vx(jj),vy(jj),vz(jj),x(jj),y(jj),z(jj),t(jj));
    z(jj+1)=z(jj)+h*g3(vx(jj),vy(jj),vz(jj),x(jj),y(jj),z(jj),t(jj));
    vx(jj+1)=vx(jj)+h*f(vx(jj),vy(jj),vz(jj),x(jj),y(jj),z(jj),t(jj));
    vy(jj+1)=vy(jj)+h*f1(vx(jj),vy(jj),vz(jj),x(jj),y(jj),z(jj),t(jj));
    vz(jj+1)=vz(jj)+h*f2(vx(jj),vy(jj),vz(jj),x(jj),y(jj),z(jj),t(jj));
end

%plot hasil pada grafik
subplot(3,1,1)
plot(x,y)
xlabel('x')
ylabel('y')
subplot(3,1,2)
plot(x,z)
xlabel('x')
ylabel('z')
subplot(3,1,3)
plot(y,z)
xlabel('y')
ylabel('z')
