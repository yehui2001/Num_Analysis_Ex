%随机生成三对角矩阵
n=30;
A=diag(round(rand(1,n)*9)+1,0)+diag(round(rand(1,n-1)*9)+1,1)+diag(round(rand(1,n-1)*9)+1,-1);
b=round(rand(n,1)*9)+1;
x0=zeros(n,1);
%误差
eps=1e-3;
%最大迭代次数
Nmax=500;

%Jacobi
x = zeros(1,n);
y = zeros(1,n);
count = 1;
while(1)
     for i = 1:n
        for j = 1:n
            if i ~= j
                y(i) = y(i) + A(i,j)*x(j);
            end
        end
        y(i)=( b(i) - y(i))/A(i,i);
    end
    if max(abs(x-y)) < eps
        fprintf('迭代结束，次数%d，结果：\n',count);
        disp(y);
        break;
    end
    if count == Nmax
        fprintf('超过最大迭代次数，结果：\n');
        disp(y);
        break;
    end
    count = count + 1;
    x = y;
    y(1: n) = 0;
end

%Gauss-Seidel
x = zeros(1,n);
y = zeros(1,n);
count = 1;
x1 = zeros(1,n);
x2 = zeros(1,n);
while(1)
    x1(1:n) = 0;
    x2(1:n) = 0;
     for i = 1:n
        for j = 1: i-1
            x1(i) =x1(i) + A(i,j) * y(j);
        end
        for k = i + 1 : n
           x2(i) = x2(i) + A(i,k) * x(k);
        end
        y(i)=(b(i) - x1(i) - x2(i))/A(i,i);
    end
    if max(abs(x-y)) < eps
        fprintf('迭代结束，次数%d，结果：\n',count);
        disp(y);
        break;
    end
    if count == Nmax
        fprintf('超过最大迭代次数，迭代结束，结果：\n');
        disp(y);
        break;
    end
    count = count + 1;
    x = y;
end

