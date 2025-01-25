#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Topology -- Sheet 3\ Compactness, Quotient spaces])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2025-01-13




	
+ /* 1 */ Let $dif$ be one of the metrics $dif_(1)$, $dif_(2)$, $dif_(oo)$ on $bb(R)^(n)$. Let $K$ be a non-empty compact subset of $bb(R)^(n)$, and let $F$ be a non-empty closed subset of $bb(R)^(n)$. We define $ 
		op("dist")(K, F)=inf {dif(x, y): x in K, y in F}
	 $ Prove that there exists $a in K$ and $b in F$ such that $dif(a, b)=op("dist")(K, F)$.
	
	
	
+ /* 2 */ Let $(X, cal(T))$ be a topological space and let $C=X union{oo}$ where $oo$ denotes some extra point not in $X$. Let $cal(T)'$ denote the union of $cal(T)$ with all subsets of $C$ of the form $V union{oo}$ where $V subset.eq X$ and $X without V$ is compact and closed in $X$.
	#parts[
		+ /* 2a */ Prove that $(C, cal(T)')$ is a compact topological space containing $(X, cal(T))$ as a subspace. This is called the _one-point_ (or the _Alexandrov_) _compactification_ of $X$.
			
		+ /* 2b */ Prove that the one-point compactification of $bb(R)^(2)$ is homeomorphic to the 2-sphere.
	]
	
	
	
+ /* 3 */ Let $l^(oo)$ be the space of bounded sequences of real numbers, endowed with the norm $||mb(x)||_(oo)=sup _(n in bb(N))|x_(n)|$, where $mb(x)=(x_(n))_(n in bb(N))$. Prove that the closed unit ball of $l^(oo)$, $B'(mb(0), 1)={mb(x) in l^(oo): ||mb(x)||_(oo) <= 1 }$, is not compact. (Thus, $B'(mb(0), 1)$ is a closed bounded subset in a complete normed vector space which is not compact.) [_Hint: The equivalence between compactness and sequential compactness in the setting of metric spaces may be assumed._]
	
	
	
	// NOTE: this question had sect.big K_n not union.big K_n, which is nonsense (since then we'd need each K_n=bb(R)^n so trivially they *all* have non-empty interior) so I've assumed it was a mistake
+ /* 4 */ Let $O_n$ be a sequence of open dense subsets of $bb(R)^n$. Show that $ 
		sect.big_(n=1)^(oo) O_n
	 $ is non-empty. Deduce that if $ 
		bb(R)^n=union.big_(n=1)^(oo) K_n
	 $ where $K_n$ are closed, then some $K_n$ has non-empty interior.
	
	
	
+ /* 5 */ Let $(X, d)$ be a compact metric space and let $f: X -> X$ be such that $ 
		d(f(x), f(y))=d(x, y)  "for all"  x, y in X
	 $ Show that $f$ is surjective. Is this true if $X$ is not assumed to be compact?
	
	
	
+ /* 6 */ Let $(X, d)$ be a compact metric space and let $f: X -> X$ be such that $ 
		d(f(x), f(y))<d(x, y)  "for all"  x != y
	 $ Show that $f$ has a unique fixed point. Is this true if $X$ is not assumed to be compact?
	
	
	
+ /* 7 */ Recall that the integer part (or integral part) of a real number $x$ is the unique integer $n in bb(Z)$ such that $n <= x<n+1$. We denote it by $I(x)$. On $bb(R)$ we define the relation $x cal(R) y <==> I(x)=I(y)$.
	#parts[
		+ /* 7a */ Prove that $cal(R)$ is an equivalence relation.
			
		+ /* 7b */ Let $p: bb(R) -> bb(R)  slash  cal(R)$ be the quotient map, let $bb(R)  slash  cal(R)$ be endowed with the quotient topology, and let $U$ be an open set in $bb(R)  slash  cal(R)$. Prove that if $n in bb(Z)$ is such that $p(n) in U$ then $p(n-1) in U$.
			
		+ /* 7c */ Deduce that the open sets in $bb(R)  slash  cal(R)$ are $diameter$, $bb(R)  slash  cal(R)$ and the image sets $p(-oo, n]$, where $n in bb(Z)$.
			
		+ /* 7d */ Consider the map $I: bb(R) -> bb(Z)$, $x |-> I(x)$.
			#subparts[
				+ /* 7di */ Is the map $I$ continuous (when $bb(Z)$ is endowed with the subspace topology)?
					
				+ /* 7dii */ Prove that $I$ defines a bijection $tilde(I): bb(R)  slash  cal(R) -> bb(Z)$. What is the topology on $bb(Z)$ making $tilde(I)$ a homeomorphism?
			]
	]
	
	
	
+ /* 8 */ #parts[
		+ /* 8a */ Let $X$ be a topological space and $A$ a subset of $X$. On $X times{0,1}$ define the partition composed of the pairs ${(a, 0),(a, 1)}$ for $a in A$, and of the singletons ${(x, i)}$ if $x in X without A$ and $i in{0,1}$. Let $cal(R)$ be the equivalence relation defined by this partition, let $Y$ be the quotient space $[X times{0,1}]  slash  cal(R)$ and let $p: X times{0,1} -> Y$ be the quotient map.
			#subparts[
				+ /* 8ai */ Prove that there exists a continuous map $f: Y -> X$ such that $f compose p(x, i)=x$ for every $x in X$ and $i in{0,1}$.
					
				+ /* 8aii */ Prove that $Y$ is Hausdorff if and only if $X$ is Hausdorff and $A$ is a closed subset of $X$.
			]
			
		+ /* 8b */ Consider the above construction for $X=[0,1]$ and $A$ an arbitrary subset of $[0,1]$. Prove that $Y$ is compact. Prove that $K=p(X times{0})$ and $L=p(X times{1})$ are compact, and that $K sect L$ is homeomorphic to $A$. (_We have thus shown that the intersection of two compact subsets in a space that is not Hausdorff may be non-compact and not closed._)
	]
	
	
	
+ /* 9 */ The goal of this exercise is to show there exists an embedding of the real projective plane $bb(R) P^(2)$ in $bb(R)^(4)$.\ Let $bb(S)^(2)$ denote the unit sphere in $bb(R)^(3)$ given by $bb(S)^(2)={(x, y, z) in bb(R)^(3): x^(2)+y^(2)+z^(2)=1}$, and let $f: bb(S)^(2) -> bb(R)^(4)$ be defined by $f(x, y, z)=(x^(2)-y^(2), x y, y z, z x)$. Prove that
	#parts[
		+ /* 9a */ $f$ determines a continuous map $tilde(f): bb(R) P^(2) -> bb(R)^(4)$ where $bb(R) P^(2)$ is the real projective plane;
			
		+ /* 9b */ $tilde(f)$ is a homeomorphism onto a topological subspace of $bb(R)^(4)$. [_Hint: when proving that $tilde(f)$ is injective you need to show that $ 
				(x_(1)^(2)-y_(1)^(2), x_(1) y_(1), y_(1) z_(1), z_(1) x_(1))=(x_(2)^(2)-y_(2)^(2), x_(2) y_(2), y_(2) z_(2), z_(2) x_(2))
				==>(x_(2), y_(2), z_(2))= plus.minus(x_(1), y_(1), z_(1))
			 $ for points $(x_(1), y_(1), z_(1))$ and $(x_(2), y_(2), z_(2))$ in $bb(S)^(2)$. You might try considering the cases $x_(1) != 0$ and $x_(1)=0$._]
	]
