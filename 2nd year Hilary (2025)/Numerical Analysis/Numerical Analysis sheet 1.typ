#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Numerical Analysis -- Sheet 1\ Lagrange interpolation, LU, QR])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2024-07-26




	
+ /* 1 */ Construct the Lagrange interpolating polynomial for the data #align(center, table(columns: 4, $x$, [0], [1], [3], $y$, [3], [2], [6]))
	
	
	
+ /* 2 */ If $p_(n) in Pi_(n)$ interpolates $f$ at $x_(0), x_(1), dots, x_(n)$, prove that $p_(n)+q$ is the Lagrange interpolating polynomial to $f+q$ at $x_(0), x_(1), dots, x_(n)$ whenever $q in Pi_(n)$.
	
	
	
+ /* 3 */ Consider interpolating $1  slash  x$ by $p_(n) in Pi_(n)$ (i.e. at $n+1$ points) on [1,2]. If $e(x)$ is the error, show that $|e(x)| lt.eq.slant 1$ for $x in[1,2]$ with arbitrarily distributed points, but $|e(x)| lt.eq.slant$ $1  slash  2^((n+1)  slash  2)$ for all $x in[1,2]$ if $n+1$ is even and half of the interpolation points are in $[1, (3)/(2)]$ and half in $((3)/(2), 2 ]$. In this latter situation, how many points would be needed to guarantee $|e(x)| lt.eq.slant 1 0^(-3)$?
	
	
	
+ /* 4 */ Show that $sum_(k=0)^(n) q(x_(k)) L_(n, k)(x)=q(x)$ whenever $q in Pi_(n)$. (_Optional: How many ways can you prove this?_) Also, show that $sum_(k=0)^(n) x_(k)^(l) L_(n, k)(x)=x^(l)$ for nonnegative integers $l lt.eq.slant n$.
	
	
	
+ /* 5 */ #parts[
		+ /* 5a */ By performing Gauss Elimination (without pivoting), solve $ 
				mat(delim: "[",
					2 , 1 , 1 , 0 ;
					4 , 3 , 3 , 1 ;
					8 , 7 , 9 , 5 ;
					6 , 7 , 9 , 8
				)mat(delim: "[",
					a ;
					b ;
					c ;
					d
				)=mat(delim: "[",
					3 ;
					8 ;
					2 4 ;
					2 5
				).
			 $
			
		+ /* 5b */ From your calculations, write down an LU factorisation of the matrix $A$ above, and verify that $L U=A$. Then by successive back and forwards substitutions (and without further factorisation) solve $A x=b_(2)$ where $b_(2)=[4space 7space 9space 2]^T$.
	]
	
	
	
+ /* 6 */ What is the determinant of the matrix $A$ in the question above? (_Note one of the few algebraic properties of the determinant is that $det(B C)=det(B) det(C)$ and you might also want to consider what is the determinant of a triangular matrix._)
	
	
	
+ /* 7 */ #parts[
		+ /* 7a */ Suppose $A$ is a real $n times n$ matrix with $n gt.eq.slant 2$ and that the permutation matrix $ 
				P=mat(delim: "[",
					0 , dots.c , 0 , 1 ;
					0 , dots.c , 1 , 0 ;
					dots.v , dots.up , dots.v , dots.v ;
					1 , dots.c , 0 , 0
				).
			 $ Show that pre-multiplication of $A$ by $P$ reverses the order of the rows of $A$.
			
		+ /* 7b */ If $A=L U$ is an $L U$ factorisation of $A$ (without pivoting), what is the structure of $P L P$? Hence describe how to calculate a factorisation $A=hat(U) hat(L)$ where $hat(U)$ is unit upper triangular and $hat(L)$ is lower triangular.
	]
	
	
	
+ /* 8 */ Suppose that $A$ is a square nonsingular matrix. Prove that the factors $Q$ and $R$ featuring in the QR factorisation of $A$ are unique if the diagonal entries of $R$ are all positive. How many possibilities are there if this restriction is removed?
	
	
	
+ /* 9 */ By considering the QR factorisation in which the diagonal entries of $R$ are all positive as in the question above (or otherwise), prove that any orthogonal matrix may be expressed as the product of Householder matrices.
	
	
	
+ /* 10 */ Prove that the product of two lower triangular matrices is lower triangular and that the inverse of a non-singular lower triangular matrix is lower triangular. Deduce similar results for upper triangular matrices.
	
	
	
+ /* 11 */ (MATLAB/Python exercise) Using a loop and tic and toc compare the time it takes to do (pivoted) LU and QR factorisations. For example, for random matrices of dimension $2^(5)$ to $2^(1 0)$ ```
		for k=5:10, A=randn(2^k); tic, [L,U,P]=lu(A); toc,...
		tic, [Q,R]=qr(A); toc, end
	```
	should give some timings. What do you think the computational work is for QR factorisation given that LU is to leading order $(2)/(3) n^(3)$? Note `qr` uses Householder matrices as described in lectures to compute the QR factorisation.
	
	
	
+ /* 12 */ (_Optional:_) Given an LU factorisation of a matrix $A$, how might one calculate a column of the inverse of $A$? Estimate the computational work in calculating $A^(-1)$ and hence in solving $A x=b$ via explicit computation of $A^(-1)$ and multiplication by $b$.\ Are you now convinced that this is _not_ the way to solve linear systems of equations in practice?!\ An even worse technique would be to apply GE separately for each column: what would the computational cost be then?
