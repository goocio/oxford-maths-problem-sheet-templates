#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Integral Transforms -- Sheet 2\ Convolution and inversion theorem, Fourier transform])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2024-07-26



	
+ /* 1 */ The life time $T$ of a particular brand of light bulb is modelled as follows. There is a probability $p$ of the light-bulb blowing immediately (so that $T=0$); given that the light bulb does not blow immediately, the probability of it having life time $tau$ or less is $1-e^(-lambda tau)$ (where $lambda>0$).
	#parts[
		+ /* 1a */ Write down the cumulative distribution function, $F_(T)(t)$, of $T$.
			
		+ /* 1b */ Write down the (generalized) probability density function $f_(T)(t)$ of $T$.
			
		+ /* 1c */ What is the expectation of $T$?
			
		+ /* 1d */ Write down the characteristic function of $T$, that is $bb(E)(e^(i s T))=hat(f)_(T)(-s)$.
	]
	
	
	
+ /* 2 */ The _Laguerre polynomials_ $L_(n)(x)$ are defined by $ 
		L_(n)(x)=e^(x) (dif^(n))/(dif x^(n))(x^(n) e^(-x)).
	 $ Show that $overline(L_(n))(p)=n!(p-1)^(n) p^(-n-1)$ and hence determine $L_(n)(x)$ for $1 lt.eq.slant n lt.eq.slant 4$.
	
	
	
+ /* 3 */ Solve using Laplace transform methods the following differential and integral equations:
	#parts[
		+ /* 3a */ $f'(x)+f(x)=bb(1)_([0,1])(x),wide f(0)=0$;
			
		+ /* 3b */ $f'(x)-2 integral_(0)^(x) f(t) e^(t-x) dif t=e^(2 x),wide f(0)=0$.
	]
	
	
	
+ /* 4 */ Find the inverse Laplace transform of $(p^(3)+1)^(-1)$:
	#parts[
		+ /* 4a */ using partial fractions;
			
		+ /* 4b */ using the inversion formula;
			
		+ /* 4c */ using term-by-term inversion of power series. [_Hint for (c): to find $sum_(n=0)^(oo) z^(3 n)  slash (3 n)!$, let $omega=e^(2 pi i  slash  3)$ so that $omega^(3)=1$, note that $1+omega+omega^(2)=0$, and consider $e^(z)+e^(omega z)+e^(omega^(2) z)$. You can adapt this technique to find the sum you need in (c)._]
	]
	
	
	
+ /* 5 */ In lectures it was shown that the Fourier transform of $f=bb(1)_([-1.1])$ is $hat(f)(s)=2 sin s  slash  s$. Determine the convolution $f * f$ and hence evaluate $ 
		integral_(-oo)^(oo) (sin ^(2) x)/(x^(2)) dif x.
	 $
	
	
	
+ /* 6 */ The function $u(x, t)$ is defined for $x in bb(R)$ and $t>0$ and solves the following boundary value problem $ 
		(partial u)/(partial t)=k (partial^(2) u)/(partial x^(2)), wide u(x, 0)=g(x).
	 $ Show that the Fourier transform $hat(u)(s, t)$ of $u$ in the $x$ variable satisfies $ 
		(partial hat(u))/(partial t)=-k s^(2) hat(u), wide hat(u)(s, 0)=hat(g)(s)
	 $ Deduce that $ 
		hat(u)(s, t)=hat(g)(s) e^(-k s^(2) t)
	 $ and hence write down the solution $u(x, t)$ as a convolution.
	
	
	
+ /* 7 */ The function $u(x, y)$ is defined for $x gt.eq.slant 0, y gt.eq.slant 1$ and solves the following boundary value problem $ 
		y (partial u)/(partial y)+(partial u)/(partial x)=1, wide u(x, 1)=1=u(0, y)
	 $ Show that the Laplace transform $overline(u)(p, y)$ of $u$ in the $x$ variable satisfies $ 
		y (partial overline(u))/(partial y)+p overline(u)=(1)/(p)+1, wide overline(u)(p, 1)=(1)/(p) .
	 $ Show further that $overline(u)(p, y)=p^(-2)+p^(-1)-p^(-2) y^(-p)$ and deduce that $ 
		u(x, y)= cases(
			1+x  quad&  "if"  e^(x)<y ,
			1+log y  quad&  "if"  e^(x) gt.eq.slant y
		)
	 $
