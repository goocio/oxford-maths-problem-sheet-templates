#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Projective Geometry -- Sheet 1])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Trinity Term 2025])

+ /* 1 */ #parts[
		+ /* 1a */ If we identify $(x, y)$ with $[1: x: y]$, what is the point at infinity shared by all lines of the form $y=m x+c$, where $m$ is fixed?
			
		+ /* 1b */ Under the same identification, find any points at infinity of the conic $4 x^2+y^2-8 x-6 y-4 x y+9=0$. Classify the conic.
			
		+ /* 1c */ Show that those projective transformations in $op("PGL")(3, FF)$ which map the line at infinity to itself form a subgroup of $op("PGL")(3, FF)$ which is isomorphic to $ 
				A G L(2, FF)={mb(x) |-> A mb(x)+mb(b) mid(|) A in G L(2, FF), mb(b) in FF_"col"^2 }
			 $ Which of these mappings fix the line at infinity pointwise?
	]
	
	
	
+ /* 2 */ #parts[
		+ /* 2a */ Let $PP(U_1 )$ and $PP(U_2 )$ be two non-intersecting lines in the 3-dimensional projective space $RR PP^3=PP(RR^4)$. Show that $RR^4=U_1 plus.circle U_2$.
			
		+ /* 2b */ Deduce that three pairwise non-intersecting lines in $RR PP^3$ have infinitely many transversals, i.e. projective lines meeting all three.
	]
	
	
	
+ /* 3 */ Suppose that three lines $L, M, N$ in $PP^(n)$ intersect in pairs. Prove that the three lines are either concurrent (have a common point) or coplanar.
	
	
	
+ /* 4 */ #parts[
		+ /* 4a */ List the elements of $op("PGL")(2, FF_2 )$. What is the order of $op("PGL")(2, FF)$ if $|FF|=q$?
			
		+ /* 4b */ By considering the action of $op("PGL") (2, FF_2 )$ on $FF_2 PP^1$, show that $op("PGL") (2, FF_2 ) tilde.equiv S_3$. Is $op("PGL") (2, FF_3 ) tilde.equiv S_4$? Is $op("PGL") (2, FF_5 ) tilde.equiv S_6$?
	]
	
	
	
+ /* 5 */ Let $a, b, c, d$ be four distinct points in $CC$. Show that $a, b, c, d$ lie on a circline if and only if the cross-ratio $(a b: c d)$ is real.
	
	
	
+ /* 6 */ We say $x_0, x_1$ and $x_2, x_3$ are harmonically separated if $(x_0 x_1: x_2 x_3)=-1$, where the $x_(i)$ are distinct points in a projective line. Let $a, b, c, d$ be four points in general position in the real projective plane $RR PP^2$ and let $e, f, g$ be the diagonal points, i.e. $e=a c inter b d, f=a b inter c d, g=a d inter b c$. Let $g e$ meet $a b$ at $h$. Prove that $a, b$ and $h, f$ are harmonically separated.
	
	
	
+ /* 7 */ #parts[
		+ /* 7a */ Let $tau in op("PGL")(2, CC)$, other than the identity. Show that $tau$ fixes either one or two points. Show that this need not be true over other fields.
			
		+ /* 7b */ If $tau$ fixes two points, show that there is an inhomogeneous co-ordinate $z$ on $bb(C P)^1$ with respect to which $ 
				tau(z)=lambda z, quad lambda != 0,1
			 $ Is the same true over other fields?
			
		+ /* 7c */ Let $A_1, A_2, A_3$ be three distinct points in $bb(C P)^1$ and let $n gt.eq.slant 3$ be an integer. Show that there is $tau in op("PGL")(2, CC)$ such that $tau(A_1)=A_2, tau (A_2 )=A_3$ and $tau$ has order $n$.
	]
	
	
+ /* 8 */ Use the strategy outlined in the lectures to prove Pappus's Theorem: _Let $A, B, C$ and $A', B', C'$ be two collinear triples of distinct points in the projective plane. Then the three intersection points $A B' inter A' B$, $B C' inter B' C$, and $C A' inter C' A$ are collinear._ Proceed by the following steps.
	#parts[
		+ /* 8a */ Prove the theorem in the degenerate case when $A, B, C', B'$ are not in general position.
			
		+ /* 8b */ If these 4 points are in general position, explain why without loss of generality we may take them to be $ 
				A=[1,0,0], quad B=[0,1,0], quad C'=[0,0,1], quad B'=[1,1,1] .
			 $
	]
	
	
	
+ /* 9 */ (Optional) Every line in the real affine plane $RR^2$ can be written in the form $a x+b y+c=0$ where $a, b$ are not both zero. Of course, $lambda a x+lambda b y+lambda c=0$ is an equation of the same line where $lambda != 0$. Hence the space of lines can be identified with $ 
		M=(RR^2 without{(0,0)} times RR)/(RR^(*))
	 $ Identify $M$ as a subspace of $RR^2$. What is the topology of $M$?
