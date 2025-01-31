#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Integration -- Sheet 3A\ Some more integrals])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2024-10-05



Here are some additional optional questions related to the material of sheet 3. Solutions will be provided at the end of HT. There's no expectation that tutors will support this sheet.


	
+ /* 1 */ Use the binomial expansion of $(1-x)^(-k)$ to show that $(1-(u)/(n))^(-n) gt.eq.slant (1-(u)/(n+1))^(-(n+1))$ for $n gt.eq.slant 2$ and $0 lt.eq.slant u<n$. Hence, or otherwise, prove that $ 
		lim_(n -> oo) n^(alpha) integral_(0)^(1) x^(alpha-1) e^(-n beta x)(1-x)^(n) dif x=(beta+1)^(-alpha) Gamma(alpha)
	 $ where $alpha>0, beta>-1$, and $Gamma(alpha)=integral_(0)^(oo) e^(-u) u^(alpha-1) dif u$.
	
	
	
+ /* 2 */ Prove that $ 
		lim_(n -> oo)integral_(0)^(n^(2))n (sin (x)/(n) )e^(-x^(2)) dif x=(1)/(2).
	 $
	
	
	
+ /* 3 */ Let $a in(0,1)$. Prove that $display((e^(-a x)-e^((a-1) x))/(1-e^(-x)))$ is an integrable function on $bb(R)$, and that $ 
		(1)/(2) integral_(-oo)^(oo) (e^(-a x)-e^((a-1)x))/(1-e^(-x)) dif x=(1)/(a)+(1)/(a-1)+(1)/(a+1)+(1)/(a-2)+(1)/(a+2)+(1)/(a-3)+dots.c.
	 $
