#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Numerical Analysis -- Sheet 3\ Orthogonal polynomials, Best approximation, Quadrature])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2024-07-26




	
+ /* 1 */ For each of the following, say if it defines a norm on $C^(1)[a, b]$ (the vector space of continuously differentiable functions on $[a, b]$), and if not, why not:
	#parts[
		+ /* 1a */ $abs(integral_(a)^(b) f(x) dif x)$;
			
		+ /* 1b */ $max_(x in[a, b])|f(x)+f'(x)|$;
			
		+ /* 1c */ $max_(x in[a, b])[f(x)]^(2)$;
			
		+ /* 1d */ $max_(x in[a, b]){|f(x)|+|f'(x)|}$.
	]
	
	
	
+ /* 2 */ Calculate the orthogonal polynomials $phi.alt_(0), phi.alt_(1), phi.alt_(2)$ in the inner product space defined by $ 
		angle.l f, g angle.r=integral_(0)^(2) x f(x) g(x) dif x.
	 $
	
	
	
+ /* 3 */ Calculate the best approximation to $x^(3)$ on $[0,2]$ from $Pi_(2)$ in the norm derived from the inner product as above, $ 
		integral_(0)^(2) x f(x) g(x) dif x=angle.l f, g angle.r .
	 $ [_If you like you can use Matlab or Python for solving linear systems._]
	
	
	
+ /* 4 */ By considering $||f-(p+epsilon q)||^(2)$ where $epsilon in bb(R), q in Pi_(n)$, show that if $p in Pi_(n)$ is a best approximation to $f$ in this norm with associated inner product $angle.l dot.c, dot.c angle.r$ then $angle.l f-p, q angle.r=0$ for any $q in Pi_(n)$.
	
	
	
+ /* 5 */ If ${phi.alt_(0), phi.alt_(1), dots, phi.alt_(n), ...}$ are orthogonal polynomials in $angle.l dot.c, dot.c angle.r$ which are normalised to be monic (i.e. have leading coefficient equal to 1) show that $||phi.alt_(k)|| <=||q||$ for all monic polynomials $q in Pi_(k)$ which are of exact degree $k$ where $||dot.c||$ is the norm derived from the inner product.
	
	
	
+ /* 6 */ Let $mu_(j)=integral_(a)^(b) x^(j) w(x) dif x$ be the $j$th _moment_ of the weight distribution $w(x)$. Show that the linear system of equations $ 
		mat(delim: "[",
			mu_(0) , mu_(1) , dots.c , mu_(n-1) ;
			mu_(1) , mu_(2) , dots.c , mu_(n) ;
			dots.v , dots.v , dot.double(s) , dots.v ;
			mu_(n-1) , mu_(n) , dots.c , mu_(2 n-2)
		)mat(delim: "[",
			c_(0) ;
			c_(1) ;
			dots.v ;
			c_(n-1)
		)=mat(delim: "[",
			mu_(n) ;
			mu_(n+1) ;
			dots.v ;
			mu_(2 n-1)
		)
	 $ has as solution the coefficients of a polynomial $x^(n)-sum_(j=0)^(n-1) c_(j) x^(j)$, which is a member of the family of orthogonal polynomials associated with the weight function $w$.
	
	
	
+ /* 7 */ Let $p(x)=sum_(k=0)^(n) c_(k) phi.alt_(k)(x)$ where ${phi.alt_(k)}_(k=0)^(n)$ are the _orthonormal_ Legendre polynomials on $[-1,1]$.
	#parts[
		+ /* 7a */ What is $integral_(-1)^(1) p(x) dif x$?
			
		+ /* 7b */ What is the best degree-$k$ polynomial approximant to $p$ in the $L_(2)$-norm? (i.e., the minimiser of $integral_(-1)^(1)(p(x)-q_(k)(x))^(2) dif x$ over $q_(k) in Pi_(k)$)
	]
	
	
	
+ /* 8 */ Let $f:[a, b] -> bb(R)$ be a real continuous function. Consider finding the best degree-$k$ polynomial approximant $p_(k)$ to $f$ on $[a, b]$ in the $L_(oo)$-norm (also known as minimax approximation). The solution is known to have a beautiful "equioscillation" property. For example, below is the error $exp (x)-p_(1 0)(x)$ of the degree 10 minimax polynomial approximant to the exponential function on $[-1,1]$.
	#align(center, image("images/sheet 3 q 8.jpg", width: 12cm))
	Make this precise by proving that equioscillation implies optimality: If $f-p_(k)$ has $k+2$ extrema $(a <=)x_(1)<x_(2)<dots.c<x_(k+2)(<= b)$ with alternating signs, i.e., $f (x_(i))-p_(k)(x_(i))=$ $(-1)^(i+sigma)||f-p_(k)||_(oo)$ where $sigma=0$ or 1, then $p_(k)$ is a minimax polynomial approximant of degree $k$ to $f$. [_Note: such computation can be done conveniently using Chebfun as e.g._ `f = chebfun(@(x)exp(x)); p = minimax(f,10); plot(f-p)`_. Note also that the equioscillation condition is in fact necessary and sufficient._]
	
	
	
+ /* 9 */ _Simpson's Rule_ is a quadrature rule based on taking three sample points (endpoints $x_(0), x_(2)$ and the center $x_(1)$), finding the quadratic polynomial interpolant, and integrating it.
	#parts[
		+ /* 9a */ Show that Simpson's rule applied to $I=integral_(x_(0))^(x_(2)) f(x) dif x$ gives the approximation $I approx (x_(1)-x_(0))/(3)[f(x_(0))+4 f(x_(1))+f(x_(2))]$.
			
		+ /* 9b */ Show further that Simpson's rule is exact if $f$ is a cubic polynomial.
	]
	
	
	
+ /* 10 */ (Optional:) Let $f$ be a polynomial of degree $2 n+1$, expressed as $f(x)=sum_(i=0)^(2 n+1) c_(i) P_(i)(x)$, where ${P_(i)(x)}_(i=0)^(2 n+1)$ are orthonormal polynomials satisfying $integral_(-1)^(1) P_(i)(x) P_(j)(x) dif x=delta_(i j)$ (i.e., scaled Legendre polynomials).
	#parts[
		+ /* 10a */ Explain how to compute $c_(0)$ exactly by sampling $f$ at $n+1$ points.
			
		+ /* 10b */ Explain how to compute $c_(1)$ exactly by sampling $f$ at $n+2$ points.
	]
