#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Integration -- Sheet 0\ Practice integrals])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2024-10-05



This initial sheet has some integrals to practise, all of which can be done from prelims. Solutions are available. The point of questions 1, 3, and 4 (but not 2) is to illustrate various counter examples demonstrating the importance of the theorems in the course which will enable us to take integrals of limits, change the order of integration and differentiate under the integral.


	
+ /* 1 */ Let $f_(n):[0,1] -> bb(R)$ be given by $f_(n)(x)=n^(2) x^(n)(1-x)$. Show that
	#parts[
		+ /* 1a */ $lim_(n -> oo) f_(n)(x)=0$ for each $x in[0,1]$.
			
		+ /* 1b */ $lim_(n -> oo) integral_(0)^(1) f_(n)(x) dif x=1$.
	]
	
	
	
+ /* 2 */ Evaluate $ integral_(0)^(1)(integral_(0)^(x) e^(-y) dif y )dif x$ and $ integral_(0)^(1)(integral_(0)^(x-x^(2))(x+y) dif y )dif x$
	#parts[
		+ /* 2a */ directly;
			
		+ /* 2b */ by reversing the order of integration.
	]
	
	
	
+ /* 3 */ Show that $ 
		integral_(0)^(1)(integral_(0)^(1) (x-y)/((x+y)^(3))dif x )dif y=-(1)/(2).
	 $ Deduce that $ 
		integral_(0)^(1)(integral_(0)^(1) (x-y)/((x+y)^(3))dif y )dif x != integral_(0)^(1)(integral_(0)^(1) (x-y)/((x+y)^(3))dif x )dif y
	 $
	
	
	
+ /* 4 */ Let $f(x, y)=y^(3) e^(-y^(2) x)$, $F(y)=integral_(0)^(oo) f(x, y)dif x$. Calculate $F'(0)$ and $integral_(0)^(oo) (partial f)/(partial y)(x, 0)dif x$.
	When you have completed the course (or at least finished section 7), think about how your answer relates to the differentiation theorem (Theorem 7.5).