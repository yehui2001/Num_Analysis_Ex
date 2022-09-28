# Numerical Analysis Exercise 6

##### 15. For the following linear system 

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

###### (1) write the Jacobi and Guass-Seidel iterative scheme,respectively.















###### (2) perform four iterations on each of the scheme given in part(1) and determine which scheme you think gives the better approximation to the solution 

**Solution:**

```matlab
clc;
clear all;
close all;

A = [10,-1,2,0;-1,11,-1,3;2,-1,10,-1;0,3,-1,8];
b = [6,25,-11,15];
b = b';
%fprintf("真实解为:")
%X=A\b
%A = input("Please input the A:")
%b = input("Please input the b:")

ab = [A,b];%a为系数矩阵，b为右端项
N = 4;%设置为迭代次数
J=Jacobi_Iteration(ab,N);%Jacobi迭代法
%Gauss_Iteration(ab,N)%高斯赛德尔迭代法

function G = Gauss_Iteration(ab,N)
    [R,C] = size(ab);
    G = zeros(R);%设G为高斯赛德尔迭代法的解集

    ab

    for i = 1:R
        ab(i,:) = ab(i,:)./ab(i,i);
    end
    for i = 1:R
        ab(i,i) = 0;%斜角赋值为0
    end

    fprintf("形式处理后的增广矩阵:");
    ab(1:R,1:R) = -ab(1:R,1:R)

    for k = 2:N  
        for i = 1:R
            G(k,i) = ab(i,1:R)*G(k-1,:)' + ab(i,C);
            G(k-1,i) = G(k,i);
        end
    end
end


function J = Jacobi_Iteration(ab,N)
    [R,C] = size(ab);
    J = zeros(R);%设J为雅可比迭代法的解集

    ab
    

    for i = 1:R
        ab(i,:) = ab(i,:)./ab(i,i);
    end
    for i = 1:R
        ab(i,i) = 0;%斜角赋值为0
    end

    fprintf("形式处理后的增广矩阵");
    ab(1:R,1:R) = -ab(1:R,1:R)

    for k = 1:N  
        J(k+1,:) = ab(1:R,1:R)*J(k,:)'+ab(1:R,C);
    end

    fprintf("Jacobi的迭代解集:")
    J(4,:)
end
```

```matlab
ab = 4×5    
    10    -1     2     0     6
    -1    11    -1     3    25
     2    -1    10    -1   -11
     0     3    -1     8    15

形式处理后的增广矩阵
ab = 4×5    
         0    0.1000   -0.2000         0    0.6000
    0.0909         0    0.0909   -0.2727    2.2727
   -0.2000    0.1000         0    0.1000   -1.1000
         0   -0.3750    0.1250         0    1.8750

Jacobi的迭代解集:
ans = 1×4    
    0.9326    2.0533   -1.0493    1.1309
Gauss_Seidel的迭代解集:
ans = 1×4    
    1.0009    2.0003   -1.0003    0.9998
真实解为:
X = 1×4    
    1.0000    2.0000   -1.0000    1.0000
```

we using the Euclidean distance to discribe approximation , absolutely to find that the Gauss_Seidel is the better method;

##### 16.  Test the convergence of the Jacobi and Gauss-Seidel iterative method for solving the following linear systems.

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

```

```

