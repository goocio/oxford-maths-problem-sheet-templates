#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Group Theory -- Sheet 2])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Trinity Term 2025])

#let normalsubgroup = math.class("relation", move(dy: -.1em, stack(
  spacing: -.075em,
  math.lt.tri,
  line(
    angle: 25deg,
    length: .64em,
    stroke: (thickness: .05em, cap: "round"),
    start: (0.075em, 0em)
  )
)))


	
+ /* 1 */ Let $A_oo$ denote the even permutations of $NN$ which fix all but finitely many elements: that is $A_oo$ is the union $ 
		A_oo=union.big_(n=1)^oo A_n
	 $ where $A_n subset A_(n+1)$ in the natural way. Show that $A_oo$ is an infinite simple group.
	
	
	
+ /* 2 */ Let $G$ be a group and $[G, G]$ its commutator subgroup (derived subgroup).
	#parts[
		+ /* 2a */ Show that if $H normalsubgroup G$ and $G slash H$ is Abelian then $[G, G] lt.eq.slant H$.
			
		+ /* 2b */ Conversely, show that if $[G, G] lt.eq.slant H lt.eq.slant G$ then $H normalsubgroup G$ and $G slash H$ is Abelian.
	]
	
	
	
+ /* 3 */ A sequence $ 
		dots stretch(->)^(phi.alt_(i-2)) G_(i-1) stretch(->)^(phi.alt_(i-1)) G_i stretch(->)^(phi.alt_i) dots
	 $ of groups and homomorphisms is called exact at $G_i$ if $ 
		ker phi.alt_i=im phi.alt_(i-1)
	 $ Show that if $N normalsubgroup G$ then $ 
		1 -> N -> G -> G  slash  N -> 1
	 $ is exact at $N$, $G$ and $G  slash  N$, where the middle two maps are inclusion and the canonical quotient map.
	
	
	
+ /* 4 */ Verify Sylow's Theorems for the following groups: $ 
		S_3,space D_12,space A_4,space S_4 .
	 $
	
	
	
+ /* 5 */ Let $P$ be a non-trivial group of order $p^(m)$ where $p$ is prime (so $P$ is a '$p$-group').
	#parts[
		+ /* 5a */ By considering the conjugation action of $P$ on itself prove that the centre $ 
				Z(P)={z in P: z x=x z  "for all"  x in P}
			 $ is nontrivial.
			
		+ /* 5b */ Deduce, using induction on $m$, that $P$ is solvable. What can you say if $m=2$?
	]
	
	
	
+ /* 6 */ Show that every group of order 350 is solvable.
	
	
	
+ /* 7 */ Let $G$ be a group of order 30.
	#parts[
		+ /* 7a */ Show that either: (1) there is a normal subgroup $N$ of order 5 and a subgroup $H$ of order 3, or (2) there is a normal subgroup $N$ of order 3 and a subgroup $H$ of order 5. Deduce that $G$ has a normal subgroup $K$ isomorphic to $C_15$.
			
		+ /* 7b */ Let $y$ be a generator of $K$ and let $x$ be an order 2 element. Show that $ 
				G={x^i y^j: 0 lt.eq.slant i lt.eq.slant 1,space 0 lt.eq.slant j lt.eq.slant 1 4}
			 $
			
		+ /* 7c */ Let $psi in op("Aut")(K)$ satisfy $psi^2=i d_K$. Show that $psi: y |-> y^i$ where $i in{1,4,1 1,1 4}$.
			
		+ /* 7d */ Deduce that there are exactly four groups of order 30, up to isomorphism.
	]
	
	
	
+ /* 8 */ Find all groups of order 2023.
