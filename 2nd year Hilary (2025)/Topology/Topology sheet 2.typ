#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Topology -- Sheet 2\ Connectedness, Compactness])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2025-01-13




	
+ /* 1 */ Consider $bb(R)^(n)$ endowed with the norm $||dot.c||_(oo)$.
	#parts[
		+ /* 1a */ Prove that for any $mb(x) in bb(R)^(n)$ and $epsilon>0$, there is a $mb(y) in bb(Q)^(n)$ and $delta in bb(Q)$, $delta>0$, such that $ 
				mb(x) in B(mb(y), delta) subset.eq B(mb(x), epsilon).
			 $
			
		+ /* 1b */ Prove that the family ${B(mb(y), delta): mb(y) in bb(Q)^(n) "and" delta in bb(Q), delta>0}$ is a countable basis for the Euclidean topology on $bb(R)^(n)$.
	]
	
	
	
+ /* 2 */ Prove that if $f: X -> Y$ is a continuous map of a space $X$ to a Hausdorff space $Y$, then its graph $ 
		cal(G)_(f)={(x, f(x)) in X times Y: x in X}
	 $ is a closed subset of $X times Y$.
	
	
	
+ /* 3 */ #parts[
		+ /* 3a */ Let $A$ and $B$ be connected subsets of a topological space $X$ such that $A sect overline(B) != diameter$. Prove that $A union B$ is connected.
			
		+ /* 3b */ Which of the following subsets of $bb(R)^(2)$ are connected? 
				- $B((1,0), 1) union B((-1,0), 1)$;
				- $overline(B((1,0), 1)) union B((-1,0), 1)$;
				- the set of all points with at least one rational coordinate.
			
	]
	
	
	
+ /* 4 */ Let $X$ be a topological space.
	#parts[
		+ /* 4a */ Let $a$ be an arbitrary point in $X$. Prove that there exists a largest connected subset of $X$ containing $a$, i.e. a set $C_(a)$ such that: 
				- $a in C_(a)$ and $C_(a)$ is connected;
				- for any connected subset $S$ of $X$ containing $a, S subset.eq C_(a)$.
			 We call such a set $C_(a)$ the _connected component of $X$ containing a_, or simply _a connected component of $X$_.
			
		+ /* 4b */ Prove that $C_(a)$ is closed for every $a in X$.
			
		+ /* 4c */ Prove that the relation $x ~ y <==> y in C_(x)$ is an equivalence relation.
			
		+ /* 4d */ Prove that connected components of $X$ are either disjoint or they coincide.
			
		+ /* 4e */ Find the connected components of $X={(x, y) in bb(R)^(2): x != y}$ with the topology induced from $bb(R)^(2)$. Same question for $X={(z, w) in bb(C)^(2): z != w }$ with the topology induced from $bb(C)^(2)$.
			
		+ /* 4f */ Let $A$ be a subset of $bb(R)$ such that $circle(A)=diameter$. Prove that the connected components of $A$ are the singletons. What are the connected components of $bb(Q)$ with the topology induced from $bb(R)$?
			
		+ /* 4g */ Show that $G L(n, bb(R))$ (where we identify this with a subspace of $bb(R)^(n^(2))$) is not connected. (_Hint: determinant._) ($convolve$) How many connected components does it have?
	]
	
	
	
+ /* 5 */ Let $I$ be an open interval in $bb(R)$ and let $f: I -> bb(R)$ be a differentiable function.
	#parts[
		+ /* 5a */ Prove that the set $T={(x, y) in I times I: x<y}$ is a connected subset of $bb(R)^(2)$ with the standard topology.
			
		+ /* 5b */ Let $g: T -> bb(R)$ be the function defined by $ 
				g(x, y)=(f(x)-f(y))/(x-y)
			 $ Prove that $g(T) subset.eq f'(I) subset.eq overline(g(T))$.
			
		+ /* 5c */ Show that $f'(I)$ is an interval. [_Thus the derivative $f'$ of any differentiable function $f: I -> bb(R)$ always has the intermediate value property (without necessarily being continuous). This is Darboux's theorem._]
	]
	
	
	
+ /* 6 */ Let $G$ be a topological group, i.e. $G$ is a group and a topological space such that the operations $x -> x^(-1)$ and $(x, y) -> x y$ are continuous. Assume that $G$ is connected and let $N$ be a normal subgroup of $G$ which is a discrete set with the topology induced from $G$. Show that $N$ is contained in the centre of $G, Z(G)$.
	
	
	
+ /* 7 */ #parts[
		+ /* 7a */ Let $X$ be a compact space, and let $(V_(n))_(n in bb(N))$ be a nested sequence of non-empty closed subsets of $X$ (nested means that $V_(n+1) subset.eq V_(n)$ for every $n in bb(N)$). Prove that $sect.big_(n=1)^(oo) V_(n) != diameter$.\ 
			
		+ /* 7b */ Now suppose that $X$ is Hausdorff as well as compact, and let $f: X -> X$ be a continuous map. Let $X_(0)=X$, $X_(1)=f(X_(0))$ and inductively define $X_(n+1)=f(X_(n))$ for $n >= 1$. Show that $A=sect.big_(n) X_(n)$ is non-empty.
			
		+ /* 7c */ Prove that $f(A)=A$. [_Hint: the proof that $f(A) subset.eq A$ is straightforward. To show that any $a in A$ is in $f(A)$, apply (a) to the sets $V_(n)=f^(-1)(a) sect X_(n).$_]
	]
	
	
	
+ /* 8 */ Let $X$ be a Hausdorff space and let $A, B$ be disjoint compact subsets of $X$. Show that there exist disjoint open subsets $U, V$ of $X$ such that $A subset.eq U$ and $B subset.eq V$.
	
	
	
+ /* 9 */ Let $X, Y$ be topological spaces and let $W subset.eq X times Y$ be closed. Assume that $Y$ is compact and let $p_(X): X times Y -> X$ be the projection map. Show that $p_(X)(W)$ is closed. Is this true if we don't assume $Y$ to be compact?