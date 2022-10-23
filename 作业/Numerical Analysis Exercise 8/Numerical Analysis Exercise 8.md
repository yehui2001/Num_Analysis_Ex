# Numerical Analysis Exercise 8

#### 1. A natural cubic spline S on [0,2], is defined by

$$
S(x)=\left\{\begin{array}{l}
S_{0}(x)=2 x^{3}-3 x+4, \quad 0 \leq x \leq 1 \\
S_{1}(x)=a(x-1)^{3}+b(x-1)^{2}+c(x-1)+3, \quad 1 \leq x \leq 2
\end{array}\right.
$$

Find a,b and c.

**Solution:** 	$ S(1) = S_0(1) = 2-3+4 = 3 = S_1(1) $

Due to the natural cubic spline S, So we have the Solutions as follows:
$$
\left\{\begin{matrix} 
\begin{equation}
\begin{aligned}
S''_0(0) &= S''_1(2) = 0\\
S''_0(1) &= S''_1(1) = 12\\
S'_0(1) &= S'_1(1)  = 1\\
\end{aligned}
\end{equation}
\end{matrix}\right.
$$

 a  =  -2 , b = 6，c  =  3.

#### 2.Curve fitting:

Find the power fits $y = Ax^2$ and $y = Bx^3$ for the following data and use $E_2(f)$ to determine which curve fits better.

###### (1)

| $x_k$ | 2.0  | 2.3  | 2.6  | 2.9  | 3.2  |
| :---: | :--: | :--: | :--: | :--: | :--: |
| $y_k$ | 5.1  | 7.5  | 10.6 | 14.4 | 19.0 |



```MATLAB
clc;
clear all;
N = 5;
Sum1 = 0;
Sum2 = 0;

x = [2.0,2.3,2.6,2.9,3.2];
y = [5.1,7.5,10.6,14.4,19.0];
%y_k = [5.9,8.3,10.7,13.7,17.0];

x_2 = x.^2;
x_3 = x.^3;

syms A1 A2

%%Ax^2
for i = 1:N
    Sum1 = Sum1+2*(A1*x_2(i)-y(i))*x_2(i);
end

sum1 =  sum(Sum1,2);
A1 = solve(sum1,A1);
A1 = double(A1)
E2_1 = 0;
for i = 1:N
    E2_1 = (A1*x_2(i)-y(i)).^2;
end
E2_1 = E2_1/N;
E2_1 = sqrt(E2_1)
%%Ax^3
for i = 1:N
    Sum2 = Sum2+2*(A2*x_3(i)-y(i))*x_3(i);
end


sum2 =  sum(Sum2,2);
A2 = solve(sum2,A2);
A2 = double(A2)
E2_2 = 0;
for i = 1:N
    E2_2 = (A2*x_3(i)-y(i)).^2;
end
E2_2 = E2_2/N;
E2_2 = sqrt(E2_2)

```

```matlab
A1 = 1.6866
E2_1 = 0.7734
A2 = 0.5902
E2_2 = 0.1512

```

​	It's is easy find that the $Ax^3$ better for (1).

###### (2)



| $x_k$ | 2.0  | 2.3  | 2.6  | 2.9  | 3.2  |
| ----- | ---- | ---- | ---- | ---- | ---- |
| $y_k$ | 5.9  | 8.3  | 10.7 | 13.7 | 17.0 |

```matlab
A1 = 1.6177
E2_1 = 0.1942
A2 = 0.5606
E2_2 = 0.6125
```

By using the code above, It's is easy find that the $Ax^2$ better for (2).

#### 2.

Find the power fits $y  = \frac{A}{x}$ and $y = \frac{A}{x^2}$ for the following data.

(1)

| $x_k$ | 0.5  | 0.8  | 1.1  | 1.8  | 4.0  |
| ----- | ---- | ---- | ---- | ---- | ---- |
| $y_k$ | 7.1  | 4.4  | 3.2  | 1.9  | 0.9  |
|       |      |      |      |      |      |

```matlab
clc;
clear all;
Sum1 = 0;
Sum2 = 0;

x = [0.5,0.8,1.1,1.8,4.0];
x = 1./x;
%y = [5.1,7.5,10.6,14.4,19.0]; 
y = [7.1,4.4,3.2,1.9,0.9];
x_2 = x.^2;

syms A1 A2
N = size(x,2);
%%A/x
for i = 1:N
    Sum1 = Sum1+2*(A1*x(i)-y(i))*x(i);
end

sum1 = sum(Sum1,2);
A1 = solve(sum1,A1);
A1 = double(A1)
E2_1 = 0;
for i = 1:N
    E2_1 = (A1*x_2(i)-y(i)).^2;
end
E2_1 = E2_1/N;
E2_1 = sqrt(E2_1)

%%A/x^2
for i = 1:N
    Sum2 = Sum2+2*(A2*x_2(i)-y(i))*x_2(i);
end

sum2 =  sum(Sum2,2);
A2 = solve(sum2,A2);
A2 = double(A2)
E2_2 = 0;
for i = 1:N
    E2_2 = (A2*x_2(i)-y(i)).^2;
end
E2_2 = E2_2/N;
E2_2 = sqrt(E2_2)

```

```
A1 = 3.5339
E2_1 = 0.3037
A2 = 2.0060
E2_2 = 0.3464
```

the power fits is $f_1= \frac{3.5339}{x},f_2 = \frac{2.006}{x^2}$

(2)

| $x_k$ | 0.7  | 0.9  | 1.1  | 1.6  | 3.0  |
| ----- | ---- | ---- | ---- | ---- | ---- |
| $y_k$ | 8.1  | 4.9  | 3.3  | 1.6  | 0.5  |

```matlab
A1 = 4.6013
E2_1 = 0.0050
A2 = 3.9755
E2_2 = 0.0261
```

the power fits is $f_1= \frac{4.6013}{x},f_2 = \frac{3.9755}{x^2}$.
