

# Numerical Analysis Exercise 5

##### 1. Use Gaussian elimination with partial pivoting to solve the following linear system.(手算)

We can get that by dividing matrices:

```matlab
clc;
clear all;
close all;

A = [1,1,-1;1,2,4;2,-1,2];
%A = input("Please input the coefficient matrix:")
b = [1,2,3]'
%b = input("Please input the constant matrix:")

X=A\b
```

```matlab
X = 3×1    
    1.2632
   -0.0526
    0.2105

```



##### 2. Solve the following linear system by using Chasing method(refer to "追赶法.PPT")

$$
\left\{\begin{matrix} 
x_{1}+x_{2} ㅤ ㅤㅤㅤㅤㅤ  =5 \\  
  2x_{1}-x_{2}+5x_{3} ㅤㅤㅤㅤ=-9\\
 ㅤㅤ 3x_{2}-4x_{3}+2x_{4} ㅤ=19\\
  ㅤㅤㅤㅤㅤㅤ2x_{3}+6x_{4}=2
\end{matrix}\right.



$$

```matlab
%Chasing method
clc;
clear all;
close all;
A=[1,2,0,0;2,3,-1,0;0,4,2,-1;0,0,2,-4];
b=[7,9,10,12];
b=b';
%A=input("Please input the A:")
%b=input("Please input the b:")

ab=[A,b];%a为系数矩阵，b为右端项
[R,C]=size(ab);
for i=1:R-1 %控制消去首行元素的次数 二阶方程组只需要消去一次,三阶消去两次                   i=2时，系数矩阵第三行消去一个首行元素,此时系数矩阵第三行只有一个元素
    for j=i+1:R                                                                          %假设R=3，i=1时，j=2.此时内循环两次，系数矩阵的第二三行分别消去一个首行非零元素
        ab(j,i:C)=ab(j,i:C)-ab(i,i:C)*ab(j,i)/ab(i,i);%每一行消去首行元素
    end
end
AB=ab;
for i=1:R
    ab(i,:)=ab(i,:)/ab(i,i);
end
A
b
fprintf("高斯消去法后的增广矩阵：")
AB
fprintf("追赶法后的增广矩阵：")
ab

X=zeros(R,1);%解空间
X(R,1)=ab(R,C);
for i=R-1:-1:1
    X(i,1)=ab(i,C)-X(i+1,1)*ab(i,i+1);
end
fprintf("解为:")
X

```

```matlab
A = 4×4    
     1     2     0     0
     2     3    -1     0
     0     4     2    -1
     0     0     2    -4

b = 4×1    
     7
     9
    10
    12

高斯消去法后的增广矩阵：
AB = 4×5    
     1     2     0     0     7
     0    -1    -1     0    -5
     0     0    -2    -1   -10
     0     0     0    -5     2

追赶法后的增广矩阵：
ab = 4×5    
    1.0000    2.0000         0         0    7.0000
         0    1.0000    1.0000         0    5.0000
         0         0    1.0000    0.5000    5.0000
         0         0         0    1.0000   -0.4000

解为:
X = 4×1    
    7.4000
   -0.2000
    5.2000
   -0.4000

```

##### 3. Find the $ \left \| X \right \|_{1},\left \| X \right \|_{2},\left \| X \right \|_{\infty}$ norms the following vectors
###### (1) $ X = (3,-4,0,\frac{3}{2})^{T}$,

```matlab
clc;
clear all;
close all;
X = [3,-4,0,3/2]';
Y = [2,1,-3,4]';
[a,b,c] = Get_normal_form(X);
fprintf("求得的第一范式为：")
a
fprintf("求得的第二范式为：")
b
fprintf("求得的无限范式为：")
c

function [abs_1,abs_2,abs_inf] = Get_normal_form(x)
    abs_1 = 0;
    abs_2 = 0;
    for i=1:length(x)
        abs_1 = abs_1 + abs(x(i));   
        abs_2 = abs_2 + x(i)^2;
    end
        abs_2 = sqrt(abs_2);
        abs_inf = max(abs(x));

end
```

```matlab
X
求得的第一范式为：
a = 8.5000
求得的第二范式为：
b = 5.2202
求得的无限范式为：
c = 4
```

###### (2) $ Y =(2,1,-,4)^{T} $

```matlab
Y
求得的第一范式为：
a = 10
求得的第二范式为：
b = 5.4772
求得的无限范式为：
c = 4
```

