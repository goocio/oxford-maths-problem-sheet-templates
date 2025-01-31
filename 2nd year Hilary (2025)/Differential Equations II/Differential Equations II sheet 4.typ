#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Differential Equations II -- Sheet 4\ Perturbations, Inner and outer expansions])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

+ /* 1 */ *Order relations.*
	#parts[
		+ /* 1a */ Determine the order as $epsilon -> 0$ of $ 
				(sqrt(epsilon))/(1-cos epsilon) .
			 $
			
		+ /* 1b */ Obtain an asymptotic expansion of $exp (tan epsilon)$ in integer powers of $epsilon$ up to $O(epsilon^(4))$.
			
		+ /* 1c */ Show that $log epsilon=cal(o)(epsilon^(-p))$ as $epsilon -> 0^(+)$ for all $p>0$.
	]
	
	
	
+ /* 2 */ *Approximating roots.*
	Find expansions for all roots of the equations below as $epsilon -> 0$ with two nonzero terms in each expansion:
	#parts[
		+ /* 2a */ $epsilon x^(3)-x+1=0$,
			
		+ /* 2b */ $tan x=display((epsilon)/(x))$. [_Hint: The roots are near $n pi$ for integer $n$, but the root near zero must be treated separately (can you see why?)._]
	]
	
	
	
+ /* 3 */ *Regular perturbation.*
	Find the first two terms in an asymptotic expansion in powers of the small parameter $epsilon$ of the solution to $ 
		x y'(x)+y(x)=epsilon y(x)^(1  slash  2), wide x>1, wide y(1)=1 .
	 $ Explain why the expansion is not valid as $x -> oo$. What form of rescaling would be necessary to examine the behaviour for large $x$? [_You do not need to carry out the resulting analysis._]
	
	
	
+ /* 4 */ *Inner and outer expansions.*
	#parts[
		+ /* 4a */ Find inner and outer expansions, up to and including $cal(O)(epsilon)$ terms, for the function $ 
				f(x ; epsilon)=(e^(-x  slash  epsilon))/(x)+(sin x)/(x)-op("coth") x
			 $ for $x>0$ and $0<epsilon << 1$.
			
		+ /* 4b */ Compare the inner and outer approximations with the exact function $f$ by plotting all three on the same graph for various small values of $epsilon$.
	]
	
	
	
+ /* 5 */ *Singular perturbation.*
	#parts[
		+ /* 5a */ Use matched asymptotic expansions to find leading-order outer and inner solutions to the boundary value problem $ 
				epsilon y''(x)+x y'(x)+y(x)=0, wide 1<x<2, wide y(1)=0, wide y(2)=1,
			 $ where $0<epsilon << 1$. Construct the leading-order composite solution.
			
		+ /* 5b */ How would the analysis change if $epsilon$ were small and negative? [_You do not need to find the solution in this case._]
	]
	
	
	
+ /* 6 */ *Boundary layer.* Construct leading-order inner and outer solutions to $ 
		epsilon u''(x)+u'(x)=(u(x)+u(x)^(3))/(1+3 u(x)^(2)), wide 0<x<1, wide u(0)=0, wide u(1)=1,
	 $ where $0<epsilon << 1$. [_You will only be able to determine the outer solution implicitly._] Sketch a graph of the leading-order composite solution.
