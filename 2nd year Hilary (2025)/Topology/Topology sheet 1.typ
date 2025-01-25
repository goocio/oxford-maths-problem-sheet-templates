#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Topology -- Sheet 1\ Closures, Hausdorff spaces])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2025-01-18




	
+ /* 1 */ Let $cal(T)_("left")$ be the family of subsets $U$ of $bb(R)$ with the property that for every $x in U$ there exists $epsilon>0$ such that $(x-epsilon, x] subset.eq U$. Prove that $cal(T)_("left")$ is a topology on $bb(R)$. What is the closure of $(0,1)$ with respect to this topology?
	
	
	
+ /* 2 */ Let $cal(T)$ be the family of subsets $U$ of $bb(R)$ such that $bb(R) without U$ is countable or equal to $bb(R)$.
	#parts[
		+ /* 2a */ Show that $cal(T)$ is a topology.
			
		+ /* 2b */ Let $(x_n)$ be a sequence in $(bb(R),cal(T))$. Show that if $x_n -> x$ then there is an $N$ such that $x_n = x$ for all $n >= N$.
			
		+ /* 2c */ Assume that $F$ is a subset of $(bb(R),cal(T))$ such that for any convergent sequence $(x_n)$ with $x_n in F$ any limit of $(x_n)$ lies in $F$. Is $F$ necessarily closed?
			
		+ /* 2d */ Let $cal(T)_d$ be the discrete topology on $bb(R)$. Let $f$ be the identity function from $(bb(R),cal(T))$ to $(bb(R),cal(T)_d)$. Show that if $x_n -> x$ then $f(x_n)-> f(x)$. Is $f$ continuous?
	]
	
	
	
+ /* 3 */ Show that the subspaces $bb(Z), bb(Q)$ of $bb(R)$ (equipped with the standard topology) are not homeomorphic.
	
	
	
+ /* 4 */ Let $(X, dif)$ be a metric space and $A$ a non-empty subset of $X$. For every $x in X$, define the distance from $x$ to $A$, $op("dist")(x, A)$, by $ 
		op("dist")(x, A)=inf _(a in A) dif(x, a)
	 $ Prove that $x in overline(A)$ if and only if $op("dist")(x, A)=0$.
	
	
	
+ /* 5 */ Let $(X, dif)$ be a metric space.
	#parts[
		+ /* 5a */ Prove that a closed ball is a closed set in $(X, cal(T)_(dif))$, where $cal(T)_(dif)$ is the topology defined by the metric $dif$. Prove that the closure of an open ball is contained in the closed ball.
			
		+ /* 5b */ Draw the picture of the closed ball with centre $((1)/(2), 0 )$ and of radius $(1)/(2)$ in $(bb(R)^(2),||dot.c||_(oo))$.
			
		+ /* 5c */ Consider the subset $E=([0,1] times{0}) union({0} times[0,1])$ of $bb(R)^(2)$ endowed with the metric induced from $(bb(R)^(2),||dot.c||_(oo))$. What are the open and the closed ball of centre $((1)/(2), 0 )$ and of radius $(1)/(2)$ in this new metric space? Show that the closure of the open ball is a proper subset of the closed ball.
			
		+ /* 5d */ Let $(V,||dot.c||)$ be a normed real vector space. Show that in this case the closure of any open ball is a closed ball.
	]
	
	
	
+ /* 6 */ Let $f: X -> Y$ be a continuous map between topological spaces, and let $A$ and $B$ be subsets of $X$ such that $overline(A)=overline(B)$. Prove that $overline(f(A))=overline(f(B))$.
	
	
	
+ /* 7 */ Give examples of subsets $A_(1)$, $A_(2)$ and $A_(3)$ of $bb(R)^(2)$ (with its standard topology) such that
	#parts[
		+ /* 7a */ $A_(1)'=bb(R)^(2)$ and $(bb(R)^(2) without A_(1))'=bb(R)^(2)$;
			
		+ /* 7b */ $A_(2)' subset.eq.not A_(2)$ and $A_(2) subset.eq.not A_(2)'$;
			
			
		+ /* 7c */ $A_(3)''' != A_(3)'' != A_(3)' != A_(3)$.
	]
	
	
	
+ /* 8 */ Give examples of disjoint open subsets $A_(1)$, $A_(2)$ and $A_(3)$ of $bb(R)$ (with its standard topology) such that $ 
	partial A_(1)=partial A_(2)=partial A_(3) .
	 $
	
	
	
+ /* 9 */ Let $(X, cal(T))$ be a Hausdorff topological space and let $A$ be a non-empty subset of $X$.
	#parts[
		+ /* 9a */ Prove that an open set $U in cal(T)$ has non-empty intersection with $A$ if and only if $U$ has nonempty intersection with $overline(A)$.
			
		+ /* 9b */ Prove that a point $x$ is an accumulation point of $A$ (i.e. $x in A'$) if and only if $x$ is in $overline(A without{x})$.
			
		+ /* 9c */ Prove that $A'$ is closed in $X$.
			
		+ /* 9d */ Prove that $(overline(A))'=A'$. Deduce that $(A')' subset.eq A'$.
	]
	
	
	
+ /* 10 */ Let $(X, cal(T))$ be a Hausdorff topological space and let $f: X -> X$ be continuous. Show that the set $ 
		op("Fix")(f)={x: f(x)=x}
	 $ is closed.