clc;clear;close all;format long;
[t, x] = ode45(@fox,[0,200],[1000,500]);
[t2, x2] = ode45(@fox2,[0,200],[1000,500]);
[t3, x3] = ode45(@fox3,[0,200],[1000,500]);

subplot(3,2,1);
plot(t(1:75),x(1:75,1),'--',t(1:75),x(1:75,2),'--');
hold on;
title('Solution of Equation with ODE45 r1=0.01');
xlabel('Time t');
ylabel('Solution y');
legend('rabbit','fox');

subplot(3,2,2);
plot(x(:,1),x(:,2))

subplot(3,2,3);
plot(t2(1:75),x2(1:75,1),'--',t2(1:75),x2(1:75,2),'--');
hold on;
title('Solution of Equation with ODE45 r1=0.012');
xlabel('Time t');
ylabel('Solution y');
legend('rabbit','fox');

subplot(3,2,4);
plot(x2(:,1),x2(:,2))

subplot(3,2,5);
plot(t3(1:75),x3(1:75,1),'--',t3(1:75),x3(1:75,2),'--');
hold on;
title('Solution of Equation with ODE45 r1=0.015');
xlabel('Time t');
ylabel('Solution y');
legend('rabbit','fox');

subplot(3,2,6);
plot(x3(:,1),x3(:,2))
