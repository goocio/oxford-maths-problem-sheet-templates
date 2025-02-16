#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Differential Equations II -- Sheet 2\ Green's functions, Eigenfunctions])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2024-09-10



	
+ /* 1 */ *Computing Green's functions.* Obtain the Green's function for the following operators using the delta-function construction:
	#parts[
		+ /* 1a */ $frak(L) y=-y'', quad 0<x<1, quad y(0)-y'(1)=0, quad y(0)+y(1)=0$.
			
		+ /* 1b */ $frak(L) y=y''-y, quad 0<x<2 pi, quad y(0)-y(2 pi)=0, quad y'(0)-y'(2 pi)=0$.
			
		+ /* 1c */ In (b), what goes wrong if we change the operator to $frak(L) y=y''+y$ (for the same boundary conditions)?
	]
	
	
	
+ /* 2 */ *Green's functions for an Initial Value Problem.* Reconsider the IVP from Sheet 1 Q3, $ 
		frak(L) y(x) equiv P_(2)(x) y''(x)+P_(1)(x) y'(x)+P_(0)(x) y(x)=f(x)
	 $ for $x>0$, subject to initial conditions $y(0)=y'(0)=0$. Recall that $y_(1)$ and $y_(2)$ are linearly independent solutions to the homogeneous problem $frak(L) y=0$ satisfying $y_(1)(0)=0$ and $y_(2)'(0)=0$. State the ODE and initial conditions satisfied by the Green's function $g(x, xi)$ in terms of a delta function, solve this problem for $g$, and show that this approach reproduces the expression found by variation of parameters on Sheet 1.
	
	
	
+ /* 3 */ *Eigenfunction expansion.*
	#parts[
		+ /* 3a */ Find the general solution of the Cauchy-Euler equation $ 
				x^(2) y''(x)+3 x y'(x)+(1+alpha) y(x)=0,
			 $ where $alpha$ is a given positive constant.
			
		+ /* 3b */ Use (a) to determine the eigenvalues $lambda_(j)$ and eigenfunctions $y_(j)$ of the self-adjoint problem $ 
				-(x^(3) y'(x))'=lambda x y, wide y(1)=0, wide y(e)=0 .
			 $
			
		+ /* 3c */ Obtain the eigenfunction expansion for the solution of the inhomogeneous problem $ 
				(x^(3) y'(x))'=x, wide y(1)=0, wide y(e)=0,
			 $ giving the coefficients explicitly (i.e. compute the integrals).
	]
	
	
	
+ /* 4 */ *Eigenvalue expansion - two routes.*
	#parts[
		+ /* 4a */ Consider the following eigenvalue problem on $0 <= x <= 1$: $ 
				frak(L) y equiv y''+2 y'+y=lambda y, wide y'(0)+y(0)=0, wide y'(1)+y(1)=0 .
			 $ Compute the eigenvalues $lambda_(k)$, eigenfunctions $y_(k)$, and the adjoint eigenfunctions $w_(k)$.
			
		+ /* 4b */ Under what condition on $f$ does a solution exist for the inhomogeneous problem $ 
				frak(L) y(x)=f(x) quad(0<x<1), wide y'(0)+y(0)=0, wide y'(1)+y(1)=0 ?
			 $
			
		+ /* 4c */ Assuming that the condition in (b) is satisfied, obtain the coefficients in an eigenfunction expansion $y(x)=sum_(k)^(oo) c_(k) y_(k)(x)$.
			
		+ /* 4d */ Convert the problem in (b) to the equivalent Sturm-Liouville problem and show that the eigenfunction expansion of the solution to that problem matches what you found in part (c).
	]
	
	
	
+ /* 5 */ *Legendre's equation and the Fredholm Alternative.* Consider bounded solutions of the eigenvalue problem $ 
		frak(L) y(x) equiv (1-x^(2)) y''(x)-2 x y'(x)=lambda y(x), wide-1<x<1 wide (star)
	 $
	#parts[
		+ /* 5a */ Use the inner product relation to compute $frak(L)^(*)$ and show that the boundary terms vanish identically. Why are no boundary conditions given for $(star)$?
			
		+ /* 5b */ Convert $(star)$ to Sturm-Liouville form. What orthogonality relation do the eigenfunctions satisfy?
			
		+ /* 5c */ Verify that $y_(0)(x)=1$ is an eigenfunction for $lambda_(0)=0$. For the inhomogeneous problem $frak(L) y(x)=f(x)$ to be solvable for $y$, what condition must $f$ satisfy?
			
		+ /* 5d */ Consider the equation $frak(L) y(x)=-2 x$. Explain via the Fredholm Alternative why this problem should have a non-unique solution. Show that $ 
				y=x+A log ((1+x)/(1-x))+B
			 $ is a solution for any values of $A$ and $B$. What can you conclude about the constant $A$?
			
		+ /* 5e */ Find the general solution of $frak(L) y=1$. Does this match your reasoning in (c)?
	]
	
	
	
+ /* 6 */ (Optional) *Green's function and eigenfunctions for Sturm-Liouville.* Consider the Sturm-Liouville problem $ 
		frak(L) y equiv-(p y')'+q y=f, wide a<x<b
	 $ where $p(x) != 0$ on $a<x<b$, with the boundary conditions $ 
		frak(B)_(ell) y equiv y(a)=0, wide frak(B)_(r) y equiv y(b)=0
	 $ Let $y_(ell)$ and $y_(r)$ satisfy $frak(L) y_(ell)=0, frak(B)_(ell) y_(ell)=0$, and $frak(L) y_(r)=0, frak(B)_(r) y_(r)=0$, respectively, and let $y_(k)$ be eigenfunctions that satisfy $frak(L) y_(k)=lambda_(k) y_(k)$ with $frak(B)_(ell) y_(k)=frak(B)_(r) y_(k)=0$.
	#parts[
		+ /* 6a */ Use variation of parameters to derive the following expression for the Green's function: $ 
				g(x, xi)= cases(
					 (-y_(ell)(x) y_(r)(xi))/(W(xi) p(xi))  quad& a<x<xi<b ,
					 (-y_(ell)(xi) y_(r)(x))/(W(xi) p(xi))  quad& a<xi<x<b
				) wide (star)
			 $ where $W=y_(ell) y_(r)'-y_(ell)' y_(r)$ is the Wronskian.
			
		+ /* 6b */ Re-derive equation $(star)$ by constructing the Green's function satisfying $frak(L)_(x) g(x, xi)=delta(x-xi)$.
			
		+ /* 6c */ Find an alternative expression for the Green's function in terms of an eigenfunction expansion $g(x, xi)=sum_(k) c_(k)(xi) y_(k)(x)$.
			
		+ /* 6d */ Show that the two expressions agree by expanding $(star)$ directly in an eigenfunction expansion and showing that the coefficients match, i.e. write the expression in $(star)$ as $sum_(k) d_(k)(xi) y_(k)(x)$ and show that $d_(k)=c_(k)$.
	]
