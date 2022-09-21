# Numerical Analysis Exercise 3

#### Problem1

##### (1).Use Theorem 2.2 to show that $g(x)=\pi+0.5\sin(x/2)$ has a unique fixed point on the interval [0,2$\pi$];

**Solution**	For x$\in$ [0,2$\pi$], the absolute minimum of $g$ occurs at $x=0$ and  $g(0)=\pi-0.5$, and the absolute maximum of $g$ occurs at $$x=\pi$$ and $g(\pi)=\pi+0.5$. So $g(x) \in [\pi-0.5,\pi+0.5]$ for all $x\in [0,2\pi]$. In addition, $g'$ is continuous and $|g'(x)| =\frac{1}{4}<1$ for $x\in[0,2\pi]$ .Therefor,$g$ satisfies all hypotheses of *Theorem 2.2* in $[0,2\pi]$ 

```matlab
p=zeros(1,20);

p(1)=pi;%初值

for i=1:19
    p(i+1)=pi+0.5*sin(p(i)/2);
end
p
```

```matlab
p = 1×20    
    3.1416    3.6416    3.6260    3.6270    3.6269    3.6269    3.6269    3.6269    3.6269    3.6269    3.6269    3.6269    3.6269    3.6269    3.6269    3.6269    3.6269    3.6269    3.6269    3.6269
```

![unique_fixed point](G:\Numercial Analysis Exercise\作业\Numerical Analysis Exercise 3\unique_fixed point.png)

This figure is the fixed points,it is easy to see that the points are convergent to  3.6294

##### (2).Use the fixed point iteration to find the approximation to the fixed point that is accurate to within $10^{-2}$.

**Solution**

```matlab
k=1/4;%g'(x)<=1/4;
Error=zeros(1,20);

for n=1:20
    Error(1,n)=k^n/(1-k)*abs(p(2)-p(1));
end

error=Error(Error<=1E-2)
```

```matlab
error = 0.00260416666666667	0.000651041666666667	0.000162760416666667	4.06901041666667e-05	1.01725260416667e-05	2.54313151041667e-06	6.35782877604167e-07	1.58945719401042e-07	3.97364298502604e-08	9.93410746256510e-09	2.48352686564128e-09	6.20881716410319e-10	1.55220429102580e-10	3.88051072756449e-11	9.70127681891123e-12	2.42531920472781e-12	6.06329801181952e-13
```

 #### Problem 2

##### Use Newton method to get the approximations to the following numbers respectively (accurate to within $10^{-4}$) and show your Matlab or Python code.

**Solution**	$f(x)=x^{2}-a,a\in[2,13]$	First, easy to know that $f(x) \in C^{2}$ .then, because $x$ is the  Prime Numbers in [2,13],so $f'(x)\neq0$,therefor,we can use the *Newton-Raphson method*

```matlab
clc,clear all

a=input("Please input the number:")
newtonsqrt(a,1e-4)

function approximation = newtonsqrt(a,accuracy) 
q=input("Please input the initial number:"); %设置初值
p=0.5*(q+a/q); 
while (abs(p-q)>=accuracy)
    q=p; %后一个值迭代到当前值
    p=0.5*(q+a/q);
end
p
end
```

```matlab
a = 5
p = 2.2361
```

