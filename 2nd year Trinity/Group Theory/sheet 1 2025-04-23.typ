#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Group Theory -- Sheet 1])
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


	
+ /* 1 */ Let $K normalsubgroup G$ and let $overline(H) lt.eq.slant G  slash  K$. Let $pi: G -> G  slash  K$ denote the quotient map $g |-> g K$. Show that $ 
		H=pi^(-1)(overline(H))={g in G: g K in overline(H)}
	 $ is a subgroup of $G$, containing $K$ as a normal subgroup, with $H  slash  K=overline(H)$. Show further that if $overline(H) normalsubgroup G  slash  K$ then $H normalsubgroup G$.
	
	
	
+ /* 2 */ The dihedral group $D_(2 n)$ has presentation $ 
		angle.l a, b mid(|) a^(n)=b^(2)=1, b a b^(-1)=a^(-1)angle.r.
	 $ Verify that this group has $2 n$ elements, all of the form $a^(i)$ or $b a^(i)$, and that $(b a^(i))^(2)=1$. Interpret this geometrically.
	
	
	
+ /* 3 */ Identify the following groups from their presentation:
	#parts[
		+ /* 3a */ $G_(1)=angle.l x mid(|) x^(6)=1 angle.r$;
			
		+ /* 3b */ $G_(2)=angle.l x, y mid(|) x y=y x angle.r$;
			
		+ /* 3c */ $G_(3)=angle.l x, y mid(|) x^(3) y=y^(2) x^(2)=x^(2) y angle.r$;
			
		+ /* 3d */ $G_(4)=angle.l x, y mid(|) x y=y x, x^(5)=y^(3) angle.r$ [_you may wish to consider the homomorphism $bb(Z)^(2) -> bb(Z)$ given by $(a, b) |-> 3 a+5 b$_];
			
		+ /* 3e */ $G_(5)=angle.l x, y mid(|) x y=y x, x^(4)=y^(2) angle.r$.
	]
	
	
	
+ /* 4 */ Let $G=angle.l x, y mid(|) x^(2)=y^(2)=1 angle.r$.
	#parts[
		+ /* 4a */ Let $z=x y$. Show that every element of $G$ can be written as $z^(k)$ or $y z^(k)$ where $k$ is an integer.
			
		+ /* 4b */ Deduce that $G$ is isomorphic to the _infinite dihedral group_ $D_(oo)$, namely the isometry group of the integers $bb(Z)$, considered as a subset of the real line with the Euclidean metric.
			
		+ /* 4c */ Show that $ 
				G=angle.l y, z mid(|) y^(2)=1, y z y^(-1)=z^(-1)angle.r.
			 $ is another presentation of the group.
	]
	
	
	
+ /* 5 */ Let $G$ be a non-Abelian group of order 8.
	#parts[
		+ /* 5a */ Show that $G$ has an element $a$ of order 4.
			
		+ /* 5b */ Let $A=angle.l a angle.r$ and let $b in G-A$. Show that $b a b^(-1)=a^(-1)$ and either $b^(2)=1$ or $b^(2)=a^(2)$.
			
		+ /* 5c */ #subparts[
				+ /* 5ci */ Deduce that there are, up to isomorphism, exactly two non-Abelian groups of order 8, and five groups of order 8 in total.
					
				+ /* 5cii */ Show that one of the non-Abelian groups may be identified with the quaternion group $ 
						Q_(8)={ plus.minus 1, plus.minus i, plus.minus j, plus.minus k},
					 $ where we have the usual quaternionic relations $ 
						i^(2)=j^(2)=k^(2)=-1 quad: quad i j=k=-j i.
					 $
			]
	]
	
	
	
+ /* 6 */ Write down all possible composition series of the following groups and verify the Jordan-Hölder Theorem for them: $ 
		C_(1 8), quad D_(1 0), quad D_(8), quad Q_(8).
	 $
	
	
	
+ /* 7 */ Let $H$ and $K$ be subgroups of a group $G$. Show that $ 
		H K={h k: h in H, k in K}
	 $ is a subgroup of $G$ if and only if $H K=K H$.
	
	
+ /* 8 */ Show that $(bb(Q),+)$ is not finitely generated.
	
	
	
+ /* 9 */ Let $G$ be a group all of whose non-identity elements have order 2. Show that $G$ is abelian. Give an example of a non-abelian group, all of whose non-identity elements have order 3.
