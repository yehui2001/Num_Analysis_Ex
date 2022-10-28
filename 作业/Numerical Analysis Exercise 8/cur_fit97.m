clc;clear;close all;format long;
x1=[2 2.3 2.6 2.9 3.2];
y1=[5.1 7.5 10.6 14.4 19];
%% 
f=fittype('a*x^3','independent','x','coefficients',{'a'});
cfun=fit(x1',y1',f,'startpoint',1)
xi=min(x1):0.02:max(x1);
yi=cfun(xi);
fig1 = figure;
plot(xi,yi,'b-',x1,y1,'r*');
hold on;
set(gca,'YGrid','on')
y_t=cfun(x1);
error=y1'-y_t;
mse_t=(mean(error.^2))^(0.5)
%% 
f=fittype('a*x^2+b','independent','x','coefficients',{'a'});
cfun=fit(x1',y1',f,'startpoint',1)
xi=min(x1):0.02:max(x1);
yi=cfun(xi);
plot(xi,yi,'g-',x1,y1,'r*');
hold off
y_t=cfun(x1);
error=y1'-y_t;
mse_t=(mean(error.^2))^(0.5)
%% 
x2=[0 0.15 0.31 0.5 0.6 0.75];
y2=[1 1.004 1.031 1.117 1.223 1.422];
f=fittype('a*exp(b*x)+c','independent','x','coefficients',{'a','b','c'});
cfun=fit(x2',y2',f,'startpoint',[0,0,0])
xi=min(x2):0.02:max(x2);
yi=cfun(xi);
fig2 = figure;
plot(xi,yi,'b-',x2,y2,'r*');
set(gca,'YGrid','on')
y_t=cfun(x2);
error=y2'-y_t;
mse_t=(mean(error.^2))^(0.5)
