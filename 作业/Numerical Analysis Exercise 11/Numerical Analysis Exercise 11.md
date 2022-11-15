# Numerical Analysis Exercise 11

![Question](https://pic.imgdb.cn/item/6373810916f2c2beb191770b.png)

```matlab
%---------------------------I.V.P---------------------------------
%-------------------Initial-value problem-------------------------
%Euler method 
%   We set the f(t_k,y(t_k)) as the y'; and we use the first-order Taylor
%   expansion, regard the h as the (x-x0).

clc 
clear all
close all

a = 1;
b = 2;
M = 20;
h = (b-a)/M;

y_k = zeros(1,M);
y_k(1) = 0;
x = a:h:b;
y = zeros(1,M);
y = x.^2.*(exp(x)-exp(1));
error = zeros(1,M);

%y' = (2./x) * y + x.^2.*exp(x);

x_k = a;
for k = 1:M
    y_k(k+1) = y_k(k) + h.* ((2./x_k) .* y_k(k) + x_k.^2 .* exp(x_k));
    x_k = x_k + h;
    error(k) = abs(y_k(k)-y(k));
end

y(M+1)
y_k(M+1)

fprintf('The biggest error of euler method is %f',max(error))
%max(error)%the error is a little big, unless you put the M very high.

%---------------------------------------------------------------
%-------------------Modified Euler Method-----------------------
% Use the second-order Talor expansion, import y''(x_k) and use the
% forward-difference formula to replace the y''(x_k).
clc
clear all
close all;

a = 1;
b = 2;
M = 20;
h = (b-a)/M;


p_k = zeros(1,M);
q_k = zeros(1,M);
y_k = zeros(1,M);
y_k(1) = 0;
x = a:h:b;
y = zeros(1,M);
y = x.^2.*(exp(x)-exp(1));
error_M = zeros(1,M);

x_k = a;
for k = 1:M
    p_k(k+1) = y_k(k) + h.* ((2./x_k) .* y_k(k) + x_k.^2 .* exp(x_k));
    q_k(k+1) = y_k(k) + h.* (2./(x_k + h) .* p_k(k+1) + (x_k+h).^2 .* exp(x_k + h));
    y_k(k+1) = 1/2 .*(p_k(k+1)+q_k(k+1));
    error_M(k) = abs(y_k(k)-y(k));
    x_k = x_k + h;
end

y(M+1)
y_k(M+1)

fprintf('The biggest error of modified euler method is %f',max(error_M))

```



| Euler Method->M |    20    |    50    |   100    |   150    |   200    |
| :-------------: | :------: | :------: | :------: | :------: | :------: |
|       $y$       | 18.6831  | 18.6831  | 18.6831  | 18.6831  | 18.6831  |
|      $y_k$      | 18.0829  | 17.9656  | 18.3202  | 18.4403  | 18.5006  |
|  $Error(Max)$   | 0.577103 | 0.684459 | 0.354459 | 0.239083 | 0.180362 |

| Modify Euler->M |    20    |    50    |   100    |   150    |   200    |
| :-------------: | :------: | :------: | :------: | :------: | :------: |
|       $y$       | 18.6831  | 18.6831  | 18.6831  | 18.6831  | 18.6831  |
|      $y_k$      | 18.6782  | 18.6782  | 18.6818  | 18.6825  | 18.6828  |
|  $Error(Max)$   | 0.004725 | 0.004725 | 0.001228 | 0.000553 | 0.000313 |

It is easy to find that the modify Euler method is better than Euler method.