#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Graph Theory -- Sheet 1])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Trinity Term 2025])

#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge

+ /* 1 */ Let $G$ be a connected graph with at least two vertices. Show that there is a vertex $v$ such that $G-v$ is connected. [_You might wish to consider a spanning tree for $G$._]
	
	
	
+ /* 2 */ Let $x$ and $y$ be any two vertices of a tree $T$. Show that there is a unique $x$-$y$ path in $T$.
	
	
	
+ /* 3 */ Show that a graph is minimally connected if and only if it is maximally acyclic. [_'Minimally $P$' means '$P$ holds but $P$ doesn't hold if we delete any edge'; 'maximally $P$' means '$P$ holds but $P$ doesn't hold if we add any new edge in the same set of vertices'._]
	
	
	
+ /* 4 */ Let $G$ be a graph with $|G|=n$. Show that $G$ is a tree if and only if $G$ is acyclic and $e(G)=n-1$.
	
	
	
+ /* 5 */ Let $G$ be a connected graph. Show that any two paths of maximum length intersect.
	
	
	
+ /* 6 */ Let $d_(1), dots, d_(n)$ be positive integers. Show that there is a tree on $n$ vertices with vertex degrees $d_(1), dots, d_(n)$ if and only if $sum_(i=1)^(n) d_(i)=2 n-2$.
	
	
	
+ /* 7 */ Consider the weighted graph $G$ depicted below.
	#align(center, diagram(
    let radius = 2.5cm,
    let coords = ((120deg,radius), (60deg,radius), (0deg,radius), (-60deg,radius), (-120deg,radius), (-180deg,radius)),
    for (idx,coord) in coords.enumerate() {
      node(coord,name:str(idx+1),radius:.25em,fill:black)
      node((rel:(coord.at(0),1em)),$v_#{idx+1}$)
    },
    edge(<1>,<2>,$1$),
    edge(<1>,<6>,$4$,label-side:left),
    edge(<2>,<3>,$8$),
    edge(<2>,<4>,$3$,label-side:left),
    edge(<2>,<5>,$6$),
    edge(<3>,<4>,$7$,label-side:left),
    edge(<4>,<5>,$5$,label-side:left),
    edge(<4>,<6>,$2$,label-pos:75%),
  ))
	#parts[
		+ /* 7a */ By applying Kruskal's algorithm, find a minimum cost spanning tree for $G$.
			
		+ /* 7b */ By applying Fleury's algorithm, find an Euler tour for $G$.
			
		+ /* 7c */ Ignoring starting points and orientation, how many Euler tours does $G$ have?
	]
	
	
	
+ /* 8 */ Let $G$ be a connected graph and suppose each edge $e$ has a positive cost $c(e)$. Show that if the costs of the edges are all distinct, then $G$ has a unique minimum cost spanning tree.
	
	
	
+ /* 9 */ Let $G$ be a connected graph. Show that $G$ has an Euler trail (i.e. a walk using each edge exactly once) if and only if there are at most two vertices with odd degree.
	
	
	
+ /* 10 */ What is the maximum number of edges in a graph on $n$ vertices with no triangle (i.e. no cycle of length 3)?
