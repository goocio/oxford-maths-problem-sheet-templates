#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Fluids and Waves -- Sheet 4\ Free surfaces, Perturbations])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2024-09-27



	
+ /* 1 */ *The kinematic boundary condition.* The free surface of a fluid moving in two dimensions is given parametrically by $bold(r)(x, t)=(x, eta(x, t))$.
	#parts[
		+ /* 1a */ Show that a unit normal to the surface is $ 
				bold(n)=(1)/(sqrt(1+eta_(x)^(2)))(-eta_(x), 1)
			 $ and deduce that the velocity of the surface normal to itself is given by $ 
				(partial bold(r))/(partial t) dot.c bold(n)=(eta_(t))/(sqrt(1+eta_(x)^(2)))
			 $
			
		+ /* 1b */ Hence show that the kinematic condition that _the velocity of the fluid normal to the surface equals the velocity of the surface normal to itself_ leads to the boundary condition $ 
				v=(partial eta)/(partial t)+u (partial eta)/(partial x) quad  "on"  y=eta.
			 $ Deduce that _fluid particles on the free surface stay on the free surface_.
	]
	
	
	
+ /* 2 */ *Particle paths.* Consider small two-dimensional water waves on the free surface of an incompressible irrotational fluid with a velocity potential $phi.alt(x, y, t)$, which satisfies Laplace's equation. Suppose that the free surface has equation $y=eta(x, t)$, the water has depth $h$, and the bottom is at $y=-h$.
	#parts[
		+ /* 2a */ Show that we can choose $phi.alt$ such that the boundary conditions $ 
				(partial phi.alt)/(partial y)=(partial eta)/(partial t)+(partial phi.alt)/(partial x) (partial eta)/(partial x), wide
				(partial phi.alt)/(partial t)+(1)/(2)|bold(nabla) phi.alt|^(2)+g eta=0
			 $ are satisfied on the free surface $y=eta$.
			
		+ /* 2b */ Show that, when the problem is linearized by neglecting quadratic terms, these boundary conditions are simplified to $ 
				(partial phi.alt)/(partial y)=(partial eta)/(partial t), quad (partial phi.alt)/(partial t)+g eta=0 quad  "on"  y=0.
			 $
			
		+ /* 2c */ Show that travelling harmonic waves, with $eta=A cos (k x-omega t)$ and $phi.alt=f(y) sin (k x-omega t)$, are possible provided $omega^(2)=g k tanh (k h)$.
			
		+ /* 2d */ Assume that a given material element of fluid performs only small excursions from its mean position $(overline(x), overline(y))$, i.e. its position at time $t$ is $[overline(x)+x'(t), overline(y)+y'(t)]$ with $-h<overline(y)<0$ and $()'$ denoting a small quantity, not time derivatives, so that $x'  slash  overline(x), y'  slash  overline(y) << 1$. By linearizing the ordinary differential equations for the particle paths, show that these paths are elliptical and roughly sketch the particle paths for a variety of $overline(y)  slash  h$.
	]
	
	
	
+ /* 3 */ *Gravity waves.* Inviscid incompressible fluid of density $rho_(2)$ occupies the region $y>0$ and lies vertically above a similar fluid of greater density $rho_(1)$ in $y<0$. Small amplitude waves perturb the interface between the fluids so that its equation becomes $y=eta(x, t)$. Assuming $eta$ and the fluid velocities to be small, derive three boundary conditions relating $eta$ and the velocity potentials $phi.alt_(1), phi.alt_(2)$ of the two fluids at $y=0$. If $eta(x, t)=A cos (k x-omega t)$, with $k>0$, show that $ 
		omega^(2)=((rho_(1)-rho_(2))/(rho_(1)+rho_(2))) g k.
	 $
	
	
	
+ /* 4 */ *Rayleigh-Taylor instability with surface tension.* Suppose now that there is a surface tension $T$ between the two fluids of question 3 and that $rho_(1)<rho_(2)$.
	#parts[
		+ /* 4a */ Derive the linearised boundary conditions to be satisfied at $y=0$. Show that the frequency $omega$ is now related to the wavenumber $k$ by the equation $ 
				(rho_(1)+rho_(2)) omega^(2)=k [T k^(2)-(rho_(2)-rho_(1)) g ] .
			 $
			
		+ /* 4b */ Deduce that the waves are unstable if their wavelength $lambda$ exceeds a critical value $ 
				lambda_(upright(c))=2 pi sqrt((T)/((rho_(2)-rho_(1)) g)) .
			 $
	]
	
	
	
+ /* 5 */ *Flow over a river bed.* Water flows steadily with speed $U$ over a corrugated bed $y=-h+epsilon cos (k x)$, where $epsilon << h$, so that there is a time-independent disturbance $eta(x)$ to the free surface, which would be at $y=0$ but for the corrugations.
	#parts[
		+ /* 5a */ By writing the velocity components as $ 
				u=U+(partial phi.alt)/(partial x), wide v=(partial phi.alt)/(partial y)
			 $ where $phi.alt(x, y)$ denotes the velocity potential of the disturbance to the uniform flow, show that the linearized boundary conditions are $ 
				(partial phi.alt)/(partial y)&=U (dif eta)/(dif x), & U (partial phi.alt)/(partial x)+g eta&=0 &  "on"  y&=0 \ 
				(partial phi.alt)/(partial y)&=-U k epsilon sin (k x) &&&  "on"  y&=-h
			 $ and hence find $eta(x)$.
			
		+ /* 5b */ Deduce that crests on the free surface occur immediately above troughs on the bed if $ 
				U^(2)<(g)/(k) tanh (k h)
			 $ but that crests on the surface overlie the crests on the bed if this inequality is reversed.
	]
	
	
	
+ /* 6 */ *Sound waves.* Recall the full Euler equations derived at the beginning of the course, e.g. conservation of mass in the form $ 
		(upright(D) rho)/(upright(D) t)+rho nabla dot.c mb(u)=0
	 $ (which applies also to compressible flows). Consider a barotropic fluid in which the pressure $p$ is a function only of the density, i.e. $p=P(rho)$.#panic("typstify missed this macro:")\space By linearizing both Euler equations around the state at rest $(mb(u)=0)$ with uniform density, $rho(mb(x), t)=rho_(0)$, show that perturbations to the density $rho'(mb(x), t)$ satisfy the wave equation: $ 
		(partial^(2) rho')/(partial t^(2))=c^(2) nabla^(2) rho'
	 $ where $ 
		c^(2)=.(dif P)/(dif rho)|_(rho=rho_(0))
	 $ [_Perturbations to the uniform density state therefore propagate at the speed $c$ - these are sound waves and are studied in more detail in the Part B course "Waves and Compressible Flow"._]
