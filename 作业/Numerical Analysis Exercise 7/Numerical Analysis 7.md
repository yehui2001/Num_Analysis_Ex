# Numerical Analysis 7

#### 1.Find the Lagrange polynomial that approximates $f(x)=x^3$.

###### (1) Find the linear interpolation polynomial $P_1(x)$ using the nodes $x_0=-1$ and $x_1=1$.

**Solution:**

According to the question, we can get   $f(x_0) = f(1) = 1,f(x_1) = f(-1) = -1 $.

Construct the Lagrange bases:
$$
L_{1,0}(x) = \frac{x-x_1}{x_0-x_1} = \frac{x-1}{-1-1} = -\frac{x-1}{2}\\
L_{1,1}(x) = \frac{x-x_0}{x_1-x_0} = \frac{x+1}{1-(-1)} = \frac{x+1}{2}
$$

$$
P_1(x)=f(x_0)L_{1,0}(x)+f(x_1)L_{1,1}(x)=x
$$

##### (2) Find the quadratic interpolation polynomial $P_2(x)$ using the the node $x_0=-1,x_1=0$ and $x_2=1$. 

**Solution:**

According to the question, we can get 

  $f(x_0) =f(-1) = 1,f(x_1)= f(0) = f(-1),f(x_2) = f(1) =1 $
$$
\begin{equation}
\begin{aligned}
L_{2,0}(x) &= \frac{(x-0)(x-1)}{(-1-0)(-1-1)}=\frac{x^2-x}{2}\\
L_{2,1}(x) &= \frac{(x+1)(x-1)}{(0+1)(0-1)}=1-x^2\\
L_{2,2}(x) &= \frac{(x+1)(x-0)}{(1+1)(1-0)}=\frac{x^2+x}{2}
\end{aligned}
\end{equation}
$$
Thus,
$$
P_2(x)=f(x_0)L_{2,0}(x)+f(x_1)L_{2,1}(x)+f(x_2)L_{2,2}(x)=x
$$

##### (3) Find the cubic interpolation polynomial $P_3(x)$ using the nodes $x_0=-1,x_1=0,x_2=1,x_3=2$.

**Solution:**

According to the question, we can get 
$$
f(x_0)=-1,f(x_1)=0,f(x_2)=1,f(x_3)=8
$$

$$
\begin{equation}
\begin{aligned}
L_{3,0}(x) &= \frac{(x-0)(x-1)(x-2)}{(-1-0)(-1-1)(-1-2)}=-\frac{x^3-3x^2+2x}{6}\\
L_{3,1}(x) &= \frac{(x+1)(x-1)(x-2)}{(0+1)(0-1)(0-2)}=\frac{x^3-2x^2-x+2}{2}\\
L_{3,2}(x) &= \frac{(x+1)(x-0)(x-2)}{(1+1)(1-0)(1-2)}=-\frac{x^3-x^2-2x}{2}\\
L_{3,3}(x) &= \frac{(x+1)(x-0)(x-1)}{(2+1)(2-0)(2-1)}=\frac{x^3-x}{6}
\end{aligned}
\end{equation}
$$

Thus,
$$
P_3(x)=f(x_0)L_{3,0}(x)+f(x_1)L_{3,1}(x)+f(x_2)L_{3,2}(x)+f(x_2)L_{3,3}=x^3
$$

#### 2.Let $f(x)=x+\frac{2}{x}$

##### (1) Use the quadratic interpolation polynomial based on the nodes $x_0=1,x_1=2$,and $x_2=2.5$ to approximate $f(1.5)$ and $f(1.2)$.

**Solution:**

we can easily get the $ f(x_0) = 1,f(x_1)= 2,f(x_2)=2.5$.

Let $ P(x) = a_2x^2 + a_1x + a_0.$ 

Then,
$$
\left\{\begin{matrix}
\begin{equation}
\begin{aligned}
a_2 + a_1 + a_0 &=1 \\
4a_2 + 2a_1 + a_0 &=2\\
6.25a_2 + 2.5a_1 +a_0 &= 2.5
\end{aligned}
\end{equation}
\end{matrix}\right.
$$
By solving the above equation , we get the $a_2 = 0.4,a_1 = -1.2,a_3 =3.8$.

So the $f(x) = P(x) = 0.4x^2-1.2x + 3.8$

$f(1.5) =2.9000 ,f(1.2) = 2.9360$.

##### (2) Use the cubic interpolation polynomial based on the nodes $x_0=0.5,x_1=1,x_2=2,$ and $x_3=2.5$ to approximate $f(1.5)$ and $f(1.2)$.

**Solution:**

we can easily get the $ f(x_0) = 4.5,f(x_1)= 1,f(x_2)=2,f(x_3) = 3.3$.

Let $ P(x) = a_3x^3+a_2x^2 + a_1x + a_0.$ 

Then,
$$
\left\{\begin{matrix}
\begin{equation}
\begin{aligned}
\frac{a_3}{8} + \frac{a_2}{4} + \frac{a_1}{2} + a_0 &=4.5 \\
a_3 + a_2 + a_1 + a_0 &=1\\
8a_3 + 4a_2 + 2a_1 + a_0 &=2\\
\frac{125a_3}{8} + \frac{25a_2}{4} + \frac{5a_1}{2} + a_0 &=3.3
\end{aligned}
\end{equation}
\end{matrix}\right.
$$
By solving the above equation, 

we get the $a_3 = -0.8,a_2 = 4.8, a_1 = -8.8, a_0 = 7.8$.

So the  $f(x) = P(x) = -0.8x^3+4.8x^2-8.8x + 7.8$

The image of the interpolation function is as follows,

![](G:\Numercial Analysis Exercise\Num_Analysis_Ex\作业\Numerical Analysis Exercise 7\fig2.png)

$f(1.5) =2.7000 ,f(1.2) = 2.7696$

#### 6. Let $f(x)=\sqrt{x}.$

###### (1) Compute the divided-difference table for $f$ based on the nodes $x_0=4,x_1=5,x_2=6,x_3=7,$ and $x_4=8.$

| $x_{i}$ |   $f[]$    |   $f[,]$    |  $f[,,]$   |  $f[,,,]$   |  $f[,,,,]$  |
| :-----: | :--------: | :---------: | :--------: | :---------: | :---------: |
|    4    |    0.9     |             |            |             |             |
|    5    |    0.72    |    -0.18    |            |             |             |
|    6    |    0.6     |    -0.18    |     0      |             |             |
|    7    | 0.51428571 | -0.08571429 | 0.04714286 | 0.01571429  |             |
|    8    |    0.45    | -0.06428571 | 0.01071429 | -0.01214286 | -0.00696429 |

##### (2) Write the Newton's interpolation polynomial $P_1(x),P_2(x),P_3(x)$ and $P_4(x).$

$$
\begin{equation}
\begin{aligned}
P_1(x)&=f(x_0)+f[x_0,x_1](x-x_0)=1.62-0.18x\\

P_2(x)&=P_1(x)+f[x_0,x_1,x_2](x-x_0)(x-x_1)=1.62-0.18x\\

P_3(x)&=P_2(x)+f[x_0,x_1,x_2,x_3](x-x_0)(x-x_1)(x-x_2)(x-x_3)
=0.01571429x^4-0.34571438x^3+2.81285791x^2-10.205717x+14.8200036\\

P_4(x)&=P_3(x)+f[x_0,x_1,x_2,x_3,x_4](x-x_0)(x-x_1)(x-x_2)(x-x_3)(x-x_4)
=-0.00696429x^5-0.22464299x^4-2.81803733x^3+17.2289382x^2-51.6014568x+61.6200324
\end{aligned}
\end{equation}
$$

##### (3) Evaluate the polynomials in part(1) at $x=4.5$ and $x=7.5$.

**Solution:**





##### (4) Compare the values in part(3) with the actual function value of $f(x)$.



