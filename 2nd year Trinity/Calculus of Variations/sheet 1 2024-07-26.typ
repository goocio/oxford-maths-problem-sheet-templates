#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Calculus of Variations -- Sheet 1])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Trinity Term 2025])

#let dv(num,denom) = $(dif num)/(dif denom)$
#let pdv(num,denom) = $(partial num)/(partial denom)$


	
+ /* 1 */ Find the extremals of the following functionals when $y$ is prescribed at $x=a$ and $x=b$:
	#parts[
		+ /* 1a */ $integral_(a)^(b)(y^(2)-(y')^(2)-2 y cos 2 x) dif x$;
			
		+ /* 1b */ $integral_(a)^(b) ((y')^(2))/(x^(3)) dif x$;
			
		+ /* 1c */ $integral_(a)^(b)(y^(2)+(y')^(2)-2 y e^(x)) dif x$.
	]
	
	
	
+ /* 2 */ Find the extremals of:
	#parts[
		+ /* 2a */ $integral_(0)^(1)(y^(2)+y'+(y')^(2)) dif x$ subject to $y(0)=0$, $y(1)=1$;
			
		+ /* 2b */ $integral_(0)^(1) ((y')^(2))/(x^(3)) dif x$ subject to $y(0)=1$, $y(1)=2$;
			
		+ /* 2c */ $integral_(0)^(1)(y')^(2) dif x+{y(1)}^(2)$ subject to $y(0)=1$. [_Hint: start from first principles by adapting the derivation of the Euler-Lagrange equation and natural boundary conditions in lectures, and in question 3._]
	]
	
	
	
+ /* 3 */ #parts[
		+ /* 3a */ Show that the problem of finding extremals of $ 
				J[y]=integral_(a)^(b) F(x, y, y') dif x
			 $ among all twice continuously differentiable functions $y$ for which $y(a)$ is prescribed, leads to the Euler-Lagrange equation $ 
				dv(,x) (pdv(F,y'))=pdv(F,y),
			 $ and to the natural boundary condition $ 
				lr(pdv(F,y')|)_(x=b)=0.
			 $
			
		+ /* 3b */ Find the extremal of $integral_(0)^(1) ((1)/(2) (y')^(2)+y y'+y'+y ) dif x$ among all functions $y$ with $y(0)=1$.
	]
	
	
	
+ /* 4 */ Consider the Euler-Lagrange equation of the functional $ 
		integral_(x_(0))^(x_(1)) F(x, y, y', y'') dif x .
	 $ Show that when $partial F  slash  partial y equiv 0$ the Euler-Lagrange equation has the first integral $ 
		pdv(F,y')-dv(x,) pdv(F,y'')= "constant" ,
	 $ and that when $partial F  slash  partial x equiv 0$ the Euler-Lagrange equation has the first integral $ 
		F-y'(pdv(F,y')-dv(,x) pdv(F,y''))-y'' pdv(F,y'')= "constant" .
	 $
	
	
	
+ /* 5 */ Find the extremals of the functional $ 
		integral_(0)^(pi  slash  2)((y')^(2)+(z')^(2)+2 y z) dif x
	 $ subject to the boundary conditions $ 
		y(0)=0, quad
		y ((pi)/(2) )=1, quad
		z(0)=0, quad
		z ((pi)/(2) )=1 .
	 $
