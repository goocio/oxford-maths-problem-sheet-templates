#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Mathematical Modelling in Biology -- Sheet 2])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Trinity Term 2025])

+ /* 1 */ Recall from lecture 5 that the non-dimensionalised Michael-Menten model takes the form: $ 
		(d u)/(d tau) & =-u+(u+K-lambda) v \ 
		epsilon (d v)/(d tau) & =u-(u+K) v
	 $ where $u(tau), v(tau)$ are, respectively, non-dimensionalised substrate and complex concentrations, $K$ and $lambda$ are positive parameters, with $K>lambda$, and $0<epsilon << 1$. The initial conditions are $u(0)=1$, $v(0)=0$.
	#parts[
		+ /* 1a */ Show that the only steady state is $(u, v)=(0,0)$ and that it is linearly stable.
			
		+ /* 1b */ On the $(u, v)$ phase plane, plot the nullclines and the phase trajectory from the initial condition, labelling the fast initial transient and the quasi-steady state portions of the trajectory.
	]
	
	
	
+ /* 2 */ An allosteric enzyme $E$ reacts with a substrate $S$ to produce a product $P$ according to the mechanism $ 
		S+E&stretch(harpoons.rtlb)_(k_(-1))^(k_1) C_1 stretch(harpoons.rtlb)^(k_2) E+P\ 
		S+C_1&stretch(harpoons.rtlb)_(k_(-3))^(k_3) C_2 strech(harpoons.rtlb)^(k_4) C_1+P
	 $ where the $k$s are (positive) rate constants and $C_1$ and $C_2$ are enzyme-substrate complexes. With lower case letters denoting concentrations, and intial conditions $s(0)=s_0, e(0)=$ $e_0, c_1(0)=c_2(0)=p(0)=0$ (with $s_0$ and $e_0$ both greater than 0).
	#parts[
		+ /* 2a */ Write down the differential equation model based on the Law of Mass Action.
			
		+ /* 2b */ If $epsilon=(e_0)/(s_0) << 1$, $tau=k_1 e_0 t$, $u=(s)/(s_0)$, $v_(i)=(c_(i))/(e_0)$, $i=1,2$, show that the non-dimensional model reduces to $ 
				(dif u)/(dif tau)=f (u, v_1, v_2 ), quad epsilon (dif v_(i))/(dif tau)=g_(i)(u, v_1 ; v_2 ), quad i=1,2
			 $ and determine $f, g_1$ and $g_2$.
			
		+ /* 2c */ Hence show that for $tau >> epsilon$ the uptake of $u$ is given by $ 
				(dif u)/(dif r)=-r(u)=-u (A+B U)/(C+u+D u^2),
			 $ where $A, B, C$ and $D$ are positive parameters which you should find. (You may simply quote the quasi-steady-state assumption.)
			
		+ /* 2d */ When $k_2=0$, sketch $r(u)$ as a function of $u$ and compare it with the Michaelis-Menten uptake.
	]
	
	
	
+ /* 3 */ A simple oscillator system takes the form: $ 
		epsilon (dif u)/(dif t) & =v-f(u) \ 
		(dif v)/(dif t) & =-u,
	 $ where $u(t)$ and $v(t)$ can take negative values, and $epsilon$ is a small parameter, $0<epsilon << 1$. Assume that $f(u)=(1)/(3) u^3-u$ (the well-known Van der Pol oscillator).
	#parts[
		+ /* 3a */ Draw the $(u, v)$ phase plane and illustrate the fast and slow portions of the limit cycle trajectory.
			
		+ /* 3b */ Draw the corresponding graphs of $u(t)$ and $v(t)$ as functions of time.
			
		+ /* 3c */ On the phase plane, show that one of the slow (quasi-steady state) portions goes from approximately $(2, (2)/(3))$ to $(1,-(2)/(3))$.
			
		+ /* 3d */ Exploiting the fact that along this portion, $v$ is approximately $(1)/(3) u^3-u$, use the differential equation for $v$ to show that the time taken to travel between the two points is approximately $T=(3)/(2)-ln 2$.
			
		+ /* 3e */ Hence deduce that the period of oscillation is approximately $3-2 ln 2$.
	]
	
	
	
+ /* 4 */ An animal population is prone to a fatal disease. There is a limited vaccine that creates immunity in the susceptible population but has no effect on infected animals. The higher the number of infected animals observed, the more vigorously vaccinations are administered. Let $I(t)$ denote the infected animal population, $S(t)$ the susceptible animal population, $V(t)$ the vaccinated animal population and $R(t)$ the dead animal population at time $t$. An ordinary differential equation description of these interactions can be written $ 
		(dif S)/(dif t) & =-beta S I-p S I \ 
		(dif I)/(dif t) & =beta S I-a I \ 
		(dif R)/(dif t) & =a I \ 
		(dif V)/(dif t) & =p I S
	 $ where $beta, p$ and $a$ are positive constants.
	#parts[
		+ /* 4a */ Explain the biological interpretation of each of the terms in the model.
			
		+ /* 4b */ Non-dimensionalise the model to give $ 
				(dif s)/(dif tau)&=-s i(1+eta), \ 
				(dif i)/(dif tau)&=i(s-1), \ 
				(dif r)/(dif tau)&=i, \ 
				(dif v)/(dif tau)&=eta i s,
			 $ where the non-dimensionalised populations are indicated using corresponding lowercase letters, $tau$ is non-dimensional time and the parameter $eta>0$ should be given.
			
		+ /* 4c */ Suppose that the initial conditions are $ 
				s(0)=s_0, quad i(0)=i_0, quad r(0)=0, quad v(0)=0,
			 $ where $s_0>0$ and $i_0>0$, and assume that $i -> 0$ as $t -> oo$.
			#subparts[
				+ /* 4ci */ Explain why the total number of animals that die from the disease is given (non-dimensionally) by $r(oo)$. By considering $dif i  slash  dif s$ and $dif v  slash  dif s$, determine this quantity, giving your answer in terms of $i_0, s_0, eta$ and $s(oo)$. [_Hint: it may help to find a conservation equation._]
					
				+ /* 4cii */ From the above, we have that $ 
						-(1+eta) i_0=ln s(oo)-ln s_0-s(oo)+s_0.
					 $ Hence, or otherwise, show that for $eta >> 1$ the number of susceptibles (nondimensionalised) left is approximately of order $e^(-eta i_0)$. Hence show that the number of animals that die from the disease (non-dimensionalised) is approximately $i_0+s_0  slash  eta$. What is the approximate number of deaths in dimensional terms?
					
				+ /* 4ciii */ Briefly discuss the biological insights this yields.
			]
	]
