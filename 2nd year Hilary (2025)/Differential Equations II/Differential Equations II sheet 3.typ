#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Differential Equations II -- Sheet 3\ Bessel functions, Legendre functions])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2024-09-10



	
+ /* 1 */ *Frobenius method.* Consider the differential equation $ 
		(x-1) y''(x)-x y'(x)+y(x)=0 .
	 $ Show that $x=1$ is a regular singular point, and determine the appropriate from of the series expansions about $x=1$ for two linearly independent solutions. By explicitly computing the coefficients in the series, find closed from expressions for the two linearly independent solutions.
	
	
	
+ /* 2 */ *The point $x=oo$.* Consider the differential equation $ 
		x^(3) y''(x)+y(x)=0 .wide (star)
	 $
	#parts[
		+ /* 2a */ Use the transformation of variables $x=1  slash  t$ to show that $(star)$ has a regular singular point at $x=oo$ and determine the indicial exponents.
			
		+ /* 2b */ Obtain the first Frobenius solution in the form of an infinite series in powers of $t$, solving explicitly for the coefficients.
			
		+ /* 2c */ Find the form of the second Frobenius solution and obtain (but do not attempt to solve) a recurrence relation for the coefficients in the series.
			
		+ /* 2d */ (Optional) Suppose we seek a particular solution to $(star)$ with the leading behaviour $y(x) ~ x$ as $x -> oo$. By considering the magnitude of the various terms in the two series solutions found above, determine the next largest term in the expansion of $y(x)$ for large positive $x$.
	]
	
	
	
+ /* 3 */ *Bessel functions.* Consider _Bessel's equation_ (of order $n$): $ 
		x^(2) y''(x)+x y'(x)+(x^(2)-n^(2)) y(x)=0,wide (star)
	 $ for integer $n >= 0$.
	#parts[
		+ /* 3a */ Find the indicial exponents $alpha_(1), alpha_(2)$ (with $op("Re") alpha_(1)>op("Re") alpha_(2)$) for the local series expansion of $(star)$ about $x=0$.
			
		+ /* 3b */ Determine the series $y(x)=sum_(k=0)^(oo) a_(k) x^(k+alpha_(1))$ that solves $(star)$, giving the coefficients $a_(k)$ in closed form. Find $a_(0)$ such that the series is the expansion of the Bessel functions of first kind, $ 
				J_(n)(x)=((x)/(2))^(n) sum_(k=0)^(oo) ((-x^(2)  slash  4 )^(k))/(k!(k+n)!).wide (hash)
			 $
			
		+ /* 3c */ Using $(hash)$, show that the following recursion relation is true for all integers $n >= 0$: $ 
				J_(n+1)(x)=(2 n)/(x) J_(n)(x)-J_(n-1)(x) .
			 $
			
		+ /* 3d */ For any integer $n >= 0$, show that $ 
				integral_(0)^(1) x[J_(n)(alpha x)]^(2) upright(space.nobreak d) x=(1)/(2)[J_(n)'(alpha)]^(2),
			 $ where $alpha$ is any zero of $J_(n)$. [_Hint: Substitute $z=alpha x$, integrate by parts, and use the fact that $J_(n)$ satisfies Bessel's equation._]
	]
	
	
	
+ /* 4 */ *Bessel functions in a Sturm-Liouville problem.*
	#parts[
		+ /* 4a */ Determine the bounded eigenfunctions $y_(k)$ and eigenvalues $lambda_(k)$ of the following singular Sturm=Liouville problem on $0 <= x <= 1$: $ 
				-(x y'(x))'=lambda x y(x), wide y(1)=0.
			 $ [_Hint: Use a change of variables of the form $r=beta x$._]
			
		+ /* 4b */ Use (a) to obtain the eigenfunction expansion for the bounded solution of the following inhomogeneous problem on $0 <= x <= 1$: $ 
				(x y'(x))'=x, wide y(1)=0 .
			 $ [_You may leave the coefficients $c_(k)$ in your final answer in terms of integrals containing Bessel functions._]
	]
	
	
	
+ /* 5 */ *Legendre functions and associated Legendre functions.* Consider Legendre's equation $ 
		(1-x^(2)) y''(x)-2 x y'(x)+(ell(ell+1)-(m^(2))/(1-x^(2))) y(x)=0
	 $ and let $P_(ell)^(m)(x)$ denote the solution for integers $0 <= m <= ell$. Show that $ 
		integral_(-1)^(1) P_(k)^(m)(x) P_(ell)^(m)(x)  space.nobreak dif x= cases(
			0  quad&  "if"  ell != k ,
			 (2)/((2 k+1)) ((k+m)!)/((k-m)!)  quad&  "if"  ell=k
		)
	 $ [_You may use without proof Rodrigues' formula for $P_(ell)^(m)(x)$ given in lectures, and also the identity $ 
		integral_(-1)^(1)(1-x^(2))^(ell)  space.nobreak dif x=(2^(2 ell+1)(ell!)^(2))/((2 ell+1)!)
	 $ (or for extra fun try to show this as well)._]
