# Numerical Analysis Exercise 2

###### 2. Use the bisection method to find $p_{3}$ for $f(x)=\sqrt{x}-\cos x=0$ in [0,1].

```matlab
%%2.2寻找p3
clear all
clc
syms x;
n=0;%迭代次数
a=0;b=1; x0=0; p=x0;
while (n~=3) 
    if(f(p)==0)
        x0=p;
        break;
    end
    if(f(a)*f(p)<0)
        b=p;
        p=(a+b)/2;
    else
        a=p;
        p=(a+b)/2;
    end
    x0=p;
    n=n+1;
end
p
n
function f=f(x)
f=x^(1/2)-cos(x);
end
```

```matlab
p = 0.6250
n = 3
```



###### 3. Use the bisection method to find solutions accurate to $10^{-4}$ for the following problem:

###### (1) $x^3-2^{-x}=0$,for $0\le x \le 1$;

```matlab
%%定义的函数
function z=f_Bis(f,a,b,accurate)
x0=0;
p=x0;
n=0;
z=0;
persistent x;
while (abs(f(p)-0)>accurate) 
    if(f(p)==0)
        x0=p;
        break;
    end
    if(f(a)*f(p)<0)
        b=p;
        p=(a+b)/2;
    else
        a=p;
        p=(a+b)/2;
    end
    x0=p;
    n=n+1;
end
x0
n
end
```

```matlab
%%调用函数
y = @f
z = f_Bis(y,0,1,1e-4);
function y = f(x)
y=x^3-2^(-x);
end
```

```
x0 = 0.8262
n = 14
```

#####  4.Find an approximation to $\sqrt{3}$ correct to within $10^{-4}$ using the bisection method. 

#####  [Hint:Consider $f(x)=x^{2}-3$]

```matlab
%%调用函数
y = @f
z = f_Bis(y,0,2,1e-4);
function y = f(x)
y=x^2-3;
end
```

```matlab
x0 = 1.7321
n = 14
```

