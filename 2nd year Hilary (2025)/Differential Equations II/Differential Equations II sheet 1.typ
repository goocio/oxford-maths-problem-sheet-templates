#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Differential Equations II -- Sheet 1\ Variation of parameters, Adjoint problems])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2024-09-10



	
+ /* 1 */ *Reduction of order and variation of parameters.* Define the operator $ 
		frak(L) y(x) equiv x^(2) y''(x)-x(x+2) y'(x)+(x+2) y(x), quad 1<x<2.
	 $
	#parts[
		+ /* 1a */ Check that $y(x)=x$ is a solution of $frak(L) y=0$, and use reduction of order to find the general solution.
			
		+ /* 1b */ Solve the following problem by variation of parameters: $ 
				frak(L) y(x)=x^(3), quad y(1)=0, quad y(2)=0 .
			 $
	]
	
	
	
+ /* 2 */ *The Green's function via variation of parameters.*
	#parts[
		+ /* 2a */ Use variation of parameters to solve the problem $ 
				y''(x)-2 y'(x)+2 y(x)=f(x), quad y(0)=0, quad y ((pi)/(2))=0, wide (star)
			 $ where $f$ is a given continuous function. Show that the solution can be written in the form $ 
				y(x)=integral_(0)^(pi / 2) g(x, xi) f(xi) dif xi,
			 $ for a function $g$ (the _Green's function_) which you should determine.
			
		+ /* 2b */ Evaluate the integral when $f(x)=e^(x)$ and check that the resulting expression for $y$ does indeed satisfy $(star)$.
	]
	
	
	
+ /* 3 */ *Variation of parameters for an Initial Value Problem.* Consider the inhomogeneous ODE $ 
		frak(L) y(x) equiv P_(2)(x) y''(x)+P_(1)(x) y'(x)+P_(0)(x) y(x)=f(x) wide (star)
	 $ for $x>0$, subject to initial conditions $y(0)=y'(0)=0$. Suppose that the homogeneous ODE $frak(L) y=0$ has linearly independent solutions $y_(1)$ and $y_(2)$ satisfying $y_(1)(0)=0$ and $y_(2)'(0)=0$. Use variation of parameters to construct the solution to $(star)$, and determine the Green's function $g$ such that $ 
		y(x)=integral_(0)^(oo) g(x, xi) f(xi) dif xi .
	 $
	
	
	
+ /* 4 */ *Adjoint problems.* For each of the problems below, use the adjoint relation $angle.l frak(L) y, w angle.r equiv angle.l y, frak(L)^(*) w angle.r$ to determine the differential operator and boundary conditions for the adjoint problem. In each case state whether the operator and/or the full system is self-adjoint.
	#parts[
		+ /* 4a */ $frak(L) y=y'', wide 2 y(0)+y'(0)=0, wide y(1)+y'(1)=0$.
			
		+ /* 4b */ $frak(L) y=y'', wide 2 y(0)+y'(1)=0, wide y(1)+y'(0)=0$.
			
		+ /* 4c */ $frak(L) y=y''''-y', wide y'(0)-y''(0)=0, wide y'''(0)=0, wide y(1)=0, wide y'(1)-y'''(1)=0$.
	]
	
	
	
+ /* 5 */ *Sturm-Liouville form.* Consider the general second order eigenvalue problem $ 
		frak(L) y(x) equiv A(x) y''(x)+B(x) y'(x)+C(x) y(x)=lambda y(x), wide a<x<b wide (star)
	 $ where $A(x), B(x), C(x)$ are given functions with $A(x) != 0$ for $x in[a, b]$.
	#parts[
		+ /* 5a */ Use an integrating factor to show that $(star)$ can always be put into Sturm-Liouville form, $ 
				hat(frak(L)) y(x) equiv-(p(x) y'(x))'+q(x) y(x)=lambda r(x) y(x)
			 $ where $p(x), q(x), r(x)$ should be determined in terms of $A(x), B(x), C(x)$.
			
		+ /* 5b */ Show that the operator $hat(frak(L))$ is self adjoint.
			
		+ /* 5c */ If $frak(L) y(x)=f(x)$ for some function $f$, what is the equivalent Sturm-Liouville problem?
	]
	
	
	
+ /* 6 */ *FAT and existence.* Determine the parameter values $(A, B)$ that yield existence of a solution for each of the following inhomogeneous BVPs.
	#parts[
		+ /* 6a */ For $0 <= x <= 2 pi$: $ 
				y''(x)+y(x)=A sin x+B cos x+2 sin (x+(pi)/(3))+sin ^(3) x, wide y(0)=y(2 pi), wide y'(0)=y'(2 pi).
			 $ [_Hint: Note the problem is fully self-adjoint._]
			
		+ /* 6b */ For $0 <= x <= 1$: $ 
				y''(x)+2 y'(x)+y(x)=1, wide y'(0)+y(0)=A, wide y'(1)+y(1)=3.
			 $ [_Hint: First find the homogeneous adjoint problem and note that it has solution $w(x)=e^(x)$._]
	]
