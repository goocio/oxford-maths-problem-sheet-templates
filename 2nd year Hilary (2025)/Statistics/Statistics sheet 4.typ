#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Statistics -- Sheet 4\ Prior and Posterior distributions])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2025-01-06




	
+ /* 1 */ Suppose $X_(1), dots, X_(n)$ are independent, each having a geometric distribution with probability mass function $f(x mid(|) theta)=(1-theta)^(x) theta$ for $x=0,1, dots$. Suppose that the prior for $theta$ is a $op("Beta")(a, b)$ density. Find the posterior distribution of $theta$.
	
	
	
+ /* 2 */ Let $theta>0$ be an unknown parameter and let $c>0$ be a known constant. Conditional on $theta$, suppose $X_(1), dots, X_(n)$ are independent each with probability density function $ 
		f(x mid(|) theta)=theta c^(theta) x^(-(theta+1)), quad x gt.eq.slant c
	 $ and suppose the prior for $theta$ is a $op("Gamma")(alpha, beta)$ density. Find the posterior distribution of $theta$.
	
	
	
+ /* 3 */ Let $r gt.eq.slant 1$ be a known integer and let $theta in[0,1]$ be an unknown parameter. The negative binomial distribution with index $r$ and parameter $theta$ has probability mass function $ 
		f(x mid(|) theta)=binom(x+r-1, x)(1-theta)^(x) theta^(r) quad  "for"  x=0,1, dots
	 $ Let $theta$ have a $op("Beta")(a, b)$ prior density and suppose, given $theta$, that $X_(1), dots, X_(n)$ are independent each with the above negative binomial distribution.
	#parts[
		+ /* 3a */ Show that the posterior density is also a Beta density.
			
		+ /* 3b */ Explain how to construct a $1 0 0(1-alpha) %$ equal-tailed credible interval for $theta$. Will this interval be a highest posterior density interval?
	]
	
	
+ /* 4 */ Suppose that $X$ has a $N(theta, phi.alt)$ distribution, where $phi.alt$ is known, Suppose also that the prior distribution for $theta$ is $N(theta_(0), phi.alt_(0))$, where $theta_(0)$ and $phi.alt_(0)$ are known.
	#parts[
		+ /* 4a */ Find the posterior distribution of $theta$ given $X=x$.
			
		+ /* 4b */ Show that the posterior mean of $theta$ always lies between the prior mean and the observed value $x$.
			
		+ /* 4c */ Construct a $1 0 0(1-alpha) %$ highest posterior density interval for $theta$.
			
		+ /* 4d */ Let $phi.alt=2, theta_(0)=0$ and $phi.alt_(0)=2$.
			#subparts[
				+ /* 4di */ Suppose the observed value is $x=4$. What are the mean and variance of the resulting posterior distribution? Sketch the prior, likelihood, and posterior on a single set of coordinate axes.
					
				+ /* 4dii */ Repeat (i) assuming $phi.alt_(0)=1 8$. Explain any resulting differences. Which of these two priors would likely have more appeal for a frequentist statistician?
			]
	]
	
	
	
+ /* 5 */ Let $X$ be the number of heads when a coin with probability $theta$ of heads is flipped $n$ times.
	#parts[
		+ /* 5a */ When the prior is $pi(theta)$, the prior predictive distribution for $X$ (the predictive distribution before observing any data) is given by $ 
				P(X=k)=integral_(0)^(1) P(X=k mid(|) theta) pi(theta) space.nobreak dif theta, quad k=0,1, dots, n
			 $ Find the prior predictive distribution when $pi(theta)$ is uniform on $(0,1)$.
			
		+ /* 5b */ Suppose you assign a $op("Beta")(a, b)$ prior for $theta$, and then you observe $x$ heads out of $n$ flips. Show that the posterior mean of $theta$ is always lies between your prior mean, $a  slash (a+b)$, and the observed relative frequency of heads, $x  slash  n$.
			
		+ /* 5c */ Show that, if the prior distribution on $theta$ is uniform, then the posterior variance is always less than the prior variance.
			
		+ /* 5d */ Give an example of a $op("Beta")(a, b)$ prior distribution and values of $x, n$ for which the posterior variance is larger than the prior variance. (Try $x=n=1$.)
	]
	
	
	
+ /* 6 */ A coin, with probability $theta$ of heads, is flipped $n$ times and $r$ heads are observed.
	#parts[
		+ /* 6a */ If the prior for $theta$ is a uniform distribution on $(0,1)$, what is the probability that the next flip is a head?
			
		+ /* 6b */ Can you generalise to the case where $theta$ has a $op("Beta")(a, b)$ prior and where we wish to find the probability of getting $k$ heads from $m$ further flips?
	]
	
	
+ /* 7 */ #parts[
		+ /* 7a */ Let $X ~ N(theta, sigma_(0)^(2))$, where $sigma_(0)^(2)$ is known. Find the Jeffreys' prior for $theta$.
			
		+ /* 7b */ Let $X ~ N(mu_(0), sigma^(2))$, where $mu_(0)$ is known. Find the Jeffreys' prior for $sigma$.
			
		+ /* 7c */ Let $X$ be Poisson with parameter $lambda$. Find the Jeffreys' prior for $lambda$. Check that the posterior distribution of $lambda$ given $X=x$ is proper, but that the Jeffreys' prior is not.
	]
	
	
	
+ /* 8 */ Suppose $X$ is the number of successes in a binomial experiment with $n$ trials and probability of success $theta$. Either $H_(0): theta=(1)/(2)$ or $H_(1): theta=(3)/(4)$ is true. Show that the posterior probability that $H_(0)$ is true is greater than the prior probability for $H_(0)$ if and only if $ 
		x log 3<n log 2.
	 $
	
	
	
+ /* 9 */ Let $X ~ op("Binomial")(n, theta)$, where the prior for $theta$ is uniform on $(0,1)$. Suppose that we wish to compare the hypotheses $H_(0): theta lt.eq.slant (1)/(2)$ and $H_(1): theta>(1)/(2)$.
	#parts[
		+ /* 9a */ What are the prior odds of $H_(0)$ relative to $H_(1)$?
			
		+ /* 9b */ Find an expression for the posterior odds of $H_(0)$ relative to $H_(1)$.
			
		+ /* 9c */ If we observe $X=n$, find the Bayes factor $B$ of $H_(0)$ relative to $H_(1)$.
			
		+ /* 9d */ Check that $B -> 0$ as $n -> oo$. Why is this expected?
	]
	
	
	
+ /* 10 */ Suppose we have a random sample $X_(1), dots, X_(n)$ from a Poisson distribution with mean $theta$. Suppose we wish to test the hypothesis $H_(0): theta=theta_(0)$ against $H_(1): theta != theta_(0)$ and that, under $H_(1)$, the prior distribution $pi(theta mid(|) H_(1))$ for $theta$ is given by $ 
		pi(theta mid(|) H_(1))=(beta^(alpha))/(Gamma(alpha)) theta^(alpha-1) e^(-beta theta), quad theta>0.
	 $
	#parts[
		+ /* 10a */ Calculate the Bayes factor of $H_(0)$ relative to $H_(1)$.
			
		+ /* 10b */ When $n=6, sum x_(i)=1 9, theta_(0)=2$, find the numerical value of the Bayes factor (i) when $alpha=4$ and $beta=(2)/(3)$, and (ii) when $alpha=3 6$ and $beta=6$. Compare and interpret the values of the Bayes factor in cases (i) and (ii).
	]