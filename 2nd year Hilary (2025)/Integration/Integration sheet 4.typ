#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Integration -- Sheet 4\ Fubini's theorem, $L^p$-spaces])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2024-10-05




	
+ /* 1 */ In each of the following cases, is $f$ integrable over the given region? [_Give careful justification._]
	#parts[
		+ /* 1a */ $f(x, y)=e^(-x y)$ over $[0, oo) times[0, oo)$;
			
		+ /* 1b */ $f(x, y)=e^(-x y)$ over ${(x, y): 0<x<y<x+x^(2)}$;
			
		+ /* 1c */ $f(x, y)=display(((sin x)(sin y))/(x^(2)+y^(2)))$ over $(-(pi)/(2), (pi)/(2)) times (-(pi)/(2), (pi)/(2))$.
	]
	
	
	
+ /* 2 */ [_Applications of Tonelli or Fubini should be carefully justified._]
	#parts[
		+ /* 2a */ Let $J_(0)(x)=(2)/(pi) integral_(0)^(pi  slash  2) cos (x cos theta) dif theta$. Show that $integral_(0)^(oo) J_(0)(x) e^(-a x) dif x=display((1)/(sqrt(1+a^(2))))$ if $a>0$.
			
		+ /* 2b */ Take $b>a>1$. By considering $x^(-y)$ over $(1, oo) times(a, b)$, show that $integral_(1)^(oo) display((x^(-a)-x^(-b))/(log x)) dif x$ exists, and find its value.
	]
	
	
	
+ /* 3 */ Let $f: bb(R) -> bb(R)$ be non-negative, and let $ 
		E={(x, y) in bb(R)^(2): 0 <= y <= f(x)}
	 $
	#parts[
		+ /* 3a */ Show that $f$ is measurable if and only if $E$ is measurable. [_Recall from the end of section 2 that if $E_(1), E_(2)$ are measurable subsets of $bb(R)$, then $E_(1) times E_(2)$ is measurable in $bb(R)^(2)$._]
			
		+ /* 3b */ If $f$ (and hence by (a), $E$) is measurable show that $m(E)=integral_(bb(R)) f(x) dif x$.
	]
	
	
	
+ /* 4 */ Let $f in cal(L)^(1)(bb(R))$ be non-negative with $integral_(-oo)^(oo) f(x) dif x=1$, and let $F(x)=integral_(-oo)^(x) f(y) dif y$. Assume that $x f(x) in cal(L)^(1)(bb(R))$.
	#parts[
		+ /* 4a */ Use Fubini's Theorem to prove that $ 
				integral_(0)^(oo)(1-F(x)) dif x=integral_(0)^(oo) x f(x) dif x, quad integral_(-oo)^(0) F(x) dif x=-integral_(-oo)^(0) x f(x) dif x .
			 $
			
		+ /* 4b */ Now let $g$ be a bounded measurable function, and let $ 
				G(y)=integral_({g(x) <= y}) f(x) dif x.
			 $ Prove that $ 
				integral_(0)^(oo)(1-G(y)-G(-y)) dif y=integral_(-oo)^(oo) f(x) g(x) dif x.
			 $ [_Remark (not a hint): Imagine that $f$ is the probability density function of a random variable $X$. The first part of the question then says that $bb(E)(X)=integral_(0)^(oo)(bb(P)[X>x]-bb(P)[X <=-x]) dif x$. This formula holds for all random variables (discrete, continuous, etc) with $bb(E)(|X|)<oo$. In particular it holds for $g(X)$. Then the last part proves that $bb(E)[g(X)]=$ $integral_(-oo)^(oo) f(x) g(x) d x$, a fact sometimes known as the Law of the Unconscious Statistician._]
	]
	
	
	
+ /* 5 */ #parts[
		+ /* 5a */ Let $alpha>1$ and $f(x, y)=(x^(2)+y^(2))^(-alpha)$ and $g(x, y)=(1+x^(2)+y^(2))^(-alpha)$. Show that $f$ is integrable over $[1, oo) times[0, oo)$. [_Hint: Change of variables $y=u x$ may help._] Deduce that $f$ is integrable over $[0,1] times[1, oo)$, and that $g$ is integrable over $bb(R)^(2)$.
			
		+ /* 5b */ Use polar coordinates to show that $g$ is integrable over $bb(R)^(2)$.
	]
	
	
	
+ /* 6 */ #parts[
		+ /* 6a */ For $p>0$, calculate $||f||_(p)$ when $f$ is (i) $chi_((0,1))$, (ii) $chi_((1,2))$, (iii) $chi_((0,2))$.
			
		+ /* 6b */ Now assume that $0<p<1$.
			#subparts[
				+ /* 6bi */ Is $||dot.c||_(p)$ a norm on $L^(p)$?
					
				+ /* 6bii */ For $f, g in L^(p)(bb(R))$, let $d_(p)(f, g)=integral|f-g|^(p)$. Show that $d_(p)$ is a metric on $L^(p)(bb(R))$.
			]
	]
	
	
	
+ /* 7 */ Consider the relation $~$ on the space of measurable functions $f: bb(R) -> bb(R)$ given by: $f ~ g <==> f=g "a.e." $.
	#parts[
		+ /* 7a */ State which properties of null sets are used to prove each of the following true statements ($f, g, h$, etc are measurable functions):
			#subparts[
				+ /* 7ai */ $f ~ f$,
					
				+ /* 7aii */ $f ~ g ==> g ~ f$,
					
				+ /* 7aiii */ $f ~ g, g ~ h ==> f ~ h$,
					
				+ /* 7aiv */ If $f_(n) ~ g_(n)$ for all $n in bb(N)$, then $sup f_(n) ~ sup g_(n)$,
					
				+ /* 7av */ If $f ~ g$, then $h compose f ~ h compose g$.
			]
			
		+ /* 7b */ Give an example where $h$ is injective, $f ~ g$, but $f compose h tilde.not g compose h$.
	]
	
	
	
+ /* 8 */ Let $p>1$.
	#parts[
		+ /* 8a */ Give an example of a sequence $(f_(n))$ in $L^(p)(0,1)$ such that $lim_(n -> oo) f_(n)(x)=0$ a.e. but $lim_(n -> oo)||f_(n)||_(p) != 0$. For each $epsilon>0$ find a measurable subset $E_(epsilon)$ of $[0,1]$ such that $m(E_(epsilon))<epsilon$ and $f_(n)(x) -> 0$ uniformly on $[0,1] without E_(epsilon)$.
			
		+ /* 8b */ Give an example of a sequence $(g_(n))$ in $L^(p)(0,1)$ such that $lim_(n -> oo)||g_(n)||_(p)=0$ but $lim _(n -> oo) g_(n)(x)$ does not exist for any $x in(0,1)$. Find a subsequence $(g_(n_(r)))$ such that $lim_(r -> oo) g_(n_(r))(x)=0$ a.e..
	]
	
	
	
+ /* 9 */ (Optional) Let $E subset bb(R)$ be measurable.
	#parts[
		+ /* 9a */ Show that $||dot.c||_(oo)$ gives a norm on $L^(oo)(E)$.
			
		+ /* 9b */ Show that $(L^(oo)(E),||dot.c||_(oo))$ is complete.
	]
	
	
	
+ /* 10 */ (Optional) A function $g:[0, oo) -> bb(R)$ is _convex_ if $ 
		g(x)=sup {alpha x+beta: alpha y+beta <= g(y)  "for all"  y in[0, oo)}.
	 $ [_If $g$ is continuous on $[0, oo)$ with non-negative second derivative on $(0, oo)$, then $g$ is convex._]\ Let $f:[0,1] ->[0, oo)$ be bounded, measurable, and $M_(n)=integral_(0)^(1) f^(n) dif x=||f||_(L^(n))^(n)$. Show that:
	#parts[
		+ /* 10a */ $g (integral_(0)^(1) f(x) dif x ) <= integral_(0)^(1) g(f(x)) dif x$ for every convex function $g$;
			
		+ /* 10b */ $M_(n)^(2) <= M_(n+1) M_(n-1)$;
			
		+ /* 10c */ $||f||_(L^(n)) <= M_(n+1)  slash  M_(n) <=||f||_(L^(oo))$;
			
		+ /* 10d */ $lim_(n -> oo) M_(n+1)  slash  M_(n)=||f||_(L^(oo))$.
	]
