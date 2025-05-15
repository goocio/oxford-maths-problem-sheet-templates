#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Mathematical Modelling in Biology -- Sheet 1])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Trinity Term 2025])

+ /* 1 */ A model for harvesting a population takes the form: $ 
		(dif N)/(dif t)=r N (1-(N)/(K))-Y_0
	 $ where $N(t)$ is the population density at time $t$, and $r, K$ and $Y_0$ are positive constants.
	#parts[
		+ /* 1a */ Explain why this is called a constant yield model.
			
		+ /* 1b */ Show that for $Y_0<(r K)/4$, this equation has two steady states, and explain graphically why one of these steady states is linearly stable while the other is linearly unstable.
			
		+ /* 1c */ Show that the recovery time for harvesting at a yield $Y_0$, $T_(R)(Y_0)$, satisfies $ 
				(T_(R)(Y_0))/(T_(R)(0))=1/((1-(Y_0)/(Y_(M)))^(1/2))
			 $ for $Y_0<Y_(M)$ and $Y_(M)=(r K)/4$.
			
		+ /* 1d */ Why is this harvesting approach worse than the constant effort approach if we aim for maximum yield $(Y_(M))$.
			
		+ /* 1e */ Explain why this model is unrealistic for $Y_0>Y_(M)$.
			
		+ /* 1f */ Why might you have anticipated right from the outset that this model could be unrealistic in certain circumstances?
	]
	
	
+ /* 2 */ A continuous-time model for the evolution of a prey species (density $N(t)$, where $t$ is time), takes the form: $ 
		(dif N)/(dif t)=R N (1-(N)/(K))-P (1-exp [-(N^2)/(epsilon A^2)])
	 $ where $0<epsilon << 1$ and $R, K, P$ and $A$ are positive constants.
	#parts[
		+ /* 2a */ Explain the biological interpretation of the different terms in the model.
			
		+ /* 2b */ If the units of $N$ are density and those of $t$ are time, what are the dimensions of $R$, $K$, $P$, $A$ and $epsilon$? Hence show that $ 
				u=(N)/(A), quad tau=(P)/(A) t, quad r=(A R)/(P), quad q=(K)/(A)
			 $ are non-dimensional.
			
		+ /* 2c */ Show that the model can be non-dimensionalised to give $ 
				(dif u)/(dif tau)=r u (1-(u)/(q) )-(1-exp [-(u^2)/(epsilon)])
			 $ where $r$ and $q$ are positive parameters.
			
		+ /* 2d */ If $r q>4$, show that it is possible to have three positive steady states.
			
		+ /* 2e */ Could this model exhibit hysteresis? Justify your answer.
	]
	
	
+ /* 3 */ Suppose that the evolution of a population can be described by a discrete-time Ricker model of the form $ 
		N_(t+1)=N_(t) exp [r (1-(N_(t))/(K))]
	 $ where $0<r<2$.
	#parts[
		+ /* 3a */ Describe the biological interpretation of the model.
			
		+ /* 3b */ Determine any non-negative steady states and their linear stability.
			
		+ /* 3c */ Construct a cobweb map the model and discuss the global qualitative behaviour of the solutions.
	]
	
	
	
+ /* 4 */ Consider the effect of regularly harvesting the population of a species for which the model equation is $ 
		N_(t+1)=(b N_(t)^2)/(1+N_(t)^2)-E N_(t) := f(N_(t) ; E)
	 $ where $E$ is a measure of the effort expended in obtaining the harvest, $E N_(t)$, and the parameters are such that $b>2$ and $E>0$.
	#parts[
		+ /* 4a */ Determine the steady states and hence show that if the effort $E>E_(M)=(b-2)  slash  2$, then no harvest is obtained.
			
		+ /* 4b */ If $E<E_(M)$ show by cob-webbing $N_(t+1)=f(N_(t) ; E)$, or otherwise, that the model is realistic only if the population, $N_(t)$, always lies between two positive values for which you should find analytic expressions (but do not solve explicitly).
			
		+ /* 4c */ Demonstrate the existence of a tangent bifurcation as $E -> E_(M)$.
	]
	
	
	
+ /* 5 */ The interaction between two populations with densities $N_1$ and $N_2$ is modelled by $ 
		(dif N_1)/(dif t) &= r N_1 (1-(N_1)/(K) )-a N_1 N_2 (1-exp [-b N_1 ]) \ 
		(dif N_2)/(dif t) &= -d N_2+e N_2(1-exp [-b N_1])
	 $ where $a$, $b$, $d$, $e$, $r$, and $K$ are positive constants.
	#parts[
		+ /* 5a */ What type of interaction exists between $N_1$ and $N_2$? What do the various terms imply ecologically?
			
		+ /* 5b */ Non-dimensionalise the system by writing $ 
				u=(N_1)/(K), quad v=(a N_2)/(r), quad tau=r t, quad alpha=(e)/(r), quad delta=(d)/(r), quad beta=b K.
			 $
			
		+ /* 5c */ Determine the non-negative equilibria and note any parameter restrictions.
			
		+ /* 5d */ Discuss the linear stability of the equilibria.
			
		+ /* 5e */ Show that a non-zero $N_2$ population can exist if $beta>beta_(c)=-ln (1-delta  slash  alpha)$.
			
		+ /* 5f */ Briefly describe the bifurcation behaviour as $beta$ increases with $0<delta  slash  alpha<1$.
	]
	
	
	
	= Optional
+ /* 6 */ Consider a lake with some fish attractive to people who like to fish (from here on denoted "fishers"). We wish to model the fish-fishers interactions under the following assumptions:
	
		- the fish population grows logistically in the absence of fishing;
		- the presence of fishers depresses the fish growth rate at a rate jointly proportional to the size of the fish and fishers populations;
		- fishing crew are attracted to the lake at a rate directly proportional to the number of fish in the lake;
		- fishers are discouraged from the lake at a rate directly proportional to the number of fishers already there.
	
	#parts[
		+ /* 6a */ Write down a mathematical model for this situation, clearly defining your terms.
			
		+ /* 6b */ Show that a non-dimensionalised version of the model is $ 
				(dif u)/(dif tau)=r u(1-u)-u v wide
				(dif v)/(dif tau)=beta u-v
			 $ where $u$ and $v$ represent the non-dimensionalised fish and fishers populations, respectively.
			
		+ /* 6c */ Calculate the steady states of the system and determine their stability.
			
		+ /* 6d */ Draw the phase plane, including the nullclines and phase trajectories.
			
		+ /* 6e */ What would be the effect of adding fish to the lake at a constant rate?
	]
	
	
	
+ /* 7 */ #parts[
		+ /* 7a */ What kind of interactive behaviour between two populations, $N_1$ and $N_2$, is suggested by the model $ 
				(dif N_1)/(dif t) &= r_1 N_1 (1-(N_1)/(K_1+b_12 N_2)) \ 
				(dif N_2)/(dif t) &= r_2 N_2 (1-(N_2)/(K_2+b_21 N_1))
			 $ where $r_1$, $r_2$, $K_1$, $K_2$, $b_12$, and $b_21$ are positive constants?
			
		+ /* 7b */ Show that, with appropriate non-dimensionalisation, this model takes the form $ 
				(dif u_1)/(dif tau) &= u_1 (1-(u_1)/(1+alpha_12 u_2)) \ 
				(dif u_2)/(dif tau) &= rho u_2 (1-(u_2)/(1+alpha_21 u_1))
			 $ where $u_1=(N_1)/(K_1)$, $u_2=(N_2)/(K_2)$, $tau$ is non-dimensionalised time, and $alpha_12$, $alpha_21$, and $rho$ are positive parameters.
			
		+ /* 7c */ Determine the steady states and their linear stability, taking care to list any restrictions on parameters.
			
		+ /* 7d */ By drawing the nullclines and sketching phase trajectories, briefly discuss the behaviour of the model for the cases $alpha_12 alpha_21<1$ and $alpha_12 alpha_21>1$.
	]
