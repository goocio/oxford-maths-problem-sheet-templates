#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Number Theory -- Sheet 2])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Trinity Term 2025])

+ /* 1 */ Suppose that $p$ and $q=2 p+1$ are both odd primes. Explain why (a) $2 p$ is a quadratic non-residue of $q$ and (b) $q$ has $p-1$ primitive roots. Show that the primitive roots of $q$ are precisely the quadratic non-residues of $q$, other than $2 p$.
	
	
	
+ /* 2 */ Prove that if $n$ has a primitive root then it has $phi.alt(phi.alt(n))$ of them.
	
	
	
+ /* 3 */ Let $p$ be an odd prime. Show that every element in $bb(Z) slash p bb(Z)$ can be written as the sum of two squares.
	
	
	
+ /* 4 */ Do there exist integer solutions to the equation $x^2 equiv 251 mod 779$? [_Note that $779=19 times 41$._]
	
	
	
+ /* 5 */ Does the equation $x^2+10 x+15 equiv 0 mod 45083$ have any integer solutions? [_Note that $45083$ is prime._]
	
	
+ /* 6 */ Use the Fermat method to factorise 9579, without using a calculator.
	
	
	
+ /* 7 */ For any integer $n gt.eq.slant 2$, let $F_(n)=2^(2^n)+1$ be the $n$th "Fermat number". Suppose that $p$ is a prime factor of $F_n$.
	#parts[
		+ /* 7a */ Show that $op("ord")_(p)(2)=2^(n+1)$.
			
		+ /* 7b */ Show that $ 
				2^((p-1) slash 2) equiv 1 mod p
			 $
			
		+ /* 7c */ Deduce that $p=1+2^(n+2) k$ for some $k in bb(N)$.
			
		+ /* 7d */ Hence, or otherwise, verify that $F_4=65537$ is prime.
	]
	
	
	
+ /* 8 */ #parts[
		+ /* 8a */ Using the Fermat method, factorise 2881, and hence find $phi.alt(2881)$.
			
		+ /* 8b */ A message has been encrypted using RSA and the encoding $01 <-> A$, $02 <-> B$, $03 <-> C$, etc. with exponent $e=5$ and modulus $n=2881$. The message is 235221380828. What is the plain-text message? I suggest using a free online modular exponentiation calculator, which you can find by a google search for those terms.
	]
	
	
	
+ /* 9 */ Let $p gt.eq.slant 7$ be a prime. Show that every nonzero element of $bb(Z) slash p bb(Z)$ is a sum of two non-zero squares.
