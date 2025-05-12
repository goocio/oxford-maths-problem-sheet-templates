#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Projective Geometry -- Sheet 2])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Trinity Term 2025])

+ /* 1 */ Write down the dual of Pappus' Theorem.
	
	
	
+ /* 2 */ Let $P_0, P_1, P_2, P_3$ be four distinct points in a projective plane $bb(P)(V)$. Show that $P_0, P_1, P_2, P_3$ are in general position if and only if the lines $P_0 P_1, P_1 P_2, P_2 P_3, P_3 P_0$ are in general position in $bb(P)(V^(*))$.
	
	
	
+ /* 3 */ Use general position arguments to show that given five points in the projective plane, such that no three are collinear, there is a unique conic through these five points.
	
	
	
+ /* 4 */ Let $C, D$ be conics in a projective plane $bb(P)(V)$, where $V$ is a 3 -dimensional real vector space, and suppose that $C inter D={p_1, p_2, p_3, p_4}$, where $p_1, dots, p_4$ are distinct points in $bb(P)(V)$.
	#parts[
		+ /* 4a */ Show that $p_1, dots, p_4$ are in general position. Prove that there exist homogeneous coordinates $[x_0: x_1: x_2]$ on $bb(P)(V)$ for which $ 
				p_1=[1: 1: 1], quad p_2=[1:-1: 1], quad p_3=[1: 1:-1], quad p_4=[1:-1:-1] .
			 $
			
		+ /* 4b */ Show that any conic through $p_1, dots, p_4$ has equation $ 
				lambda x_0^2+mu x_1^2+nu x_2^2=0
			 $ where $lambda+mu+nu=0$.
			
		+ /* 4c */ Find four projective transformations $tau$ of $bb(P)(V)$ that form a group, and for which $tau(C)=C$ and $tau(D)=D$.
	]
	
	
	
+ /* 5 */ Let $F (x_0, x_1, x_2 )$ be a homogeneous polynomial of degree $n$. Let $cal(C)$ be the set of points $mb(a)=[a_0, a_1, a_2]$ in $bb(R P)^2$ such that $F(a_0, a_1, a_2)=0$. Provided that $nabla F(mb(a)) != mb(0)$, the tangent line to $cal(C)$ at $mb(a)=[a_0, a_1, a_2]$ is the line $ 
		x_0 (partial F)/(partial x_0)(mb(a))+x_1 (partial F)/(partial x_1)(mb(a))+x_2 (partial F)/(partial x_2)(mb(a))=0
	 $ in $bb(R P)^2$ and $mb(a)$ is said to be singular if $nabla F(mb(a))=mb(0)$.
	#parts[
		+ /* 5a */ Show that a lies on the tangent line to a.
			
		+ /* 5b */ Given a $3 times 3$ symmetric real matrix $B$ its associated conic is the set of solutions to the equation $mb(x)^(T) B mb(x)=0$ where $mb(x)=[x_0: x_1: x_2]$ and the conic is said to be singular if $B$ is singular. Show that a conic is singular if and only if it has a singular point.
			
		+ /* 5c */ Sketch the curves $y^2=x^3$ and $y^2=x^2(x+1)$ in $bb(R)^2$. What singular points do these curves have? Show that $y=x^3$ has a singular point at infinity.
	]
	
	
	
+ /* 6 */ Find all rational numbers $x, y$ such that $x^2+y^2-x y=1$.
	
	
	
+ /* 7 */ Let $V$ be a 3-dimensional real vector space and suppose that $L_0, L_1, L_2, L_3$ are four lines in the projective plane $bb(P)(V)$ all intersecting in a common point $x$. Explain why:
	#parts[
		+ /* 7a */ if $L$ is a line in $bb(P)(V)$ that does not pass though $x$, but intersects $L_(i)$ in a point $x_(i)$ (so $x_0, x_1, x_2, x_3$ are four distinct collinear points), then the cross-ratio $(x_0 x_1: x_2 x_3 )$ is independent of the choice of $L$;
			
		+ /* 7b */ the cross-ratio defined in (a) equals the cross-ratio $(L_0 L_1: L_2 L_3)$ formed by regarding $L_0, L_1, L_2, L_3$ as collinear points of the dual projective plane $bb(P)(V^(*))$.
	]
