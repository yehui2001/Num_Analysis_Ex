# Numerical Analysis Exercise 1

##### 3. Show that  $ f^{’}(x) $ is 0 at least once in the given intervals
###### (a)   $f(x) = 1-e^{x}+(e-1)\sin \frac{\pi }{2} x,[0,1]; $

**Proof**	there are  $ f(0)=f(1)=0$ ,  

According to the **Rolle's Theorem**

then, a number c in (0,1) exists with 
$$
f^{'}(c)=0.
$$
So that  $ f^{’}(x) $ is 0 at least once in the given intervals.

###### (b)   $ f(x)=x\sin \pi x-(x-2)\ln_{}{x} ,[1,2]; $

**Proof：**	there are  $f(1)=f(2)=0,$

According to the **Rolle's Theorem**

then, a number c in (1,2) exists with
$$
f'(c)=0.
$$
So that  $ f^{’}(x) $ is 0 at least once in the given intervals.

###### (c)   $f(x)=(x-2)(\sin x)\ln_{}({x+2}),[-1,3];$

**Proof：**  there are $ f(-2)=f(2)=0,$

According to the **Rolle's Theorem**

then, a number c in (-2,2) exists with
$$
f'(c)=0
$$
So that  $ f^{’}(x) $ is 0 at least once in the given intervals.

##### 4. Find the fourth Taylor polynomial $P_{4}(x)$for the function $f(x)=xe^{x}$ about $x_{0}=0$.

###### (a) Find an upper bound for$|f(x)-P_{4}(x)|$,for $0\le x\le 0.4$ .

**Solution：**	According to the Taylor theorem 

Thus we get 
$$
P_{4}(x)=f(0)+f'(0)x+\frac{f''(0)}{2!}x^{2} +\frac{f'''(0)}{3!}x^{3}+\frac{f^{4}(0)}{4!}x^{4}
$$
we easily calculate 
$$
f(0)=0,f'(0)=1,f''(0)=2,f'''(0)=3,f^{4}(0)=4
$$
So we have
$$
P_{4}(x)=x+x^{2}+\frac{1}{2}x^{3}+\frac{1}{6}x^{4}.
$$
Then we assume 
$$
h(x)=|f(x)-P_{4}(x)|=xe^{x}-x-x^{2}-\frac{1}{2}x^{3}-\frac{1}{6}x^{4}
$$
After we calculate by using **MatLab**,  we get the max of h(x) is **4.6321 e-04**

```matlab
x=0:0.01:0.4; 
y=x.*exp(x)-x-x.^2-1/2*x.^3-1/6*x.^4;
max(y)
```

###### (b) Approximate $\int_{0}^{0.4}f(x)dx$ using $\int_{0}^{0.}P_{4}(x)dx$.

**Solution：**	by using the result of (a)

We get
$$
P_{4}(x)=x+x^{2}+\frac{1}{2}x^{3}+\frac{1}{6}x^{4}.
$$
Thus,
$$
\int_{0}^{0.4}f(x)dx\approx\int_{0}^{0.4}P_{4}(x)dx=\int_{0}^{0.4}(x+x^{2}+\frac{1}{2}x^{3}+\frac{1}{6}x^{4})dx=0.104874666666667
$$
calculate code as follows

```matlab
syms x
ans=int(x+x^2+1/2*x^3+1/6*x^4,0,0.4);
vpa(ans,15)
```
##### 6. Perform the following computation: (i) exactly,(ii) using three-digit chopping arithmetic, and  (iii) using three-digit rounding arithmetic. Compute the relative errors in parts(ii) and (iii).

###### (a) $\frac{4}{5}+\frac{1}{3}  $

(i) $\frac{17}{15}$	(ii) 1.13	 (iii) 1.13

The relative errors in part (ii) is **0.2024**

The relative errors in part (iii) is **0.2024**

###### (b) $\frac{4}{5}\times\frac{1}{3}  $

(i) $\frac{4}{15}$	(ii) 0.266	(iii)0.266

The relative errors in part (ii) is **0.0025**

The relative errors in part (ii) is **0.0025**

###### (c) $(\frac{1}{3}-\frac{3}{11})+\frac{3}{20}$

(i)$\frac{139}{660}$	(ii) 0.211	(iii) 0.210	

The relative errors in part (ii) is **0.0019**

The relative errors in part (ii) is **0.0029**

###### (d) $(\frac{1}{3}+\frac{3}{11})-\frac{3}{20}$

(i)$\frac{301}{660}$	(ii) 0.455	(iii) 0.456

The relative errors in part (ii) is **0.0023**

The relative errors in part (iii) is **1.3289 e-04**

##### 7. Let $f(x) = \frac{x\cos x-\sin x}{x-\sin x} $

###### (a) Find $\lim_{x\to 0}f(x)$.

**Solution**	By using the L'Hospital's rule
$$
\lim_{x \to 0}f(x)=\lim_{x \to 0}\frac{\cos x-x\sin x-\cos x}{1-\cos x}=\lim_{x \to 0}\frac{-x\sin x}{1-\cos x}=\lim_{x \to 0}\frac{-\sin x-x\cos x}{\sin x}=\lim_{x \to 0}(-1-\frac{x \cos x}{\sin x})\\=-1-\lim_{x \to 0}\frac{\cos x}{\frac{\sin x}{x}}=-2
$$


**Solution**	

###### (b) Use four-digit rounding arithmetic to evaluate $f(0.1)$.

**Solution**	using four-digit rounding arithmetic, we have
$$
\sin(0.1)=0.09983,\cos(0.1)=0.9950
$$

$$
f(0.1)=\frac{0.1000*0.9950-0.09983}{0.1-0.09983}=-2.253
$$

###### (c) Replace each trigonometric function with its third Maclaurin polynomial and repeat part (b).

**Solution**	

The third Maclaurin polynomial for $ \sin x $ is as follows
$$
\sin x = x-\frac{x^{3}}{3!}+\frac{x^5}{5!}-\frac{x^7}{7!}
$$
The third Maclaurin polynomial for $ \cos x $ is as follows
$$
\cos x = 1-\frac{x^2}{2!}+\frac{x^4}{4!}-\frac{x^6}{6!}
$$

The Maclaurin polynomial  for $f(x)$ is as follows,
$$
f(x)= \frac{x\cos x-\sin x}{x-\sin x}= \frac{x(1-\frac{x^2}{2!}+\frac{x^4}{4!}-\frac{x^6}{6!})-(x-\frac{x^{3}}{3!}+\frac{x^5}{5!}-\frac{x^7}{7!})}{x-(x-\frac{x^{3}}{3!}+\frac{x^5}{5!}-\frac{x^7}{7!})}=\frac{-\frac{2x^3}{3}+\frac{x^5}{30}-\frac{8x^7}{5040}}{\frac{x^{3}}{3!}-\frac{x^5}{5!}+\frac{x^7}{7!}}
$$

$$
f(0.1)=-1.500
$$

###### (d) The actual value is $f(0.1)$ =-1.99899998.Find the relative error for the values obtained in parts(b) and (c).

the relative error for the values obtained in part (b) 
$$
e_{r}=\frac{|-1.99899998+2.253|}{|-1.99899998|}=0.1271
$$
the relative error for the values obtained in part (c)
$$
e_{r}=\frac{|-1.99899998+1.500|}{|-1.99899998|}=0.2496
$$

##### 8. Assume that the permissible relative error of the volume of a sphere is at most $10^{-2}$ .Determine the permissible relative error of its radius

**Solution**	According to the formula for the volume of the ball,
$$
V=\frac{4\pi r^3}{3}，V^{*}=\frac{4\pi (r^{*})^3}{3}
$$
Since the relative error of the volume of a sphere is at most $10^{-2}$.
$$
e_{r}=\frac{|V-V^{*}|}{|V|}\le10^{-2}
$$
So we have
$$
|V-V^{*}|\le 10^{-2}|V|\Rightarrow \frac{99}{100}V\le V^{*}\le\frac{101}{100}V\Rightarrow \frac{99}{100}r^3 \le (r^{*})^3\le\frac{101}{100}r^3
$$
Thus,
$$
\sqrt[3]{\frac{99}{100}}r\le r^{*}\le \sqrt[3]{\frac{101}{100}}r
$$

##### 9. The following approximations are all obtained by rounding arithmetic. Determine how many significant digits they have,respectively.

(a) $p^{*}_{1}=1.1021$;

(b) $p^{*}_{2}=0.031$;

(c)  $p^{*}_{3}=56.430$;

(d)  $p^{*}_{4}=7\times1.0$.

**Solution**	Rewriting $p^{*}_{1},p^{*}_{2},p^{*}_{3},p^{*}_{4}$ in the floating-point decimal form,respectively,gives
$$
p^{*}_{1}=0.11021\times10^{1}\\
p^{*}_{2}=0.31\times10^{-1}\\
p^{*}_{3}=0.56430\times10^{2}\\
p^{*}_{4}=0.70\times10^{1}\\
$$
Assume $p_{1}=1.10214$ or $p_{1}=1.102135$
$$
|p_{1}-p^{*}|=0.00004=0.4 \times10^{-4}\le5 \times10^{5} \\
|p_{1}-p^{*}|=0.000035=0.35 \times10^{-4}\le5 \times10^{5}
$$
the significant digits of $p_{1}$is **5**.

**In the same way**

the significant digits of $p_{2}$is **2**.

the significant digits of $p_{3}$is **5**.

the significant digits of $p_{4}$is **2**.
