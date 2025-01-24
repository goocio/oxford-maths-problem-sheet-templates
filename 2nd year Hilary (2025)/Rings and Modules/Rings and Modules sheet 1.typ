#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Rings and Modules -- Sheet 1\ Rings, Ideals])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2025-01-12




	
+ /* 1 */ Let $C(bb(R))$ denote the set of continuous functions $bb(R) -> bb(R)$.
	#parts[
		+ /* 1a */ Show that it is a ring with the usual operations of addition and multiplication of functions. What are the zero-divisors?
			
		+ /* 1b */ How do your answers change if we consider instead the ring $cal(O)$ of holomorphic functions $bb(C) -> bb(C)$?
	]
	
	
	
+ /* 2 */ Show that the set of rational numbers with an odd denominator is a subring of $bb(Q)$. What are the units? What are the ideals?
	
	
	
+ /* 3 */ Show that a finite integral domain is a field.
	
	
	
+ /* 4 */ Which of the following $I_(k)$ are ideals in the polynomial ring $bb(R)[x]$? If $I_(k)$ is an ideal, find a generator, i.e. an element $p_(k)$ such that $I_(k)= angle.l p_(k) angle.r$.
	#parts[
		+ /* 4a */ $I_(1)={f(x) in bb(R)[x]: f(2)=0}$,
			
		+ /* 4b */ $I_(2)={f(x) in bb(R)[x]: f'(2)=0}$,
			
		+ /* 4c */ $I_(3)={f(x) in bb(R)[x]: f(2)=f(3)=0}$,
			
		+ /* 4d */ $I_(4)={f(x) in bb(R)[x]: f(2)=f'(2)=0}$.
	]
	
	
	
+ /* 5 */ Let $R$ be a commutative ring with 1 such that the only ideals are ${0}$ and $R$ itself. Show that $R$ is a field.
	
	
	
+ /* 6 */ Let $I$ and $J$ be ideals in a commutative ring $R$. Show that $I J subset.eq I sect J$ and that we have equality if $I+J=R$ (i.e. if $I, J$ are coprime). Does equality hold in general?
	
	
	
+ /* 7 */ Define $ 
		bb(H)={mat(
			x , y ;
			-overline(y) , overline(x)
		): x, y in bb(C)}.
	 $ Show that $bb(H)$ is a ring, with usual matrix addition and multiplication. Is it commutative? Show that every nonzero element has a multiplicative inverse.
	
	
	
+ /* 8 */ #parts[
		+ /* 8a */ Find all solutions $x in bb(Z)$ to the simultaneous congruences $x equiv 8 mod 1 7$ and $x equiv 3 mod 9$.
			
		+ /* 8b */ Find a general formula for solving the simultaneous congruences $ 
				x equiv a_(i) mod n_(i) quad: quad i=1, dots r
			 $ where $(n_(i), n_(j))=1$ for $i != j$.
	]