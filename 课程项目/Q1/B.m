function B = Judge(y,x0)
[C,R] = size(x0);
k = 1;
syms x
y1 = (x+5)*(x-4)*(x+3)*(x-2)*(x-1/2);
y=(x+5)*(x-4)^2*(x+3)*(x+5/2);%该函数只能键入，用参数输入时无法识别
f = y;
dy = diff(f)
ddy = diff(f,2);
fprintf("函数的一阶导数值:")
dy_x = subs(dy,x,x0)
dy_x =double(dy_x);
fprintf("函数的二阶导数值:")
ddy_x = subs(ddy,x,x0)
ddy_x = double(ddy_x);
for i=1:R
    if(dy_x(i) == 0)
        x0(2,k) = 2;
        if(ddy_x(i) == 0)
            x0(2,k) = 3;      
        end
    else
    x0(2,k) = 1;
    end
    k = k + 1;   
end
B = x0;
end