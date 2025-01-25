#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Statistics -- Sheet 2\ Fisher information, Confidence intervals])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2025-01-06




	
+ /* 1 */ #parts[
		+ /* 1a */ What is the connection between Fisher's information and the asymptotic distribution of the maximum likelihood estimator?
			
		+ /* 1b */ Assume the individuals in a sample of size $n=1 0 2 9$ are independent and that each individual has blood type $M$ with probability $(1-theta)^(2)$, type $M N$ with probability $2 theta(1-theta)$, and type $N$ with probability $theta^(2)$. For the following data (Rice, 2007) find the maximum likelihood estimate $hat(theta)$ and use the asymptotic distribution of the MLE to find an approximate $9 5 %$ confidence interval for $theta$. #align(center, table(columns: 4,
        [Blood Type], $M$, $M N$, $N$, 
        [Frequency], [342], [500], [187], 
			))
	]
	
	
	
+ /* 2 */ Let $X_(1), dots, X_(n)$ be independent $N(mu, sigma^(2))$ random variables. Suppose that $mu$ is known, $sigma$ is unknown and that we want to estimate $psi=log sigma$.
	#parts[
		+ /* 2a */ Find the maximum likelihood estimator $hat(sigma)$ and the asymptotic normal approximation to the distribution of $hat(sigma)$.
			
		+ /* 2b */ Use the delta method to find the asymptotic distribution of $hat(psi)$ and hence find an approximate $9 5 %$ confidence interval for $psi$.
			
		+ /* 2c */ Explain how the interval in (b) can be used to find an approximate confidence interval for $sigma$.
	]
	
	
	
+ /* 3 */ A sequence of estimators $T_(n), n gt.eq.slant 1$, of a scalar parameter $theta$ is called _consistent_ if, for all $theta$ (i.e. whatever the true value of $theta$), we have that $T_(n)$ converges in probability to $theta$ as $n -> oo$. Suppose $T_(n)$ is a sequence of estimators of $theta$ satisfying $op("bias")(T_(n)) -> 0$ and $op("var")(T_(n)) -> 0$ as $n -> oo$. Show that $T_(n)$ is consistent for $theta$. [_Hint: Chebyshev's inequality._]
	
	
	
+ /* 4 */ The following data are time intervals in days between earthquakes which either registered magnitudes greater than 7.5 on the Richter scale or produced over 1,000 fatalities. Recording starts on 16 December, 1902 and ends on 4 March, 1977, a total period of 27,107 days. There were 63 earthquakes in all, and therefore 62 recorded time intervals. #align(center, table(columns: 10,
    [840], [1901], [40], [139], [246], [157], [695], [1336], [780], [1617], 
    [145], [294], [335], [203], [638], [44], [562], [1354], [436], [937], 
    [33], [721], [454], [30], [735], [121], [76], [36], [384], [38], 
    [150], [710], [667], [129], [365], [280], [46], [40], [9], [92], 
    [434], [402], [209], [82], [736], [194], [99], [599], [220], [584], 
    [759], [556], [304], [83], [887], [319], [375], [832], [263], [460], 
    [567], [328],
	))
	#parts[
		+ /* 4a */ Assuming the data to be a random sample $X_(1), dots, X_(n)$ from an exponential distribution with parameter $lambda$, obtain the maximum likelihood estimator $hat(lambda)$ of $lambda$ and calculate the maximum likelihood estimate.
			
		+ /* 4b */ Given that the moment generating function of a gamma distribution with parameters $(n, lambda)$ is $ 
				M_(n)(t)=((lambda)/(lambda-t))^(n),
			 $ show that $Y=sum_(i=1)^(n) X_(i)$ has a gamma distribution.
			
		+ /* 4c */ Show that $ 
				((a)/(n overline(x)), (b)/(n overline(x)))
			 $ is an exact $9 5 %$ central confidence interval for $lambda$ if $ 
				integral_(0)^(a) (y^(n-1) e^(-y))/(Gamma(n)) d y=integral_(b)^(oo) (y^(n-1) e^(-y))/(Gamma(n)) d y=0.0 2 5
			 $
			
		+ /* 4d */ Obtain Fisher's information for $lambda$ and use it to find an approximate $9 5 %$ confidence interval for $lambda$. The interval given by the exact method above is $(0.0 0 1 8,0.0 0 2 9)$. Verify numerically that your approximate interval is close to this.
	]
	
	
	
+ /* 5 */ Let $X_(1), dots, X_(n)$ be a random sample from a normal distribution with known mean $mu$ and unknown variance $sigma^(2)$. Three possible confidence intervals for $sigma^(2)$ are $ 
		(sum_(i=1)^(n) ((X_(i)-overline(X))^(2))/(a_(1)), sum_(i=1)^(n) ((X_(i)-overline(X))^(2))/(a_(2)))wide
		(sum_(i=1)^(n) ((X_(i)-mu )^(2))/(b_(1)), sum_(i=1)^(n) ((X_(i)-mu )^(2))/(b_(2)))wide
		((n(overline(X)-mu)^(2))/(c_(1)), (n(overline(X)-mu)^(2))/(c_(2)))
	 $ where $a_(1), a_(2), b_(1), b_(2), c_(1), c_(2)$ are constants. [_For a $chi^(2)$ with e.g. 6 degrees of freedom, you can use_ `qchisq(0.05,6)` _to find the 0.05 quantile._]
	#parts[
		+ /* 5a */ Find values of these six constants which give confidence level 0.90 for each of the three intervals when $n=1 0$ and compare the expected widths of the three intervals in this case.
			
		+ /* 5b */ With $sigma^(2)=1$, what value of $n$ is required to achieve a $9 0 %$ confidence interval of expected width less than 2 in the second and third cases above?
	]
	
	
	
+ /* 6 */ Let $X_(1), dots, X_(m)$ and $Y_(1), dots, Y_(n)$ be independent random samples from normal distributions $N (mu_(1), sigma^(2))$ and $N (mu_(2), sigma^(2))$, respectively, where the parameters $mu_(1), mu_(2), sigma^(2)$ are unknown. Let $ 
		S^(2)=(m+n-2)^(-1)(sum_(i=1)^(m)(X_(i)-overline(X))^(2)+sum_(j=1)^(n)(Y_(j)-overline(Y))^(2))
	 $ Determine the distributions of both $ 
		(m+n-2) S^(2)  slash  sigma^(2) quad  "and"  quad (overline(X)-overline(Y)-(mu_(1)-mu_(2)))/(sqrt(S^(2)((1)/(m)+(1)/(n))))
	 $ Show how to construct a confidence interval for $mu_(1)-mu_(2)$.
	
+ /* 7 */ Ten students were asked to guess the width of a lecture room. Their guesses (in metres) were: $1 0,1 1,1 2,1 3,1 5,1 6,1 7,1 8,1 9,2 5$. The actual width of the room was 13.1 m.
	#parts[
		+ /* 7a */ Assuming the data arise from a normal distribution, how would you test whether this distribution has the correct mean? State the appropriate null and alternative hypotheses, and any assumptions you need to make for the hypothesis test to be appropriate.
			
		+ /* 7b */ Carry out the test you suggested in (a) and state your conclusions.
			
		+ /* 7c */ Modify your test to test whether the data are from a distribution with a mean value higher than the true value and re-state your conclusions.
	]
	
	
	
+ /* 8 */ #parts[
		+ /* 8a */ Read in the earthquake data from question 4 and try an exponential Q-Q plot: ```r
				x <- scan("http://www.stats.ox.ac.uk/~laws/partA-stats/data/quakes.txt")
				n <- length(x)
				k <- 1:n
				plot(-log(1 - k/(n+1)), sort(x), main = "Exponential Q-Q Plot",
				  ylab = "Ordered data", xlab = "-log[1 - k/(n+1)]")
				abline(0, mean(x))
				# abline above plots a line with intercept = 0 and gradient = mean(x)
				# - from lecture notes the exponential Q-Q plot should have intercept O
				# and gradient mu if the data are exponential with mean mu
				# use ?abline to see the help page for abline
			``` Is an exponential model a reasonable assumption for this dataset?
			
		+ /* 8b */ The $2.5 %$ and $9 7.5 %$ quantiles for a gamma distribution with parameters $(n, 1)$ can be calculated as follows.```r
				a <- qgamma(0.025, n)
				b <- qgamma(0.975, n)
			``` That is, the function `qgamma(p, n)` calculates the $p$th quantile of a gamma distribution with shape parameter $n$ and rate parameter 1 . Calculate the exact confidence interval of question 4: `c(a, b) / sum(x)`.
			
		+ /* 8c */ Also use R to check that the approximate $9 5 %$ confidence interval for $lambda$ obtained using Fisher's information is as given in question 4 -- you might have obtained one of two possible approx intervals: ```r
				# approx interval using lambda.hat +/- 1.96*I(lambda.hat)^(-1/2)
				xbar <- mean(x)
				c(1 - 1.96/sqrt(n), 1 + 1.96/sqrt(n)) / xbar
				
				# second approx interval from substituting I(lambda) = n/lambda^(2)
				# and then solving the inequalities
				# i.e. not replacing lambda by lambda.hat in order to estimate a variance
				c(1/(1 + 1.96/sqrt(n)), 1/(1 - 1.96/sqrt(n))) / xbar
			```
	]
	
	
	
+ /* 9 */ Following the previous question, for data that are exponential with parameter $lambda$ there are three possible confidence intervals for $lambda$ -- one based on the gamma distribution plus two approximation possibilities. These three are all different, but numerically they are almost the same in question 4 where $n=6 2$. Use the code below to investigate how the three differ when $n$ is small, e.g. $n=1 0$. What do you conclude? ```r
		# investigate how the three intervals perform in small samples,
		# e.g. n = 10, using data generated from an exponential, parameter 1
		
		# generate the sample, calculate and plot the three intervals
		# repeat m times, e.g. m = 33 giving 99 intervals in total
		
		# copy-and-paste the following chunk into R, you don't need to work out
		# the details of what all the plotting commands are doing
		# ---begin chunk---
		n <- 10
		a <- qgamma(0.025, n)
		b <- qgamma(0.975, n)
		m <- 33
		
		plot(1, 1, type = "n", yaxt = "n", xlim = c(0, 5), ylim = c(0, 4*m),
      xlab = "lambda", ylab = "",
      main = paste("95% CIs: samples of size", n, "from exponential, parameter 1"))
		abline(v = 1)
		legend("topright", c("interval1", "interval2", "interval3"),
      lty = 1, lwd = 2, col = c(1, "orange2", "steelblue2"))
		
		for (i in 1:m) {
      x <- rexp(n)
      ci1 <- c(a, b) / sum(x)
      ci2 <- c(1 - 1.96/sqrt(n), 1 + 1.96/sqrt(n)) / mean(x)
      ci3 <- c(1/(1 + 1.96/sqrt(n)), 1/(1 - 1.96/sqrt(n))) / mean(x)
      lines(ci1, rep(4*i-1, 2), lwd = 2)
      lines(ci2, rep(4*i-2, 2), lwd = 2, col = "orange")
      lines(ci3, rep(4*i-3, 2), lwd = 2, col = "steelblue")
		}
		# ---end chunk---
		
		# x <- rexp(n) generates a sample of size n
		# use ?rexp to see the help page for rexp - when no rate parameter is
		# given, rate = 1 is the default, hence vertical line on the plot at
		# the true value lambda = 1
		
		# the three intervals behave differently in small samples
		# try repeating with larger n, e.g. n = 20, 50
		# - you only need to change the first line n <- 10 to a different value
		# at n = 50 the three intervals are close, especially intervals 1 & 2
		# (and n = 62 for the data in question 3)
	```
	
	
	
+ /* 10 */ To do question 7 you need the sample mean $overline(x)$ and sample standard deviation $s$: ```r
		x <- c(10, 11, 12, 13, 15, 16, 17, 18, 19, 25)
		mean(x)
		sd(x)
	``` Use the functions `qt` and/or `pt` to determine the significance (or otherwise) of the test statistic in question 7: The $p$th quantile of a $t_(r)$-distribution can be calculated using `qt(p,r)`, so e.g. the $9 7.5 %$ quantile of a $t_(4)$-distribution can be found using: `qt(0.975,4)`.\ Alternatively, the cdf of a $t_(r)$-distribution at $y$ can be calculated using `pt(y,r)`, so e.g. the probability that a $t_(4)$ random variable is less than 1.96 is given by: `pt(1.96,4)`. ```r
		# test statistic
		tobs <- sqrt(10)*(mean(x) - 13.1)/sd(x)
		
		# two-sided p-value
		2*(1 - pt(tobs, df = 9))
		
		# one-sided p-value
		1 - pt(tobs, df = 9)
		
		# can check using t.test, see ?t.test
		# - by default it assumes two-sided, and also uses a method for unequal variances
		# hence we want var.equal = TRUE
		t.test(x, mu = 13.1, var.equal = TRUE)
		
		# one-sided
		t.test(x, mu = 13.1, alternative = "greater", var.equal = TRUE)
		
		# or could compare tobs to the quantiles
		qt(0.975, df = 9)
		qt(0.95, df = 9)
	```
