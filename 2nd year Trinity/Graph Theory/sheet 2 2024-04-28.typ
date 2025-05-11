#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Graph Theory -- Sheet 2])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Trinity Term 2025])

#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge

+ /* 1 */ Let $G$ be a connected graph on $n gt.eq.slant 3$ vertices. Suppose that for every pair of non-adjacent vertices $x$ and $y$, $d(x)+d(y) gt.eq.slant n$. Show how to find a Hamiltonian cycle in $G$ efficiently.
	
	
	
+ /* 2 */ For positive integers $m$ and $n$, let $K_(m, n)$ be the bipartite graph with parts $A$ and $B$ having $m$ and $n$ vertices respectively, and where every vertex of $A$ is joined to every vertex of $B$. For which $m$ and $n$ is $K_(m, n)$ Hamiltonian?
	
	
	
+ /* 3 */ Show that any graph with $n$ vertices and more than $(n(n-1)  slash  2)-(n-2)$ edges is Hamiltonian. Find an example of a graph with $n$ vertices and $(n(n-1)  slash  2)-(n-2)$ edges that is not Hamiltonian.
	
	
	
+ /* 4 */ Apply Dijkstra's algorithm to the graph below to find an $ell$-shortest $v_(3)$-$v_(4)$ path. The $ell$ value for each edge appears alongside each edge.
	#align(center, diagram(
    let radius = 2.5cm,
    let coords = ((120deg,radius), (60deg,radius), (180deg,radius), (0deg,radius), (-120deg,radius), (-60deg,radius)),
    for (idx, coord) in coords.enumerate() {
      node(coord, name: str(idx+1), radius: .25em, fill: black)
      node((rel:(coord.at(0),1em)), $v_#{idx+1}$)
    },
    edge(<1>,<2>,$2$),
    edge(<1>,<3>,$3$),
    edge(<1>,<5>,$2$),
    edge(<2>,<4>,$1$),
    edge(<2>,<5>,$1$),
    edge(<2>,<6>,$3$),
    edge(<3>,<5>,$2$),
    edge(<4>,<6>,$3$),
    edge(<5>,<6>,$1$),
  )) Carefully describe the steps of the algorithm and the tentative distance $D$-values until they are finalized. Except for $v_(3)$, state the parent of every vertex. Finally, describe an $ell$-shortest path tree rooted at $v_(3)$.
	
	
	
+ /* 5 */ Show that a graph is bipartite if and only if it does not have a cycle of odd length.
	
	
	
+ /* 6 */ Show that any graph has a bipartite subgraph containing at least half of its edges.
	
	
	
+ /* 7 */ Let $G$ be a bipartite graph in which all vertices have the same nonzero degree. Show that $G$ has a perfect matching.
	
	
	
+ /* 8 */ Let $G$ be a graph in which the degree of every vertex is in ${1, dots, k}$. Show that $G$ has a matching with at least $abs(V(G))  slash  2 k$ edges.
	
	
	
+ /* 9 */ Let $M$ be a square matrix. We say that $M$ is doubly stochastic if it has non-negative entries, every row sum is 1 and every column sum is 1. We say that $M$ is a permutation matrix if every row or column has one entry equal to 1 and all other entries equal to 0. Show that any doubly stochastic matrix $M$ can be written as $M=sum_(i=1)^(k) c_(i) P_(i)$ for some $k$, where $P_(i)$ is a permutation matrix and $c_(i)>0$ for $1 lt.eq.slant i lt.eq.slant k$.
