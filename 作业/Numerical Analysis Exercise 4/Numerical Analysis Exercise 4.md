# Numerical Analysis Exercise 4

##### 4.Use the Gaussian elimination with backward substitution to solve the following liner systems.

$$
(1)\left\{\begin{matrix} 
  4x_{1}-x_{2}+3x_{3}=8 \\  
  2x_{1}+5x_{2}+2x_{3}=3.\\
  x_{1}+2x_{2}+4x_{3}=11
\end{matrix}\right. 
$$

**Solution**

```matlab
clc
clear
%Gaussian Elimination Method%
A=input("Please input the a:")
b=input("Please input the b:")
b=b';
Gauss(A,b)
```

```matlab
function X=Gauss(A,b)
ab=[A,b];%a为系数矩阵，b为右端项
[R,C]=size(ab);
for i=1:R-1 %控制消去首行元素的次数 二阶方程组只需要消去一次,三阶消去两次                   i=2时，系数矩阵第三行消去一个首行元素,此时系数矩阵第三行只有一个元素
    for j=i+1:R                                                                          %假设R=3，i=1时，j=2.此时内循环两次，系数矩阵的第二三行分别消去一个首行非零元素
        ab(j,i:C)=ab(j,i:C)-ab(i,i:C)*ab(j,i)/ab(i,i);%每一行消去首行元素
    end
end
x=zeros(R,1);%解空间
x(R,1)=ab(R,C)/ab(R,R);

fprintf("解为：")
for k=R-1:-1:1%假设R=3，C=4；k从2开始循环
    x(k)=(ab(k,C)-ab(k,k+1:R)*x(k+1:R))/ab(k,k);%反向替换
end
x
end
```

```matlab
A = 3×3    
     4    -1     3
     2     5     2
     1     2     4

b = 1×3    
     8     3    11

R = 3
C = 4
解为：
x = 3×1    
   -0.4328
   -0.4627
    3.0896

```


$$
(2)\left\{\begin{matrix} 
  4x_{1}+x_{2}+3x_{3}=9 \\  
  2x_{1}+4x_{2}-x_{3}=-5.\\
  x_{1}+2x_{2}-3x_{3}=-9
\end{matrix}\right.
$$

```matlab
A = 3×3    
     4     1     2
     2     4    -1
     1     1    -3

b = 1×3    
     9    -5    -9

解为：
x = 3×1    
     1
    -1
     3

```

##### 5.Find the parabola $y=Ax^{2}+Bx+C$ that passes throgh the points (1,4),(2,7) and (3,14).

**Solution**	Since the curve passer throgh these points,so we plug the points into the equation,
$$
\left\{\begin{matrix} 
  A+B+C=4 \\  
  4A+2B+C=7.\\
  9A+3B+C=14
\end{matrix}\right.
$$
By using the model in the fourth question,we have,

```matlab
A = 3×3    
     1     1     1
     4     2     1
     9     3     1

b = 1×3    
     4     7    14

解为：
x = 3×1    
     2
    -3
     5

```

So ,we have the A =  2, B = -3 , C =5 . thus, we use the matlab figuring 

<img src="G:\Numercial Analysis Exercise\作业\Numerical Analysis Exercise 4\fig.png" style="zoom:75%;" />

