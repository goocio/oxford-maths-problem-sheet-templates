#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Integral Transforms -- Sheet 1\ Distributions, Laplace transform])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2024-07-26



	
+ /* 1 */ Let $phi.alt(x)$ be a test function. Show that the following are test functions:
	#parts[
		+ /* 1a */ $phi.alt(a x+b)$ where $a>0$ and $b in bb(R)$;
			
		+ /* 1b */ $f(x) phi.alt(x)$ where $f(x)$ is an arbitrary smooth function;
			
		+ /* 1c */ $phi.alt^((k))(x)$ where $k in bb(N)$.
	]
	
	
	
+ /* 2 */ #parts[
		+ /* 2a */ Let $0<a<1$. Solve the boundary-value problem: $ 
				f''(x)=delta(x-a), wide f(0)=f(1)=0.
			 $
			
		+ /* 2b */ Let $a>0$ and $k in bb(R)$. Solve directly the initial value problem $ 
				f''(x)-3 f'(x)+2 f(x)=k delta(x-a) wide f(0)=f'(0)=1
			 $
	]
	
	
	
+ /* 3 */ (_Kick Stop_) Consider a mass on a spring where the extension of the spring $x(t)$ satisfies $ 
		m dot.double(x)+k x=I delta(t-T),
	 $ where $m$ is the mass, and $k>0$ is the spring constant. Suppose initially $x(0)=a$ and $dot(x)(0)=0$ and that at time $t=T$ an instantaneous impulse $I$ is applied to the mass. Obtain the motion of the mass for $t>0$, and find conditions on $I$ and $T$ such that the impulse completely stops the motion. Explain the result physically.
	
	
	
+ /* 4 */ Show that, for $a != 0$, $ 
		delta(a x)=(1)/(|a|) delta(x)
	 $ [_Hint: use the approximating functions $delta_(n)$ from lectures._] What is $delta(x^(2)-a^(2))$?
	
	
	
+ /* 5 */ Solve the following IVPs using the Laplace transform:
	#parts[
		+ /* 5a */ $f'(x)+f(x)=x, wide f(0)=0$;
			
		+ /* 5b */ $f''(x)-f(x)=4 e^(x), wide f(0)=f'(0)=1$.
	]
	
	
	
+ /* 6 */ #parts[
		+ /* 6a */ Show that the Laplace transform of $x^(a)$, where $a>-1$ is a real number, is $Gamma(a+1)  slash  p^(a+1)$ where the Gamma Function is defined as $Gamma(s)=integral_(0)^(oo) t^(s-1) e^(-t) dif t$.
			
		+ /* 6b */ Find the Laplace transform of $(1-cos (a x))  slash  x$.
			
		+ /* 6c */ Find the Laplace transform of $integral_(0)^(x) (sin t)/(t) dif t$.
	]
	
	
	
+ /* 7 */ #parts[
		+ /* 7a */ Solve the IVP in Exercise 2(b) using the Laplace transform.
			
		+ /* 7b */ Use the Laplace transform to find a solution of $ 
				x f''(x)+2 f'(x)+x f(x)=0.
			 $ Find a second independent solution of the equation. Why was this solution not found using the Laplace transform?
	]
	
	
	
+ /* 8 */ A sequence of distributions $(F_(n))$ converges to a distribution $F$ if $angle.l F_(n), phi.alt angle.r -> angle.l F, phi.alt angle.r$ for all test functions $phi.alt$.
	#parts[
		+ /* 8a */ Show that if $F_(n) -> F$ then $F'_(n) -> F'$.
			
		+ /* 8b */ This limiting process applies to the partial sums ($n$ terms) of a series. Define $F(x)=x$ for $-pi<x<pi$, extended periodically to $bb(R)$. Show that its Fourier series is $ 
				F(x)=2 sum_(k=1)^(oo) ((-1)^(k+1))/(k) sin k x.
			 $ Differentiate [the partial sums of] both sides to find an expression for $sum_(k=1)^(oo)(-1)^(k+1) cos k x$; remember the discontinuities in $F(x)$. (Such a result has no counterpart in 'ordinary' analysis.)
			
		+ /* 8c */ Suppose that the integrable function $F(x)$ satisfies $integral_(-oo)^(oo) F(x) dif x=1$. (This implies that $lim_(X -> oo) integral_(X)^(oo) F(x) dif x=0$.) Define $F_(n)(x)=n F(n x)$. Draw a sketch to show how $F_(n)$ is related to $F$. Show that $ angle.l F_(n), phi.alt  angle.r -> phi.alt(0)$ as $n -> oo$. [_Hint: split the range of integration into $(-oo,-1  slash  sqrt(n)),(-1  slash  sqrt(n), 1  slash  sqrt(n)),(1  slash  sqrt(n), oo)$; use the note above on the outer intervals and the MVT for integrals on the inner one._] Deduce that $F_(n) -> delta$.
			
		+ /* 8d */ Suppose the random variable $X ~ N (0, sigma^(2))$ and write $G_(sigma)(x)$ for its density function. Let $F_(sigma)(x)=2 G_(2 sigma)(x)-G_(sigma)(x)$. Show that $F_(sigma)$ satisfies the conditions of part (c). What is $lim _(sigma -> 0^(+)) F_(sigma)$? Roughly sketch $F_(sigma)(x)$ for small $sigma$ and comment on your graph [_Hint: evaluate $F_(sigma)(0)$_]. Repeat for $F_(sigma)(x)=2 G_(3 sigma)(x)-G_(sigma)(x)$. What do you notice?
	]
