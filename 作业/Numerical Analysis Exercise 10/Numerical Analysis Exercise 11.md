# Numerical Analysis Exercise 10

![题目](https://pic1.imgdb.cn/item/635d2ff316f2c2beb1c254d3.jpg)

1.

```
clc
clear all
close all


for j = 1:5
    N = input("请输入切分梯形个数:");
    formatSpec = "切分梯形个数为:%d";
    fprintf(formatSpec,N)
    
    T = CT(0,1,N);
    
    %%求积分得1/(1+x^2) 
    pi = 4*T;
    pi = vpa(pi,12)
end

function T = CT(a,b,N)
h = (b-a)/N;
x = a:h:b;
y = 1./(1+x.^2);
T = y(1)+y(N);
for i = 2:N-1
    T = T + 2*y(i);
end
T = T*(h/2);
end

```

```matlab
切分梯形个数为:1000
pi = 3.13959148642
切分梯形个数为:10000
pi = 3.14139264192
切分梯形个数为:100000
pi = 3.14157265347
切分梯形个数为:1000000
pi = 3.14159065359
切分梯形个数为:10000000
pi = 3.14159245359
```

2.

```matlab
clc
clear all 
close all

for j = 1:5
M = input("请输入M:");
formatSpec = "切分梯形个数为:%d";
fprintf(formatSpec,2*M)

S = SP(0,1,M);
%%对1/(1+x^2)从0到1积分得为4/pi,故pi等于四倍的积分值
pi = 4*S;
pi = vpa(pi,12)
end

function S = SP(a,b,M)
h = (b-a)/(2*M);
x = a:h:b;
y = 1./(1+x.^2);
S = y(1)+y(2*M);

for i = 1:M-1
    S = S + 2*y(2*i)+4*y(2*i-1);
end
S = S + 4*y(2*M-1);
S = S*(h/3);

end


```

```matlab
切分梯形个数为:2000
pi = 3.14259240355
切分梯形个数为:20000
pi = 3.14169265109
切分梯形个数为:200000
pi = 3.14160265356
切分梯形个数为:2000000
pi = 3.14159365359
切分梯形个数为:20000000
pi = 3.14159275359
```

