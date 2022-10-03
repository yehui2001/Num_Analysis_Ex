

# Numerical Analysis Exercise 6

#### 15. For the following linear system 

$$
\left\{\begin{matrix} 
\begin{equation}
\begin{aligned}
4x_{1}+3x_{2}&= 24 \\
3x_{1}+4x_{2}-x_{3}&= 30\\
-x_{2}+4x_{3} &=-24
\end{aligned}
\end{equation}
\end{matrix}\right.
$$

#### (1) write the Jacobi and Guass-Seidel iterative scheme,respectively.

**Solution:** 

Jacobi iterative scheme: 
$$
\left\{\begin{matrix} 
\begin{equation}
\begin{aligned}
x_{1}^{k+1}&= 6-\frac{3}{4}x_{2}^{k} \\
x_{2}^{k+1}&= \frac{15}{2}-\frac{3}{4}x_{1}^{k}+\frac{1}{4}x_{3}^{k}\\
x_{3}^{k+1}&=-6+\frac{1}{4}x_{2}^{k}
\end{aligned}
\end{equation}
\end{matrix}\right.
$$


Guass-Seidel iterative scheme:

$$
\left\{\begin{matrix} 
\begin{equation}
\begin{aligned}
x_{1}^{k+1}&= 6-\frac{3}{4}x_{2}^{k} \\
x_{2}^{k+1}&= \frac{15}{2}-\frac{3}{4}x_{1}^{k+1}+\frac{1}{4}x_{3}^{k}\\
x_{3}^{k+1}&=-6+\frac{1}{4}x_{2}^{k+1}
\end{aligned}
\end{equation}
\end{matrix}\right.
$$


#### (2) perform four iterations on each of the scheme given in part(1) and determine which scheme you think gives the better approximation to the solution 

**Solution:**

```matlab
clc;
clear all;
close all;

A = [4,3,0;3,4,-3;0,-1,4];
b = [24,30,-24];
% A = [3,-1,1;3,6,2;3,3,7];
% b = [1,0,4];
b = b';
fprintf("真实解为:")
X=(A\b)'
%A = input("Please input the A:")
%b = input("Please input the b:")

ab = [A,b]%a为系数矩阵，b为右端项
N = 100;%设置为迭代次数

split_J=Split_J(A) %用来计算|TJ| 判断雅可比迭代是否收敛
split_G=Split_G(A)%用来计算|TG| 判断高斯迭代是否收敛

if(split_J<1)
    J=Jacobi_Iteration(ab,N)%Jacobi迭代法
    error_J = E(J,X);
    error_J = error_J(:,4);
else
    fprintf("because of the split_J > 1,so we can't use Gauss method")
end

if(split_G<1)
    G = Gauss_Iteration(ab,N)%高斯赛德尔迭代法
    error_G = E(G,X);
    error_G = error_G(:,4);
else
    fprintf("because of the split_G > 1,so we can't use Gauss method")
end

function G = Gauss_Iteration(ab,N)
    [R,C] = size(ab);
    G = zeros(R);%设G为高斯赛德尔迭代法的解集
     G(1,:) = [1,1,1];
     G(2,:) = [-1,0,1];
    for i = 1:R
        ab(i,:) = ab(i,:)./ab(i,i);
    end
    for i = 1:R
        ab(i,i) = 0;%斜角赋值为0
    end
    
    fprintf("形式处理后的增广矩阵:");
    ab(1:R,1:R) = -ab(1:R,1:R);
    
    for k = 2:N+1  
        for i = 1:R
            G(k,i) = ab(i,1:R)*G(k-1,:)' + ab(i,C);
            G(k-1,i) = G(k,i);
        end
    end
    ab
    fprintf("Gauss_Seidel的迭代解集:")
    %G = G(5,:)
end

function J = Jacobi_Iteration(ab,N)
    [R,C] = size(ab);
    J = zeros(R);%设J为雅可比迭代法的解集   
    
    for i = 1:R
        ab(i,:) = ab(i,:)./ab(i,i);
    end
    for i = 1:R
        ab(i,i) = 0;%斜角赋值为0
    end
    
    fprintf("形式处理后的增广矩阵");
    ab(1:R,1:R) = -ab(1:R,1:R);

    for k = 1:N  
        J(k+1,:) = ab(1:R,1:R)*J(k,:)'+ab(1:R,C);
    end

    fprintf("Jacobi的迭代解集:")
    %J = J(4,:)
end

function error = E(m,X) %用来计算迭代值与真实值误差
    for i = 1:size(m,1)
        for j = 1:size(m,2)
            error(i,j) = (m(i,j)-X(1,j)).^2;
        end
    error(i,size(m,2)+1) = sqrt(sum(error(i,:)));
    end
end

function split = Split_J(A) %用来计算|TJ|
[R,C] = size(A);
ab_D = A;
for i=1:R
    for j=1:R
        if(i~=j)
            ab_D(i,j) = 0; 
        end
    end
end

split = eig(ab_D^-1 * (ab_D-A))
split = max(split);

end

function split = Split_G(A) %用来计算|TG|
[R,C] = size(A);
ab_D = A;
ab_L = A;
for i=1:R
    for j=1:R
        if(i~=j)
            ab_D(i,j) = 0; 
        end
        if(i>j)
            ab_L(i,j) = -ab_L(i,j);
        else
            ab_L(i,j) = 0;
        end
    end
end

ab_U = ab_D - ab_L - A;

split = eig((ab_D-ab_L)^-1 * ab_U)
split = max(split);

end
```

```matlab
真实解为:
X = 1×3    
   10.5000   -6.0000   -7.5000

Jacobi的迭代解集:
J = 101×3    
         0         0         0
    6.0000    7.5000   -6.0000
    0.3750   -1.5000   -4.1250
    7.1250    4.1250   -6.3750
    2.9062   -2.6250   -4.9688
    7.9688    1.5938   -6.6562
    4.8047   -3.4688   -5.6016
    8.6016   -0.3047   -6.8672
    6.2285   -4.1016   -6.0762
    9.0762   -1.7285   -7.0254

Gauss_Seidel的迭代解集:
G = 100×3    
    6.0000    3.0000   -5.2500
    3.7500    0.7500   -5.8125
    5.4375   -0.9375   -6.2344
    6.7031   -2.2031   -6.5508
    7.6523   -3.1523   -6.7881
    8.3643   -3.8643   -6.9661
    8.8982   -4.3982   -7.0995
    9.2986   -4.7986   -7.1997
    9.5990   -5.0990   -7.2747
    9.8242   -5.3242   -7.3311

split = 3×1    
   -0.8660
    0.8660
   -0.0000

ans = 0.8660

```

we using the Euclidean distance to discribe approximation , absolutely to find that the Gauss_Seidel is the better method;

```matlab
error_J = 101×1    
   14.2302
   14.3091
   11.5826
   10.7318
    8.6869
    8.0489
    6.5152
    6.0366
    4.8864
    4.5275
error_G = 100×1    
   10.3108
    9.6939
    7.2705
    5.4528
    4.0896
    3.0672
    2.3004
    1.7253
    1.2940
    0.9705
```



#### 16.  Test the convergence of the Jacobi and Gauss-Seidel iterative method for solving the following linear systems.

$$
(1)\left\{\begin{matrix} 
\begin{equation}
\begin{aligned}
2x_{1}-x_{2}+x_{3}&=-1 \\
x_{1}+x_{2}+x_{3}&=2\\
-x_{1}-2x_{2}+2x_{3}&=-5.
\end{aligned}
\end{equation}
\end{matrix}\right.
$$

```matlab
clc;
clear all;
close all;

%A = [4,3,0;3,4,-3;0,-1,4];
%b = [24,30,-24];
A = [3,-1,1;3,6,2;3,3,7];
b = [1,0,4];
b = b';
fprintf("真实解为:")
X=(A\b)'
%A = input("Please input the A:")
%b = input("Please input the b:")

ab = [A,b]%a为系数矩阵，b为右端项
N = 100;%设置为迭代次数

split_J=Split_J(A) %用来计算|TJ| 判断雅可比迭代是否收敛
split_G=Split_G(A)%用来计算|TG| 判断高斯迭代是否收敛

if(split_J<1)
    J=Jacobi_Iteration(ab,N)%Jacobi迭代法
    error_J = E(J,X);
    error_J = error_J(:,4);
else
    fprintf("because of the split_J > 1,so we can't use Gauss method")
end

if(split_G<1)
    G = Gauss_Iteration(ab,N)%高斯赛德尔迭代法
    error_G = E(G,X);
    error_G = error_G(:,4);
else
    fprintf("because of the split_G > 1,so we can't use Gauss method")
end
```

other codes is showed in last answer.

```matlab
真实解为:
X = 1×3    
    0.0351   -0.2368    0.6579

Jacobi的迭代解集:
J = 101×3    
         0         0         0
    0.3333         0    0.5714
    0.1429   -0.3571    0.4286
    0.0714   -0.2143    0.6633
    0.0408   -0.2568    0.6327
    0.0368   -0.2313    0.6640
    0.0349   -0.2398    0.6548
    0.0352   -0.2357    0.6592
    0.0350   -0.2373    0.6574
    0.0351   -0.2366    0.6581

Gauss_Seidel的迭代解集:
G = 100×3    
    2.6667    0.3333   -0.7143
    0.6825   -0.1032    0.3231
    0.1912   -0.2033    0.5766
    0.0734   -0.2289    0.6381
    0.0443   -0.2349    0.6531
    0.0374   -0.2364    0.6567
    0.0356   -0.2367    0.6576
    0.0352   -0.2368    0.6578
    0.0351   -0.2368    0.6579
    0.0351   -0.2368    0.6579


split = 3×1 complex    
  -0.4193 + 0.0000i
   0.2097 + 0.1132i
   0.2097 - 0.1132i

ans = -0.4193
```

the $ ||T_{J}||=D^{-1}(L+U) = 0.4193$ < 1 , so it is easy to see that the solution is convergent.

$$
(2)\left\{\begin{matrix} 
\begin{equation}
\begin{aligned}
x_{1}+x_{2}-2x_{3}&=1 \\
x_{1}+x_{2}+x_{3}&=1\\
2x_{1}+2x_{2}+x_{3}&=1.
\end{aligned}
\end{equation}
\end{matrix}\right.
$$

By using the the above codes.

```matlab
真实解为:
X = 1×3    
    -3     3     1

split_J = -5.4047e-06 + 9.3612e-06i
split = 3×1    
     0
     2
     2

split_G = 2
Jacobi的迭代解集:
J = 101×3    
     0     0     0
     1     1     1
     1    -1    -3
    -3     3     1
    -3     3     1
    -3     3     1
    -3     3     1
    -3     3     1
    -3     3     1
    -3     3     1

because of the split_G > 1,so we can't use Gauss method
```

through Function split_G ,we can know the $|T_{G}| = 2>1$ ，so we  can't use the Gauss_iteration method.  

```
split_G = 3×1    
     0
     2
     2
```

#### 17. Determine the numbers of iterations necessary of the Jacobi and Gauss-Seidel iterative method with accuracy $10^{-4} $ in the $l_{\infin}$ norm of solving the system.

$$
\left\{\begin{matrix} 
\begin{equation}
\begin{aligned}
3x_{1}-x_{2}+2x_{3}&=1 \\
3x_{1}+6x_{2}+2x_{3}&=0\\
3x_{1}+3x_{2}+7x_{3}&=4.
\end{aligned}
\end{equation}
\end{matrix}\right.
$$

###### with initial approximation bector $X^{(0)} = (0,0,0)^{T}$

```matlab
clc;
clear all;
close all;

A = [3,-1,1;3,6,2;3,3,7];
b = [1,0,4];
b = b';
fprintf("真实解为:")
X=(A\b)'
%A = input("Please input the A:")
%b = input("Please input the b:")

ab = [A,b];%a为系数矩阵，b为右端项
N = 100;%设置为迭代次数
Epsilon =1e-4;
[R,C] = size(A);
ab_D = A;
ab_L = A;
for i=1:R
    for j=1:R
        if(i~=j)
            ab_D(i,j) = 0; 
        end
        if(i>j)
            ab_L(i,j) = -ab_L(i,j);
        else
            ab_L(i,j) = 0;
        end
    end
end

A
ab_U = ab_D - ab_L - A
ab_D
ab_L

T_J = ab_D^-1*(ab_L + ab_U)
C_J = ab_D^-1*b;

T_G = (ab_D - ab_L)^-1 * ab_U
C_G = (ab_D-ab_L)^-1*b;

X_G = [0;0;0];
X_J = [0;0;0];
error_G = 1;
error_J = 1;

if(Split_G(A)<1)
    i = 1;
    while(error_G>=Epsilon)
        X_G(:,i+1) = T_G*X_G(:,i) + C_G;
        error_G(i) = sqrt(sum((X_G(:,i+1)-X(1,:)').^2,1));
        i = i+1;  
    end
    X_G = X_G'
else
    fprintf("Jacobi method can't convergent")
end

if(Split_J(A)<1)
    i = 1;
    while(error_J>=Epsilon)
        X_J(:,i+1) = T_J*X_J(:,i) + C_J;
        error_J(i) = sqrt(sum((X_J(:,i+1)-X(1,:)').^2,1)); 
        i = i+1;  
    end
    X_J = X_J'
else
    fprintf("Gauss method  can't convergent")
end



function split = Split_J(A) %用来计算|TJ|
[R,C] = size(A);
ab_D = A;
for i=1:R
    for j=1:R
        if(i~=j)
            ab_D(i,j) = 0; 
        end
    end
end

split = eig(ab_D^-1 * (ab_D-A));
split = max(split);

end

function split = Split_G(A) %用来计算|TG|
[R,C] = size(A);
ab_D = A;
ab_L = A;
for i=1:R
    for j=1:R
        if(i~=j)
            ab_D(i,j) = 0; 
        end
        if(i>j)
            ab_L(i,j) = -ab_L(i,j);
        else
            ab_L(i,j) = 0;
        end
    end
end

ab_U = ab_D - ab_L - A;



split = eig((ab_D-ab_L)^-1 * ab_U);
split = max(split);

end

```

```matlab
真实解为:
X = 1×3    
    0.0351   -0.2368    0.6579


error_G = 1×7    
    0.3447    0.0866    0.0205    0.0051    0.0012    0.0003    0.0001

X_G = 8×3    
         0         0         0
    0.3333   -0.1667    0.5000
    0.1111   -0.2222    0.6190
    0.0529   -0.2328    0.6485
    0.0396   -0.2360    0.6556
    0.0361   -0.2366    0.6573
    0.0354   -0.2368    0.6578
    0.0352   -0.2368    0.6579

error_J = 1×11    
    0.3905    0.2805    0.0431    0.0327    0.0084    0.0043    0.0017    0.0007    0.0003    0.0001    0.0001

X_J = 12×3    
         0         0         0
    0.3333         0    0.5714
    0.1429   -0.3571    0.4286
    0.0714   -0.2143    0.6633
    0.0408   -0.2568    0.6327
    0.0368   -0.2313    0.6640
    0.0349   -0.2398    0.6548
    0.0352   -0.2357    0.6592
    0.0350   -0.2373    0.6574
    0.0351   -0.2366    0.6581

```

