clc;
clear all;

N = 100;% 设置最大迭代次数
epsilon = 1e-9;% 设置迭代的精度
%%
%Fixed-point iteration
x(1,1) = 1;x(1,2) = 1;%迭代初始点
for i = 1:N
    x(i+1,1) = 1/10*(x(i,1)^2+x(i,2)^2+8);
    x(i+1,2) = 1/12*(x(i,1)+x(i,1)*x(i,2)^2+7);
    dx_Fp(i,:) = x(i+1,:) - x(i,:);
    if(sum(dx_Fp(i,:).^2)< epsilon)
        break;
    end
    %x(i+1,3) = sqrt((x(i+1,1)-x(i,1))^2+(x(i+1,2)-x(i,2))^2);%sqrt(sum((x(i+1,:)-x(i,:)).^2));
    %|x(k)-x(k-1)|
%     if(x(i+1,3)<epsilon)
%         break;
%     end
end

x_Fp = x
%%
%Newton-Raphson iteration
syms x1 x2;
f1(x1,x2) = x1^2 - 10*x1 + x2^2 + 8;
f2(x1,x2) = x1*x2^2 + x1 - 12*x2 + 7;
 
F(x1,x2) = [f1;f2];
     
x_solve(:,1) = [1;1];%迭代初始点

J(x1,x2) = jacobian(F,[x1 x2]);

dx_Nr =[0;0];      % X(n+1)-X(n) = d(X); 第一行表示第一次迭代X(x1,x2)值与前一值的插值
for i = 1:N             % J*d(x) = -F(X) => d(x) = J \ -F(x)
    dx_Nr(:,i) = J(x_solve(1,i),x_solve(2,i))\(-F(x_solve(1,i),x_solve(2,i)));
    if(sqrt(sum(dx_Nr(:,i).^2)) < epsilon)
        x_solve(:,i+1) = x_solve(:,i) + dx_Nr(:,i);
        break;
    else
        x_solve(:,i+1) = x_solve(:,i) + dx_Nr(:,i);
    end
end

dx_Nr = dx_Nr';
x_Nr = x_solve'