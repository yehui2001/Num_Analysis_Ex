clc;clear;close all;format long;
up = 100;
step = 0.5;
[t,x] = ode45(@myfun,[0:step:up],[0;1]);

subplot(1,3,1);
  plot(t,x(:,1),'--',t,x(:,2),'--');
  ylim([-1,1])
  hold on;
  title('Solution of Equation with ODE45');
  xlabel('Time t');
  ylabel('Solution y');
  legend('y_1','y_2')

for i=1:length(x)
  subplot(1,3,2);
  plot(t(i),x(i,2),'b.');
  ylim([-1,1]);
  xlim([0,up]);
  hold on;
  title('Status');
  xlabel('Time t');
  ylabel('Solution y');

  subplot(1,3,3);
  scatter(0,x(i,2),100,'filled');
  ylim([-1,1])
  pause(0.02);
end
