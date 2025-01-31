#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Integration -- Sheet 3\ Convergence theorems])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2024-10-05




	
+ /* 1 */ In each of the following cases, decide whether the function $f$ is Lebesgue integrable over the interval $I$. Justify your answers by using comparison, MCT, DCT, etc and calculate $integral_(I) f$ in those cases where this is feasible.
	#parts[
		+ /* 1a */ $I=bb(R)$, $f(x)=x$ if $x$ is rational, $f(x)=0$ if $x$ is irrational;
			
		+ /* 1b */ $I=(0, pi  slash  2)$, $f(x)=tan x$;
			
		+ /* 1c */ $I=[1, oo)$, $f(x)=(-1)^(n)  slash  n$ if $n <= x<n+1$, $n=1,2,3,...$;
			
		+ /* 1d */ $I=(0,1]$, $f(x)=sin (1  slash  x)$;
			
		+ /* 1e */ $I=[0, oo)$, $f(x)=x^(n) e^(-x)$ where $n$ is a positive integer;
			
		+ /* 1f */ $I=(0, oo)$, $f(x)=(log x) e^(-x)$;
			
		+ /* 1g */ $I=[1, oo)$, $f(x)=x^(alpha) log x$ where $alpha in bb(R)$;
			
		+ /* 1h */ $I=(0, pi)$, $f(x)=(op("cosec") x)^(1  slash  2)$;
			
		+ /* 1i */ $I=(0, oo)$, $f(x)=(1+x)^(-1) cos x$;
			
		+ /* 1j */ $I=[1, oo)$, $f(x)=sin (1  slash  x)$.
	]
	
	
	
+ /* 2 */ We know that $display((sin x)/(x))$ is not integrable over $(1, oo)$. Deduce, or prove otherwise, that neither of the following functions is integrable over the given intervals:
	#parts[
		+ /* 2a */ $display((sin (x^(2)))/(x))$ over $(1, oo)$;
			
		+ /* 2b */ $display((1)/(x) sin (1)/(x^(2)))$ over $(0,1)$.
	]
	
	
	
+ /* 3 */ Show that $ 
		lim_(n -> oo) integral_(1)^(2)(1+(x)/(n))^(-n)  dif x=e^(-1)-e^(-2).
	 $
	
	
	
+ /* 4 */ Show that $0 <= display((x)/(1+x^(alpha))) <= 1$ for $alpha>1$, $x >= 0$, and deduce that $ 
		lim_(n -> oo) integral_(0)^(2 pi) (n x sin x)/(1+n^(alpha) x^(alpha)) dif x=0.
	 $
	
	
	
+ /* 5 */ Let $alpha>-1$.
	#parts[
		+ /* 5a */ Show that $x^(alpha) log x$ is integrable over $(0,1)$, and $ 
				integral_(0)^(1) x^(alpha) log x dif x=-(1+alpha)^(-2).
			 $
			
		+ /* 5b */ Deduce that for $beta>-1$, $x^(beta)(1-x)^(-1) log x$ is integrable over $(0,1)$, and $ 
				integral_(0)^(1) x^(beta)(1-x)^(-1) log x dif x=-sum_(n=1)^(oo)(n+beta)^(-2).
			 $
	]
	
	
	
+ /* 6 */ #parts[
		+ /* 6a */ Show that for $n>0$, $e^(-n x) sin x$ is integrable over $[0, oo)$, and $ 
				integral_(0)^(oo) e^(-n x) sin x dif x=(1)/(1+n^(2)).
			 $
			
		+ /* 6b */ Deduce that for $0 <= a <= 1$, $(e^(x)-a)^(-1) sin x$ is integrable over $[0, oo)$, and $ 
				integral_(0)^(oo)(e^(x)-a)^(-1) sin x dif x=sum_(n=1)^(oo) (a^(n-1))/(1+n^(2)).
			 $
	]
	
	
	
+ /* 7 */ Prove that $display(integral_(0)^(oo) cos x arctan (lambda x) e^(-x) dif x -> (pi)/(4))$ as $lambda -> oo$.
	
	
	
+ /* 8 */ #parts[
		+ /* 8a */ Let $alpha in(0, oo)$. Show that $Gamma(alpha):=integral_(0)^(oo) x^(alpha-1) e^(-x) dif x$ exists as a Lebesgue integral, and that $Gamma(alpha+1)=alpha Gamma(alpha)$.
			
		+ /* 8b */ Now show that $Gamma:(0, oo) -> bb(R)$ is differentiable.
	]
	
	
	
+ /* 9 */ By differentiating through the integral sign, evaluate $display(integral_(0)^(oo) (e^(-x) sin t x)/(x) dif x)$.
	
	
	
+ /* 10 */ (Optional) By differentiating through the integral sign, evaluate $display(integral_(0)^(pi  slash  2) log(a^(2) cos ^(2) x+b^(2) sin ^(2) x) dif x)$, where $a, b>0$.
	
	
	
+ /* 11 */ (Optional) Let $display(K(t)=integral_(1)^(oo) (cos (t x))/(x^(2)) dif x)$. Show carefully that $K'(t)=display((K(t)-cos t)/(t))$ for $t>0$.
