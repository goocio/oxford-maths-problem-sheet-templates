#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Numerical Analysis -- Sheet 2\ SVD, least-squares, and eigenvalues])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2024-07-26




	
+ /* 1 */ #parts[
		+ /* 1a */ A $2 times 2$ Givens rotation is a matrix of the form $J=mat(delim: "[",c , s ; -s , c)$, where $c=cos theta$, $s=sin theta$. Verify that $J$ is orthogonal, and show that for any $mat(delim: "[",a ; b) in bb(R)^(2)$, there exists $theta$ such that $J mat(delim: "[",a ; b)=mat(delim: "[",C ; 0)$. What are the possible values of $C$?
			
		+ /* 1b */ A general $n times n$ Givens rotation $J(i, j)$ is equal to the identity $I_(n)$ except for the $(i, i),(i, j),(j, i),(j, j)$ entries, which are equal to $c, s,-s, c$ respectively (so they form the same matrix $mat(delim: "[",c , s ; -s , c)$). Show that if $x in bb(R)^(n)$ then (denoting by $J(i, j)$ a Givens rotation) $ 
				J(1, n) J(1, n-1) dots.c J(1,3) J(1,2) x=mat(delim: "[",
					beta ;
					0 ;
					dots.v ;
					0
				)
			 $ for some $beta$ and further prove that $beta^(2)=x^(T) x$.
	]
	
	
	
+ /* 2 */ Consider the least-squares problem $ 
		min _(x)||A x-b||, quad A in bb(R)^(m times n),space b in bb(R)^(m times 1),space m >= n wide (star)
	 $ Suppose that $op("rank")(A)=n$.
	#parts[
		+ /* 2a */ Derive a solution $x$ based on the (full or thin) QR factorisation of $A$.
			
		+ /* 2b */ Show that $x=(A^(T) A)^(-1) A^(T) b$ is also the solution for ($star$). (_The first QR-based method has better numerical stability and hence is preferred._)
	]
	
	
	
+ /* 3 */ Show that all the eigenvalues of a real symmetric matrix $A$ are real, and eigenvalues of an orthogonal matrix are on the unit circle.
	
	
	
+ /* 4 */ What is the SVD of a normal matrix $A$, with respect to the eigenvalues and eigenvectors? What if $A$ is symmetric? And unitary?
	
	
	
+ /* 5 */ If $A in bb(R)^(n times n)$ is nonsingular, what is the SVD of $A^(-1)$ in terms of that of $A$?
	
	
	
+ /* 6 */ Give estimates based on Gershgorin's theorem for the eigenvalues of $ 
		A=mat(delim: "[",
			9 , 1 , 0 ;
			1 , 4 , epsilon ;
			0 , epsilon , 1
		), wide|epsilon|<1.
	 $ Find a way to establish the tighter bound $|lambda_(3)-1| <= epsilon^(2)$ on the smallest eigenvalue of $A$. (_Hint: consider diagonal similarity transformations._)
	
	
	
+ /* 7 */ We have seen how the QR algorithm computes the eigenvalue decomposition of symmetric matrices. Using QR, describe an algorithm that computes the SVD of $A in bb(R)^(m times n)$ ($m >= n$). You can assume that $op("rank")(A)=n$.
	
	
	
+ /* 8 */ The (unshifted) QR algorithm performs: $A_(1)=A$, and for $k=1,2, dots$ form the QR factorisation $A_(k)=Q_(k) R_(k)$, and set $A_(k+1)=R_(k) Q_(k)$. Let $A$ be a $1 0 times 1 0$ symmetric matrix with eigenvalues $1,2, dots, 1 0$. Which (off-diagonal) elements of $A_(k)$ converge to 0 the fastest? (_Recall the connection between the QR algorithm and power method._)
	
	
	
+ /* 9 */ (Computational) Implement the QR algorithm in MATLAB or Python, and explore the following. (This exercise should be doable in about 10 lines of code!)
	#parts[
		+ /* 9a */ Verify the above problem in your code. (Take $A=Q lambda Q^(T)$, where $Q$ is a randomly generated orthogonal matrix, e.g. `[Q,R]=qr (randn(n));`.)
			
		+ /* 9b */ What will happen if the QR algorithm (without shifts) is applied to an orthogonal matrix $A$? Explain why this is not a 'counterexample' for the convergence of the QR algorithm. Modify the algorithm so that it computes an eigenvalue decomposition of $A$.
	]
	
	
	
+ /* 10 */ (Optional) Let $A in bb(C)^(n times n)$ and define $ 
		C_(i, j)={z in bb(C): |a_(i i)-z| |a_(j j)-z| <= (sum_(k != i\ k=1)^(n)|a_(i k)|)(sum_(k != j\ k=1)^(n)|a_(j k)|)},quad
		1 <= i<j <= n
	 $ These are called the _ovals of Cassini_.
	#parts[
		+ /* 10a */ Prove that all eigenvalues of $A$ lie in the union of the $attach(C, bl: n, br: 2)=(n(n-1))/(2)$ regions $union.big_(i<j) C_(i, j)$.
			
		+ /* 10b */ Prove that $C := union.big_(i<j) C_(i, j) subset.eq D$, that is, $C$ is a subset of the union of the Gerschgorin disks $D := union.big_(i){z in bb(C): |z-a_(i i)|<= sum_(j != i)|a_(i j)|}$.
	]
