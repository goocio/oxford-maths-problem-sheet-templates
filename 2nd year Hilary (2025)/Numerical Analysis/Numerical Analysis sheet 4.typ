#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Numerical Analysis -- Sheet 4\ Solving initial value problems])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2024-07-26




	
+ /* 1 */ Consider the scalar IVP $y'=sin(x^(2)) y$, $y(0)=1$. Compute the approximation of $y(0.1)$ obtained using one step of the (i) explicit Euler method, (ii) implicit Euler method, and (iii) implicit Midpoint rule. (Below is a plot of the approximate solutions along with the exact one.)
	#align(center, image("images/sheet 4 q 1.jpg", width: 8cm))
	
	
	
+ /* 2 */ Consider the autonomous ODE $mb(y)'=mb(f)(mb(y))$ and compute the consistency order of the explicit Euler method.
	
	
	
+ /* 3 */ Write the formula of the stages $mb(k)_(1), mb(k)_(2), mb(k)_(3), mb(k)_(4)$ and express $mb(y)_(n+1)$ in terms of $mb(y)_(n), h$ and $mb(k)_(i)$ for the following Runge-Kutta method: #align(center, table(columns: 5, stroke: (x,y) => {
      if x == 0 {
        (right: (thickness: 1pt))
      }
      if y == 4 {
        (top: (thickness: 1pt))
      }
    },
    [0], [0], [0], [0], [0], 
    $1  slash  2$, $1  slash  2$, [0], [0], [0], 
    $1  slash  2$, [0], $1  slash  2$, [0], [0], 
    [1], [0], [0], [1], [0], 
    [], $1  slash  6$, $2  slash  6$, $2  slash  6$, $1  slash  6$
	)) Provide an upper bound of its consistency order.
	
	
	
+ /* 4 */ Write the Butcher table of the Runge-Kutta method defined by $ 
		mb(y)_(n+1)=mb(y)_(n)+(h)/(2) mb(f)(x_(n), mb(y)_(n))+(h)/(2) mb(f)(x_(n)+h, mb(y)_(n+1)) .
	 $ and determine its order of convergence.
	
	
	
+ /* 5 */ #parts[
		+ /* 5a */ Derive the formula of the stability function of the explicit Euler, implicit Euler, and the implicit midpoint rules.
			
		+ /* 5b */ Show that the implicit midpoint rule is $A$-stable. [_Hint: You could use the maximum principle for holomorphic functions._]
			
		+ /* 5c */ Show that the implicit Euler method is $L$-stable.
	]
	
	
	
+ /* 6 */ #parts[
		+ /* 6a */ Write the first and second characteristic polynomials of the explicit Euler, implicit Euler, and implicit trapezium rules.
			
		+ /* 6b */ Show that these methods are zero-stable.
			
		+ /* 6c */ Show that the implicit Euler and implicit trapezium rules are $A$-stable using the definition of stability domain of multistep methods.
	]
	
	
	
+ /* 7 */ Let $a, b in bb(R)$ be some fixed parameters. Show that the multistep methods described by $ 
		rho(z)=(z-1)(a z+1-a), wide sigma(z)=(z-1)^(2) b+(z-1) a+(z+1)  slash  2
	 $ are of order 2, and show that they are zero-stable if and only if $a >= 1  slash  2$.
	
	
	
+ /* 8 */ (Optional)
	#parts[
		+ /* 8a */ Prove that the stability function of any explicit $s$-stage Runge-Kutta method is a polynomial of degree at most $s$. [_Hint: show by induction that the $i$-th stage $k_(i)(z)$ is a polynomial in $z$ of degree at most $i$._]
			
		+ /* 8b */ Prove that the stability function of any explicit $s$-stage Runge-Kutta method of order $s$ is exactly $S(z)=sum_(j=0)^(s) (z^(j))/(j!)$.
	]
	
	
	
+ /* 9 */ (Optional)
	#parts[
		+ /* 9a */ Prove that a linear multi-step method has consistency order $p$ if and only if $sigma(1) != 0$ and $
        sum_(j=0)^(k) alpha_(j)=0 quad
         "and" quad
        sum_(j=0)^(k) alpha_(j) j^(q)=q sum_(j=0)^(k) beta_(j) j^(q-1) quad
         "for" quad
        q=1, dots, p.
			$
			
		+ /* 9b */ Show further that this condition is equivalent to $
			  rho(e^(h))-h sigma(e^(h))=cal(O)(h^(p+1)) .
			$
	]
