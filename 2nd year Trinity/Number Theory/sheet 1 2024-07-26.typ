#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Number Theory -- Sheet 1])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Trinity Term 2025])

+ /* 1 */ Let $a$ be a positive integer and suppose that in its decimal expansion it has 7 digits: $a=a_0+10 a_1+dots.c+1000000 a_6$. Show that $a$ is divisible by 7 if and only if $a_0+3 a_1+2 a_2-a_3-3 a_4-2 a_5+a_6$ is divisible by 7.
	
	
	
+ /* 2 */ Find a positive integer $x$ such that $x equiv 3(mod 4)$, $2 x equiv 5(mod 9)$, and $7 x equiv 1(mod 11)$.
	
	
	
+ /* 3 */ Find the smallest positive integer $x$ such that $x equiv 11(mod 59)$ and $x equiv 29(mod 71)$.
	
	
	
+ /* 4 */ Show that $2^340 equiv 1(mod 341)$. Comment on this in connection with Fermat's Little Theorem.
	
	
	
+ /* 5 */ Let $n=(6 t+1)(12 t+1)(18 t+1)$ with $6 t+1,12 t+1$ and $18 t+1$ all prime numbers. Prove that $ 
		a^(n-1) equiv 1(mod n)
	 $ whenever $(a, n)=1$. Comment on this in connection with Fermat's Little Theorem.
	
	
+ /* 6 */ Show that if $x$ is an integer then $x^(10) in{-1,0,1}(mod 25)$.
	
	
	
+ /* 7 */ For which $N$ is the following true: if you take an $N$ digit number, reverse its digits and then add the result to the original number, you always get a multiple of 11?
	
	
	
+ /* 8 */ Find all primes $p$ for which the $op("map") phi.alt: bb(Z)  slash  p bb(Z) -> bb(Z)  slash  p bb(Z)$ defined by $phi.alt (x)=x^13$ is a group homomorphism.
	
	
	
+ /* 9 */ Find all four-digit numbers $N$ such that, when written in decimal, the last four digits of any power of $N$ are the same as the digits of $N$.
	
	
	
+ /* 10 */ For each of the following properties, show that there are infinitely many positive integers $n$ which do not have that property.
	#parts[
		+ /* 10a */ $n$ is the sum of at most 3 squares;
			
		+ /* 10b */ $n$ is the sum of at most 8 sixth powers;
			
		+ /* 10c */ $n$ is the sum of at most 11 tenth powers;
			
		+ /* 10d */ $n$ is the sum of at most 15 fourth powers;
			
		+ /* 10e */ $n$ is the sum of at most 7 (positive) seventh powers.
	]
