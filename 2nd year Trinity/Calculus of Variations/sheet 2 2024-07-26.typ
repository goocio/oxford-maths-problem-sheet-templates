#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Calculus of Variations -- Sheet 2])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Trinity Term 2025])

#let dv(num,denom) = $(dif num)/(dif denom)$
#let pdv(num,denom) = $(partial num)/(partial denom)$


	
+ /* 1 */ It is required to find an extremal of the functional $ 
		integral_(a)^(b) F(x, y(x), y'(x), y''(x)) dif x
	 $ among all smooth functions $y(x)$ that satisfy the boundary conditions $ 
		y(a)=y(b)=0 .
	 $ Show that such an extremal must be a solution of the differential equation $ 
		pdv(F,y)-dv(,x) (pdv(F,y'))+(dif^2)/(dif x^2)(pdv(F,y''))=0,
	 $ and must satisfy the natural boundary conditions $ 
		pdv(F,y'')=0 quad
		 "at"  quad
		x=a quad
		 "and"  quad
		x=b.
	 $
	
	
	
+ /* 2 */ An elastic beam has vertical displacement $y(x)$ for $x in[0, l]$. The $x$-axis is horizontal and the $y$-axis is vertical and directed upwards. The ends of the beam are supported, meaning $y(0)=y(l)=0$, and the displacement minimizes the energy $ 
		integral_(0)^(l) {(1)/(2) D[y''(x)]^(2)+rho g y(x)} dif x,
	 $ where $D$, $rho$, and $g$ are positive constants. Write down the differential equation and the boundary conditions that $y(x)$ must satisfy, and show that $ 
		y(x)=-(rho g)/(2 4 D) x(l-x)(l^(2)+x(l-x)) .
	 $
	
	
	
+ /* 3 */ Find an extremal of the functional $ 
		integral_(-1)^(1) y dif x
	 $ subject to the boundary conditions $y(-1)=y(1)=0$, and the constraint $ 
		integral_(-1)^(1)(y^(2)+(y')^(2)) dif x=1 .
	 $
	
	
	
+ /* 4 */ #parts[
		+ /* 4a */ Suppose that $F: bb(R)^(7) -> bb(R)$ is a $C^(2)$-function, and that $u: bb(R)^(3) -> bb(R)$ is a $C^(2)$-function that gives a stationary value of the integral $ 
				integral.triple limits_(V) F(x, y, z, u, u_(x), u_(y), u_(z)) dif x dif y dif z
			 $ and satisfies $u=f$ on the smooth simple closed surface $partial V$ that bounds the open set $V$ in $bb(R)^(3)$. Show that $u$ satisfies the Euler-Lagrange equation $ 
				pdv(,x) (pdv(F,u_(x)))+pdv(,y) (pdv(F,u_(y)))+pdv(,z) (pdv(F,u_(z)))=pdv(F,u).
			 $
			
		+ /* 4b */ Let $V={(x, y, z) in bb(R)^(3): x^(2)+y^(2)+z^(2)<1}$ be the interior of the unit sphere. Find the function $u=u(x, y, z)$ that minimizes the integral $ 
				integral.triple limits_(V)(u_(x)^(2)+u_(y)^(2)+u_(z)^(2)) dif x dif y dif z,
			 $ subject to the constraint $ 
				integral.triple limits_(V) u dif x dif y dif z=4 pi,
			 $ and the boundary condition that $u=1$ on $partial V$.
	]
	
	
	
+ /* 5 */ Let $p$ be a positive real-valued differentiable function on the bounded interval $[a, b]$, and let $q$ and $r$ be positive real-valued continuous functions on $[a, b]$.
	#parts[
		+ /* 5a */ Show that the extremals of $ 
				J(y)=integral_(a)^(b)(p (y')^(2)+q y^(2)) dif x
			 $ subject to the constraint $ 
				integral_(a)^(b) r y^(2) dif x=1
			 $ must satisfy the differential equation $
        (p y')'+(-q+lambda r) y=0, wide (A)
			$ for some constant $lambda$, and satisfy the boundary conditions $p y'=0$ at $x=a$ and $x=b$.
			
		+ /* 5b */ Show that if $y_(1)$ and $y_(2)$ are solutions to (A) with $lambda=lambda_(1)$ and $lambda=lambda_(2)$ respectively, and $lambda_(1) != lambda_(2)$, then $
        integral_(a)^(b) r y_(1) y_(2) dif x=0. wide (B)
			$
			
		+ /* 5c */ Find the extremals of $integral_(0)^(pi) (y')^(2) dif x$ subject to $integral_(0)^(pi) y^(2) dif x=1$, and the corresponding values of $lambda$. Verify that these extremals satisfy the condition (B).
	]
