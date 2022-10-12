clc;
clear;
theta_1=0:pi/36:pi/2;
x=rho(theta_1).*cos(theta_1);
y=rho(theta_1).*sin(theta_1);
theta_11=0:pi/108:pi/2;
xx_1=rho(theta_11).*cos(theta_11);
yy_1=spline(x,y,xx_1);

theta_2=pi/2:pi/36:pi;
x=rho(theta_2).*cos(theta_2);
y=rho(theta_2).*sin(theta_2);
theta_22=pi/2:pi/108:pi;
xx_2=rho(theta_22).*cos(theta_22);
yy_2=spline(x,y,xx_2);

theta_3=pi:pi/36:(8*pi)/6;
x=rho(theta_3).*cos(theta_3);
y=rho(theta_3).*sin(theta_3);
theta_33=pi:pi/108:(8*pi)/6;
yy_3=rho(theta_33).*sin(theta_33);
xx_3=spline(y,x,yy_3);

theta_4=(8*pi)/6:pi/36:(10*pi)/6;
x=rho(theta_4).*cos(theta_4);
y=rho(theta_4).*sin(theta_4);
theta_44=(8*pi)/6:pi/108:(10*pi)/6;
xx_4=rho(theta_44).*cos(theta_44);
yy_4=spline(x,y,xx_4);

theta_5=(10*pi)/6:pi/36:2*pi;
x=rho(theta_5).*cos(theta_5);
y=rho(theta_5).*sin(theta_5);
theta_55=(10*pi)/6:pi/108:2*pi;
yy_5=rho(theta_55).*sin(theta_55);
xx_5=spline(y,x,yy_5);

plot(xx_1,yy_1,xx_2,yy_2,xx_3,yy_3,xx_4,yy_4,xx_5,yy_5);
function rho=rho(theta)
rho=2.*(1-sin(theta));
end