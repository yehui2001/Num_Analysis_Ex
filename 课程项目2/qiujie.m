clear,clc,close all,format long
%freexyn
syms x(t)
ode=diff(x,t,2)+0.2*diff(x,t)+5*x==0;
cond=[];
xs(t)=dsolve(ode,cond)
dx=diff(x,t);
cond=[x(0)==0,dx(0)==1];
xs(t)=dsolve(ode,cond)
diff(xs,t)
t=0:0.01:100;
plot(t,xs(t))



