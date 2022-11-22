function dydt = myfun(t,x)
  dydt = [x(2); -5*x(1)-0.1*x(2)];
  %dydt = [x(2); -5*x(1)];
  %%dydt = [x(2); (1-x(1)^2)*x(2)-x(1)];
end