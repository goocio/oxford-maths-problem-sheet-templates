#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Integration -- Sheet 2\ Measurable functions, Lebesgue integral])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2024-10-05




	
+ /* 1 */ Let $(omega_(n))$ be a sequence of non-negative real numbers. For a subset $E$ of $bb(N)$, let $ 
		mu_(omega)(E)=sum_(n in E) omega_(n).
	 $
	#parts[
		+ /* 1a */ Show that $mu_(omega)$ is a measure on $(bb(N), cal(P)(bb(N)))$.
			
		+ /* 1b */ Now let $nu$ be any measure on $(bb(N), cal(P)(bb(N)))$, and define $omega_(n)=nu({n})$. Show that $nu(E)=mu_(omega)(E)$ for all subsets $E$ of $bb(N)$.
	]
	
	
	
+ /* 2 */ Let $(Omega, cal(F), mu)$ be any measure space. If $(A_(n))$ is a decreasing sequence of sets in $cal(F)$ and $mu(A_(1))<oo$, prove that $ 
		mu (sect.big_(n=1)^(oo) A_(n))=lim _(n -> oo) mu(A_(n)) .
	 $ Is this still true if $mu(A_(1))=oo$?
	
	
	
+ /* 3 */ #parts[
		+ /* 3a */ Let $b in bb(R)$. Show that $(-oo, b)=union.big_(n=1)^(oo)(bb(R) without (b-(1)/(n), oo ))$. Deduce that if $cal(F)$ is a $sigma$-algebra on $bb(R)$ containing the intervals $(a, oo)$ for each $a in bb(R)$, then $cal(F)$ contains all open intervals, and hence all open subsets of $bb(R)$.
			
		+ /* 3b */ Let $f: bb(R) -> bb(R)$ be a function. Show that $ 
				cal(G):= {G subset bb(R): f^(-1)(G) in cal(M)_(upright(L e b))}
			 $ is a $sigma$-algebra. Deduce that if $f^(-1)(a, oo) in cal(M)_("Leb")$ for every $a$, then $f^(-1)(G) in cal(M)_("Leb")$ for every $G in cal(M)_(upright(B o r))$.
	]
	
	
	
+ /* 4 */ #parts[
		+ /* 4a */ Let $I$ be an interval of positive length, let $a in I, f, g: I -> bb(R)$ be functions such that $f(x)=g(x)$ a.e., and suppose that $f$ and $g$ are continuous at $a$. Show that $f(a)=g(a)$.
			
		+ /* 4b */ Is $chi_(bb(Q))$ continuous a.e.? Does there exist a continuous function $g$ such that $chi_(bb(Q))=g$ a.e.?
			
		+ /* 4c */ Is $chi_((0, oo))$ continuous a.e.? Does there exist a continuous function $g$ such that $chi_((0, oo))=g$ a.e.? [_Use (a)._]
	]
	
	
	
+ /* 5 */ Let $f, g$ be measurable functions from $bb(R)$ to $bb(R)$, and $h: bb(R) -> bb(R)$ be continuous. Recall from lectures that $f+g$ and $h compose f$ are measurable. Prove that the following functions are measurable. [_Complicated constructions are not required. Everything can be quickly deduced from the information from lectures recalled above, plus a couple of simple formulae._]
	#parts[
		+ /* 5a */ $f^(2): x |-> f(x)^(2)$;
			
		+ /* 5b */ $f g: x |-> f(x) g(x)$;
			
		+ /* 5c */ $|f|: x |->|f(x)|$;
			
		+ /* 5d */ $max (f, g): x |-> max (f(x), g(x))$.
	]
	
	
	
+ /* 6 */ #parts[
		+ /* 6a */ Suppose that $g$ is a measurable function and $f=g$ a.e. Show that $f$ is measurable.
			
		+ /* 6b */ Suppose that $f$ is continuous a.e.. Show that there is a sequence of step functions $(phi.alt_(n))$ such that $f=lim_(n -> oo) phi.alt_(n)$ a.e.. Deduce that $f$ is measurable.
	]
	
	
	
+ /* 7 */ Let $f: bb(R) ->[-oo, oo]$ be an integrable function, and let $alpha>0$.
	#parts[
		+ /* 7a */ Show that $ 
				m({x:|f(x)| gt.eq.slant alpha}) lt.eq.slant (1)/(alpha) integral|f| .
			 $
			
		+ /* 7b */ Deduce that
			#subparts[
				+ /* 7bi */ $f(x) in bb(R)$ a.e.\ 
				+ /* 7bii */ If $integral|f|=0$, then $f(x)=0$ a.e..
			]
	]
	
	
	
+ /* 8 */ (Optional) Let $(Omega, cal(F), mu)$ be a measure space, $Omega_(*)$ be a set, and $f: Omega -> Omega_(*)$ be a function. Let $ 
		f_(*)(cal(F))={G subset Omega_(*): f^(-1)(G) in cal(F)}, wide
		(f_(*) mu)(G)=mu(f^(-1)(G)).
	 $
	#parts[
		+ /* 8a */ Show that $(Omega_(*), f_(*)(cal(F)), f_(*) mu)$ is a measure space.
			
		+ /* 8b */ Now let $(Omega, cal(F), mu)=(bb(R), cal(M)_(upright(B o r)), m)$, and $Omega_(*)=bb(R)$. Determine $f_(*)(cal(M)_(upright(B o r)))$ and $f_(*) m$ when
			#subparts[
				+ /* 8bi */ $f(x)=tan x$ if $cos x != 0$, and $f(x)=0$ if $cos x=0$;
					
				+ /* 8bii */ $f(x)=arctan x($ taking values in $(-pi / 2, pi / 2))$.
			]
	]