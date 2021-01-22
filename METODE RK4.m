clc
clear all
close all
%Nathasya Veronica
%NRP : 01111840000047
%memasukkan nilai variabel yang diketahui
b=0.0529;       %beta
cd=0.5;         %dengan gesekan udara
cl=0.33;        %dengan gerak spin vertikal
cs=1.5;         %dengan gerak spin horizontal
g=9.8;          %percepatan gravitasi
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
%menentukan proses yang diiterasi
for j=2:N
    t(j)=t(1)+(j-1)*h;
end
 %menyelesaikan persamaan menggunakan metode Runge-Kutta Orde 4
for jj=1:N-1
    v(jj+1)=((vx(jj))^2+(vy(jj))^2+(vz(jj))^2)^0.5;
    vt(jj+1)=((vx(jj))^2+(vy(jj))^2)^0.5;
    %orde pertama
    k1=g1(vx(jj),vy(jj),vz(jj),x(jj),y(jj),z(jj),t(jj));
    r1=g2(vx(jj),vy(jj),vz(jj),x(jj),y(jj),z(jj),t(jj));
    l1=g3(vx(jj),vy(jj),vz(jj),x(jj),y(jj),z(jj),t(jj));
    q1=f(vx(jj),vy(jj),vz(jj),x(jj),y(jj),z(jj),t(jj));
    w1=f1(vx(jj),vy(jj),vz(jj),x(jj),y(jj),z(jj),t(jj));
    u1=f2(vx(jj),vy(jj),vz(jj),x(jj),y(jj),z(jj),t(jj));
    %orde kedua
    k2=g1(vx(jj)+0.5*h*q1,vy(jj)+0.5*h*w1,vz(jj)+0.5*h*u1,...
        x(jj)+0.5*h*k1,y(jj)+0.5*h*r1,z(jj)+0.5*h*l1,t(jj)+0.5*h);
    r2=g2(vx(jj)+0.5*h*q1,vy(jj)+0.5*h*w1,vz(jj)+0.5*h*u1,...
        x(jj)+0.5*h*k1,y(jj)+0.5*h*r1,z(jj)+0.5*h*l1,t(jj)+0.5*h);
    l2=g3(vx(jj)+0.5*h*q1,vy(jj)+0.5*h*w1,vz(jj)+0.5*h*u1,...
        x(jj)+0.5*h*k1,y(jj)+0.5*h*r1,z(jj)+0.5*h*l1,t(jj)+0.5*h);
    q2=f(vx(jj)+0.5*h*q1,vy(jj)+0.5*h*w1,vz(jj)+0.5*h*u1,...
        x(jj)+0.5*h*k1,y(jj)+0.5*h*r1,z(jj)+0.5*h*l1,t(jj)+0.5*h);
    w2=f1(vx(jj)+0.5*h*q1,vy(jj)+0.5*h*w1,vz(jj)+0.5*h*u1,...
        x(jj)+0.5*h*k1,y(jj)+0.5*h*r1,z(jj)+0.5*h*l1,t(jj)+0.5*h);
    u2=f2(vx(jj)+0.5*h*q1,vy(jj)+0.5*h*w1,vz(jj)+0.5*h*u1,...
        x(jj)+0.5*h*k1,y(jj)+0.5*h*r1,z(jj)+0.5*h*l1,t(jj)+0.5*h);
    %orde ketiga
    k3=g1(vx(jj)+0.5*h*q2,vy(jj)+0.5*h*w2,vz(jj)+0.5*h*u2,...
        x(jj)+0.5*h*k2,y(jj)+0.5*h*r2,z(jj)+0.5*h*l2,t(jj)+0.5*h);
    r3=g2(vx(jj)+0.5*h*q2,vy(jj)+0.5*h*w2,vz(jj)+0.5*h*u2,...
        x(jj)+0.5*h*k2,y(jj)+0.5*h*r2,z(jj)+0.5*h*l2,t(jj)+0.5*h);
    l3=g3(vx(jj)+0.5*h*q2,vy(jj)+0.5*h*w2,vz(jj)+0.5*h*u2,...
        x(jj)+0.5*h*k2,y(jj)+0.5*h*r2,z(jj)+0.5*h*l2,t(jj)+0.5*h);
    q3=f(vx(jj)+0.5*h*q2,vy(jj)+0.5*h*w2,vz(jj)+0.5*h*u2,...
        x(jj)+0.5*h*k2,y(jj)+0.5*h*r2,z(jj)+0.5*h*l2,t(jj)+0.5*h);
    w3=f1(vx(jj)+0.5*h*q2,vy(jj)+0.5*h*w2,vz(jj)+0.5*h*u2,...
        x(jj)+0.5*h*k2,y(jj)+0.5*h*r2,z(jj)+0.5*h*l2,t(jj)+0.5*h);
    u3=f2(vx(jj)+0.5*h*q2,vy(jj)+0.5*h*w2,vz(jj)+0.5*h*u2,...
        x(jj)+0.5*h*k2,y(jj)+0.5*h*r2,z(jj)+0.5*h*l2,t(jj)+0.5*h);
    %orde keempat
    k4=g1(vx(jj)+h*q3,vy(jj)+h*w3,vz(jj)+h*u3,...
        x(jj)+h*k3,y(jj)+h*r3,z(jj)+h*l3,t(jj)+h);
    r4=g2(vx(jj)+h*q3,vy(jj)+h*w3,vz(jj)+h*u3,...
        x(jj)+h*k3,y(jj)+h*r3,z(jj)+h*l3,t(jj)+h);
    l4=g3(vx(jj)+h*q3,vy(jj)+h*w3,vz(jj)+h*u3,...
        x(jj)+h*k3,y(jj)+h*r3,z(jj)+h*l3,t(jj)+h);
    q4=f(vx(jj)+h*q3,vy(jj)+h*w3,vz(jj)+h*u3,...
        x(jj)+h*k3,y(jj)+h*r3,z(jj)+h*l3,t(jj)+h);
    w4=f1(vx(jj)+h*q3,vy(jj)+h*w3,vz(jj)+h*u3,...
        x(jj)+h*k3,y(jj)+h*r3,z(jj)+h*l3,t(jj)+h);
    u4=f2(vx(jj)+h*q3,vy(jj)+h*w3,vz(jj)+h*u3,...
        x(jj)+h*k3,y(jj)+h*r3,z(jj)+h*l3,t(jj)+h);
    %penyelesaian solusi metode runge-kutta orde 4
    x(jj+1)=x(jj)+(1/6)*h*(k1+2*k2+2*k3+k4);
    y(jj+1)=y(jj)+(1/6)*h*(r1+2*r2+2*r3+r4);
    z(jj+1)=z(jj)+(1/6)*h*(l1+2*l2+2*l3+l4);
    vx(jj+1)=vx(jj)+(1/6)*h*(q1+2*q2+2*q3+q4);
    vy(jj+1)=vy(jj)+(1/6)*h*(w1+2*w2+2*w3+w4);
    vz(jj+1)=vz(jj)+(1/6)*h*(u1+2*u2+2*u3+u4);
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
