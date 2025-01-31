#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Integration -- Sheet 5\ Bonus problems])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2024-10-05



This is an optional set of additional questions for the vacation. The first three questions are some integrals extracted from past exams (question 3 isn't really an extract --- it's pretty much the entire question). Solutions will be provided in week 1 of TT --- there's no expectation that tutors will support this sheet.


	
+ /* 1 */ A function $f: bb(R) -> bb(R)$ is defined by $ 
		f(t)=integral_(0)^(oo) e^(-x^(2)) cos(2 x t^(2)) dif x.
	 $ You may assume that this integral exists for all $t in bb(R)$ and that $f(0)=sqrt(pi)  slash  2$. Find an explicit formula for $f(t)$ for all $t in bb(R)$. You should justify your arguments carefully, making clear statements of any standard results that you use.
	
	
	
+ /* 2 */ For $x>0$ and $y>0$, let $ 
		f(x, y)=(1)/((1+y)(1+x^(4) y)).
	 $
	#parts[
		+ /* 2a */ Show carefully that $f$ is integrable over $(0, oo) times(0, oo)$.
			
		+ /* 2b */ Hence or otherwise show that the following integral exists, and find its value: $ 
				integral_(0)^(oo) (log x)/(x^(4)-1) dif x
			 $ [_The formula $ 
				f(x, y)=(1)/(x^(4)-1)((x^(4))/(1+x^(4) y)-(1)/(1+y))wide(x != 1)
			 $ may be useful._]
	]
	
	
	
+ /* 3 */ #parts[
		+ /* 3a */ Let $f$ be an integrable function on $(0, oo)$ with $f(x)>0$ for all $x>0$, and let $a>1$. For $x>0$ and $y>0$, let $ 
				g(x, y)=f(x y)-a f(a x y).
			 $ Show that $ 
				integral_(0)^(1) g(x, y) dif x=-(1)/(y) integral_(y)^(a y) f(t) dif t<0 quad  "whenever"  y>0
			 $ and $ 
				integral_(1)^(oo) g(x, y) d y>0 quad  "whenever"  x>0.
			 $ Deduce that $g$ is not integrable over $(0,1) times(1, oo)$.
			
		+ /* 3b */ [_In this part of the question, you may assume that $e^(-x^(2)) x^(3)$ is integrable over $(0, oo)$ with integral 1/2._] For $x>0$ and $y>0$, let $ 
				h(x, y)=e^(-(x^(2)+y^(2))) x^(3  slash  2) y^(1  slash  2).
			 $ Show that $h$ is integrable over $(0, oo) times(0, oo)$. Hence, or otherwise, show that $ 
				integral_(0)^(pi  slash  2)(cos theta)^(3  slash  2)(sin theta)^(1  slash  2) dif theta=(1)/(2)(integral_(0)^(oo) e^(-u) u^(1  slash  4) dif u )(integral_(0)^(oo) e^(-v) v^(-1  slash  4) dif v ).
			 $
	]
	
	
	
+ /* 4 */ #parts[
		+ /* 4a */ Let $E_(n)$ be measurable subsets of $bb(R)$ with $m(E_(n)) <= 2^(-n)$ for $n=1,2, dots$. Show that $lim_(n -> oo) chi_(E_(n))(x)=0$ a.e..
			
		+ /* 4b */ Let $f in cal(L)^(1)(bb(R))$. Show that $lim_(n -> oo) integral_(E_(n))|f|=0$. Deduce that for any $epsilon>0$ there exists $delta>0$ such that $integral_(E)|f|<epsilon$ for all measurable sets $E$ with $m(E)<delta$.
			
		+ /* 4c */ Let $F(x)=integral_(-oo)^(x) f(y) dif y$. Show that $F$ is absolutely continuous.
	]
	
	
	
+ /* 5 */ #parts[
		+ /* 5a */ Let $(Omega, cal(F), mu)$ be a measure space and $E in cal(F)$ have $mu(E)<oo$. Suppose that $(f_(n))_(n=1)^(oo)$ is a sequence of measurable functions on $E$ converging pointwise almost everywhere to $f$.
			#subparts[
				+ /* 5ai */ For each $n in bb(N)$, show there is a measurable subset $E_(n) subset E$, and $i_(n) in bb(N)$ such that $mu(E without E_(n))<2^(-n)$ and $|f_(i)(x)-f(x)|<1  slash  n$ for $i >= i_(n)$ and $x in E_(n)$.
					
				+ /* 5aii */ Fix $epsilon>0$. Show that there exists a measurable subset $F$ of $E$ with $mu(E without F)<epsilon$ and $f_(i) -> f$ uniformly on $F$.
			]
			
		+ /* 5b */ Now let $E subset bb(R)$ have $m(E)<oo$ and let $f: E -> bb(R)$ be measurable. Using the fact that there is a sequence $(f_(n))_(n=1)^(oo)$ of step functions such that $f_(n) -> f$ a.e. on $E$ (which we have not proved), show that there is a measurable subset $F$ of $E$ with $m(E without F)<epsilon$ such that $f|_(F)$ is continuous. [_Hint: Start out by establishing the result for a step function._]
	]
	
	
	
+ /* 6 */ #parts[
		+ /* 6a */ Let $g: bb(R) -> bb(R)$ and $h: bb(R) ->[0, oo)$ be Borel-measurable functions, and $mu$ be a measure on $(bb(R), cal(M)_(upright(B o r)))$. For $B in cal(M)_(upright(B o r))$, let $ 
				(g_(*) mu)(B)=mu(g^(-1)(B)), wide
				(h dot.c mu)(B)=integral_(B) h dif mu .
			 $ Recall from Sheet 2 Q5 that $g_(*) mu$ is a measure on $(bb(R), cal(M)_(upright(B o r)))$. Show that $h dot.c mu$ is a measure on $(bb(R), cal(M)_(upright(B o r)))$.
			
		+ /* 6b */ Let $f: bb(R) ->[0, oo]$ be Borel-measurable. Show that $ 
				integral_(bb(R))(f compose g) dif mu=integral_(bb(R)) f dif(g_(*) mu), wide
				integral_(bb(R)) f h dif mu=integral_(bb(R)) f dif(h dot.c mu) .
			 $ [_Consider first $f=chi_(B)$, then consider simple functions, and then apply the MCT._]
			
		+ /* 6c */ Let $g: bb(R) -> bb(R)$ be an increasing bijection with a continuous derivative.
			#subparts[
				+ /* 6ci */ Show that the measure $g_(*)(g'dot.c m)$ is Lebesgue measure $m$ on $cal(M)_(upright(B o r))$. [_You may assume that $m$ is the unique measure $mu$ on $(bb(R), cal(M)_(upright(B o r)))$ such that $mu(I)=b-a$ whenever $I$ is an interval with endpoints $a, b$._]
					
				+ /* 6cii */ Let $f: bb(R) ->[-oo, oo]$ be Borel-measurable. Show that $f$ is integrable (with respect to $m$) if and only if $(f compose g) g'$ is integrable, and then their integrals are equal.
			]
	]
	
	
+ /* 7 */ One equivalent formulation of the axiom of choice is the _well ordering principle_: every set can be _well ordered_, i.e. given a set $A$ there is a total order $<$ on $A$ such that every non-empty subset of $bb(A)$ has a least element. The _continuum hypothesis_ states that any subset $A$ of the real numbers is either finite, countably infinite, or has the cardinality of $bb(R)$ (i.e. there is a bijection from $A$ onto $bb(R)$). Assuming the well ordering principle and continuum hypothesis:
	#parts[
		+ /* 7a */ Show there is an ordering $prec$ on $bb(R)$ with the property that for each $y in bb(R),{x in bb(R):x prec y}$ is countable. [_Start with a well ordering $<$ of $bb(R)$ and consider ${y in bb(R):{x:x<y} "is not countable" }$._]
			
		+ /* 7b */ Show that there is a subset $E subset[0,1] times[0,1]$ such that the slices $E^(y)={x in[0,1]:(x, y) in E}$ and $E_(x)={y in[0,1]:(x, y) in E}$ are measurable and have $m(E^(y))=0$ and $m(E_(x))=1$ for all $x, y in[0,1]$. Why is $E$ necessarily not measurable?
	]
