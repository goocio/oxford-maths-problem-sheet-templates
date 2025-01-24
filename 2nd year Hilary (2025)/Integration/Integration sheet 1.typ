#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Integration -- Sheet 1\ Lebesgue measure])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2024-10-05




	
+ /* 1 */ Find $liminf_(n -> oo) a_(n)$ and $limsup_(n -> oo) a_(n)$ when
	#parts[
		+ /* 1a */ $a_(n)=exp (-cos n)$,
			
		+ /* 1b */ $a_(n)=exp (n sin ((n pi)/(2)))+exp ((1)/(n) cos ((n pi)/(2)))$,
			
		+ /* 1c */ $a_(n)=cosh (n sin (((n^(2)+1)/(n) ) (pi)/(2)))$.
	]
	
	
	
+ /* 2 */ Let $(a_(n))$ and $(b_(n))$ be bounded real sequences. Prove that:
	#parts[
		+ /* 2a */ If $a_(n) lt.eq.slant b_(n)$ for all $n$ then $limsup_(n -> oo) a_(n) lt.eq.slant limsup_(n -> oo) b_(n)$;
			
		+ /* 2b */ $limsup_(n -> oo)(a_(n)+b_(n)) lt.eq.slant limsup_(n -> oo) a_(n)+limsup_(n -> oo) b_(n)$;
			
		+ /* 2c */ There is a subsequence $(a_(n_(r)))_(r gt.eq.slant 1)$ of $(a_(n))$ such that $lim_(r -> oo) a_(n_(r))=limsup_(n -> oo) a_(n)$;
			
		+ /* 2d */ If $(a_(k_(r)))_(r gt.eq.slant 1)$ is any convergent subsequence of $(a_(n))$, then $lim_(r -> oo) a_(k_(r)) lt.eq.slant limsup_(n -> oo) a_(n)$.
	]
	
	
	
+ /* 3 */ #parts[
		+ /* 3a */ Let $E=bb(Q) sect[0,1]$. Show that there exists a sequence $(x_(n))_(n gt.eq.slant 1)$ in $[0,1]$ such that the sets $E+x_(n) := {y+x_(n): y in E }$ $(n=1,2, dots)$ are disjoint. Show that $ 
				0 lt.eq.slant sum_(n=1)^(k) chi_(E)(x-x_(n)) lt.eq.slant chi_([0,2])(x), quad x in bb(R),space k in bb(N).
			 $
			
		+ /* 3b */ Let $V$ be a vector space of functions from $bb(R)$ to $bb(R)$, and $phi.alt: V -> bb(R)$ be a linear functional with the following properties: 
				- For any bounded interval $I subset bb(R)$ with endpoints $a$ and $b, chi_(I) in V$ and $phi.alt(chi_(I))=b-a$.
				- If $f in V$ and $f(x) gt.eq.slant 0$ for all $x in bb(R)$, then $phi.alt(f) gt.eq.slant 0$.
				- If $f in V, a in bb(R)$ and $f_(a)(x)=f(x-a)$, then $f_(a) in V$ and $phi.alt(f_(a))=phi.alt(f)$.
			 If $chi_(E) in V$, show that $phi.alt (chi_(E))=0$.
	]
	
	
	
+ /* 4 */ Let $C$ be the Cantor set.
	#parts[
		+ /* 4a */ Explain, in as much detail as you think is appropriate, why $ 
				C={sum_(n=1)^(oo) a_(n) 3^(-n): a_(n)=0  "or"  2 }.
			 $
			
		+ /* 4b */ Prove that $C$ is uncountable, for example by either (or all) of the following methods:
			#subparts[
				+ /* 4bi */ Adapting Cantor's proof, via decimal expansions, that $[0,1]$ is uncountable;
					
				+ /* 4bii */ Constructing a surjection of $C$ onto $[0,1]$ --- think about binary expansions in $[0,1]$;
					
				+ /* 4biii */ Prove that $C+C=[0,2]$ and deduce that $C$ is uncountable.
			]
	]
	
	
	
+ /* 5 */ #parts[
		+ /* 5a */ Show that the set of all real numbers which have a decimal expansion not containing the digit 4 is null. [_Consider first numbers between 0 and 1._]
			
		+ /* 5b */ Show that if $A$ is null and $B$ is countable, then $A+B$ is null.
			
		+ /* 5c */ Show that if $A$ is null and $f: bb(R) -> bb(R)$ has a continuous derivative, then $f(A)$ is null. [_You may wish to first consider the case when $A subset[0,1]$ and use the fact that $f'$ is bounded on $[0,1]$._]
	]
	
	
	
+ /* 6 */ Let $A, B$ and $A_(n)$ be subsets of $bb(R)$, and $x, alpha in bb(R)$. Prove the following:
	#parts[
		+ /* 6a */ $m^(*)(A+x)=m^(*)(A)$;
			
		+ /* 6b */ $m^(*)(alpha A)=|alpha| m^(*)(A)$;
			
		+ /* 6c */ $m^(*)(A union B) lt.eq.slant m^(*)(A)+m^(*)(B)$;
			
		+ /* 6d */ $m^(*)(union.big_(n=1)^(oo) A_(n) ) lt.eq.slant sum_(n=1)^(oo) m^(*)(A_(n) )$.
	]
	
	
	
+ /* 7 */ Prove the following:
	#parts[
		+ /* 7a */ Any null set is (Lebesgue) measurable;
			
		+ /* 7b */ Any interval is measurable;
			
		+ /* 7c */ If $E$ and $F$ are measurable and $x, alpha in bb(R)$, then $E+x, alpha E$ and $E union F$ are measurable;
			
		+ /* 7d */ If $E_(n)$ are disjoint measurable subsets of $bb(R)$, then $union.big_(n=1)^(oo) E_(n)$ is measurable and $m^(*)(union.big_(n=1)^(oo) E_(n) )=sum_(n=1)^(oo) m^(*)(E_(n) )$. [_Hint: first use the previous part to show that for each $n$, we have $m^(*)(A) gt.eq.slant sum_(r=1)^(n) m^(*)(A sect E_(r))+m^(*)(A without union.big_(r=1)^(oo) E_(r))$._]
	]
	
	
	
+ /* 8 */ (Optional) Let $G$ be an open subset of $bb(R)$. For $x, y in G$, let $I_(x, y)$ be the closed (or open, if you prefer) interval between $x$ and $y$, so $I_(x, x)={x}$ (or $diameter$). Define a relation $~$ on $G$ by $x ~ y$ if and only if $I_(x, y) subset G$.
	#parts[
		+ /* 8a */ Show that $~$ is an equivalence relation on $G$.
			
		+ /* 8b */ Show that each equivalence class is an open interval. [_To show that $A$ is an interval, it is sufficient to check that, if $x, y in A$ then $I_(x, y) subset A$._]
			
		+ /* 8c */ Show that there are (at most) countably many equivalence classes.
			
		+ /* 8d */ Deduce that $G$ is the union of (at most) countably many, disjoint open intervals, and in particular $G$ is measurable.
	]