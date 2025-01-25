#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Topology -- Sheet 4\ Simplicial complexes])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2025-01-13




	
+ /* 1 */ #parts[
		+ /* 1a */ Show that the following space (the 'Dunce hat') can be triangulated.
			#align(center, image("images/sheet 4 q 1 a.jpg", width: 5cm))
			
		+ /* 1b */ Show that the following subspace of $bb(R)^(2)$ cannot be triangulated: $ 
				{(x, y): 0 <= y <= 1,  "and"  x=0  "or"  1  slash  n,  "for some"  n in bb(N)} union([0,1] times{0})
			 $ [_Hint: It is helpful to show that, for any finite simplicial complex $K$, any point $x in|K|$ and any open set $U$ containing $x$, there is a connected open set $V$ such that $x in V subset.eq U$._]
	]
	
	
	
+ /* 2 */ Let $K$ be a simplicial complex (that need not be finite). Prove that $|K|$ is Hausdorff. [_Hint: Recall that a subset of $|K|$ is open if it intersects every simplex in an open set. Note also that the standard simplex has a natural metric as a subset of $bb(R)^(n)$._]
	
	
	
+ /* 3 */ Find an example of a connected, finite, simplicial complex $K$ that is not a closed combinatorial surface, but that satisfies the following three conditions:
	#parts[
		+ /* 3a */ It contains only 0-simplices, 1-simplices and 2-simplices.
			
		+ /* 3b */ Every 1-simplex is a face of precisely two 2-simplices.
			
		+ /* 3c */ Every point of $|K|$ lies in a 2-simplex.
	]
	
	
	
+ /* 4 */ A simple closed curve $C$ in a space $X$ is the image of a continuous injection $S^(1) -> X$. Find simple closed curves $C_(1)$, $C_(2)$, and $C_(3)$ in the Klein bottle $K$ such that
	#parts[
		+ /* 4a */ $K without C_(1)$ has one component, which is homeomorphic to an open annulus $S^(1) times(0,1)$.
			
		+ /* 4b */ $K without C_(2)$ has one component, which is homeomorphic to an open Möbius band. [_An open Möbius band is the space obtained from $[0,1] times(0,1)$ by identifying $(0, y)$ with $(1,1-y)$ for each $y in(0,1)$._]
			
		+ /* 4c */ $K without C_(3)$ has two components, each of which is homeomorphic to an open Möbius band.
	]
	
	
	
+ /* 5 */ The following polygon with side identifications is homeomorphic to which surface?
	#align(center, image("images/sheet 4 q 5.jpg"))
	
	
	
+ /* 6 */ Suppose that the sphere $bb(S)^(2)$ is given the structure of a closed combinatorial surface. Let $C$ be a subcomplex that is a simplicial circle. Suppose that $bb(S)^(2) without C$ has two components. Indeed, suppose that this is true for every simplicial circle in $bb(S)^(2)$. Let $E$ be one of these components. [_In fact, $bb(S)^(2) without C$ _must_ have 2 components, but we will not attempt to prove this._]\ Our aim is to show that $overline(E)$ is homeomorphic to a disc. This is a version of the Jordan curve theorem. [_The actual Jordan curve theorem is rather stronger than this. It deals with simple closed curves $C$ in $bb(S)^(2)$, which need to be simplicial. It states that $bb(S)^(2) without C$ has two components, and that, for each component $E$ of $bb(S)^(2) without C$, the closure of $E$ is homeomorphic to $bb(D)^(2)$, with the homeomorphism taking $C$ to $partial bb(D)^(2)$._]\ We'll prove this by induction on the number of 2-simplices in $overline(E)$. Our actual inductive hypothesis is: _There is a homeomorphism from $overline(E)$ to $bb(D)^(2)$, which takes $C$ to the boundary circle $partial bb(D)^(2)$._
	#parts[
		+ /* 6a */ Let $sigma_(1)$ be a 1 -simplex in $C$. Since $bb(S)^(2)$ is a closed combinatorial surface, $sigma_(1)$ is adjacent to two 2-simplices. Show that precisely one of these 2-simplices lies in $overline(E)$. Call this 2-simplex $sigma_(2)$.
			
		+ /* 6b */ Start the induction by showing that if $overline(E)$ contains at most one 2-simplex, then $overline(E)=sigma_(2)$.
			
		+ /* 6c */ Let $v$ be the vertex of $sigma_(2)$ not lying in $sigma_(1)$. Let's suppose that $v$ does not lie in $C$. Show how to construct a subcomplex $C'$ of $bb(S)^(2)$, that is a simplicial circle, and that has the following properties: 
				- $bb(S)^(2) without C'$ has two components;
				- one of these components $F$ is a subset of $E$;
				- $overline(F)$ contains fewer 2-simplices than $overline(E)$.
			 Show in this case that there is a homeomorphism from $overline(E)$ to $bb(D)^(2)$, which takes $C$ to the boundary circle $partial bb(D)^(2)$.
			
		+ /* 6d */ Suppose now that $v$ lies in $C$. How do we complete the proof in this case?
	]
