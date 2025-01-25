#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Fluids and Waves -- Sheet 1\ Streamlines, Vorticity])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2024-09-27



	
	= A: Fundamental Principles
	
+ /* 1 */ *Particle paths and streamlines.* Define the _particle paths_ and _streamlines_ for a velocity field $bold(u)(bold(x), t)$. When do these coincide? Show that a quantity $f(bold(x), t)$ is preserved following the flow if $ 
		(upright(D) f)/(upright(D) t)=(partial f)/(partial t)+bold(u) dot.c bold(nabla) f=0
	 $ Show also that $f$ is constant along streamlines if $bold(u) dot.c bold(nabla) f=0$.
	
	
	
+ /* 2 */ *The vorticity equation.* Consider an incompressible fluid, with constant density $rho$, subject to a conservative body force (i.e. $bold(g)=-bold(nabla) chi$ for some potential function $chi$). Starting from the Euler equations, show that the _vorticity_ $bold(omega)=bold(nabla) times bold(u)$ satisfies $ 
		(upright(D) bold(omega))/(upright(D) t)=(bold(omega) dot.c bold(nabla)) bold(u).
	 $ Deduce that, in two-dimensional incompressible flow, $bold(omega)$ is conserved following the flow.
	
	
	
+ /* 3 */ *Kelvin's Circulation Theorem: A second proof.* The _circulation_ $Gamma$ around a closed curve $C(t)$ is defined by $ 
		Gamma=integral.cont_(C) bold(u) dot.c dif bold(x) .
	 $ By transforming to Lagrangian variables show that $Gamma$ is independent of $t$. Deduce that a flow that is initially _irrotational_ (i.e. $bold(omega)=mb(0)$ at $t=0$) remains irrotational for all time. [_This is a key result for the rest of the course: if a flow is initially irrotational, it remains so indefinitely and we can introduce a velocity potential $phi.alt$ such that $mb(u)=bold(nabla) phi.alt$._]
	
	
	
+ /* 4 */ *Bernoulli's principle(s).* Consider an incompressible fluid, with constant density $rho$, subject to a conservative body force with potential $chi$.
	#parts[
		+ /* 4a */ #subparts[
				+ /* 4ai */ Show that the momentum equation may be written in the form $ 
						(partial bold(u))/(partial t)+(bold(nabla) times bold(u)) times bold(u)=bold(nabla) f
					 $ for some function $f$ (which you should define).
				+ /* 4aii */ Deduce that $p+rho chi+(1)/(2) rho|bold(u)|^(2)$ is constant along a streamline in steady flow;
					
				+ /* 4aiii */ and that $p+rho chi+(1)/(2) rho|bold(u)|^(2)$ is constant everywhere in steady irrotational flow.
			]
			
		+ /* 4b */ Assuming the flow is irrotational, define a velocity potential $phi.alt$ such that $bold(u)=bold(nabla) phi.alt$. Deduce _Bernoulli's equation_, namely $ 
				(partial phi.alt)/(partial t)+(1)/(2)|bold(nabla) phi.alt|^(2)+(p)/(rho)+chi=F(t)
			 $ Explain carefully how an appropriate definition of $phi.alt$ allows the function $F(t)$ to be chosen arbitrarily.
	]
	
	
	
+ /* 5 */ *The streamfunction.*
	#parts[
		+ /* 5a */ For two-dimensional incompressible flow, with velocity $bold(u)=$ $(u(x, y, t), v(x, y, t), 0)$, show that there exists a _streamfunction_ $psi(x, y, t)$ such that $u=partial psi  slash  partial y$ and $v=-partial psi  slash  partial x$.
			
		+ /* 5b */ Show that $psi$ is constant along streamlines and that the difference between the values of $psi$ on any two streamlines is equal to the net flux of fluid between them.
			
		+ /* 5c */ Explain why an impermeable boundary to a fluid flow is always a streamline.
	]
	
	
	= B: Applications
	
+ /* 6 */ *Vorticity versus rotation.* A fluid moves in the region $r >= a$ outside a circular cylinder, with velocity field given by $ 
		bold(u)=((-Omega y)/(x^(2)+y^(2)), (Omega x)/(x^(2)+y^(2)), 0 ),
	 $ where $Omega$ is constant.
	#parts[
		+ /* 6a */ Show that the flow is irrotational. Deduce that $ 
				Gamma=integral.cont_(C) bold(u) dot.c dif bold(x)=0,
			 $ where $C$ is any simple closed curve that does not enclose the cylinder.
			
		+ /* 6b */ Show that all the streamlines of the flow are circular, and calculate $Gamma$ when $C$ is a streamline. Deduce that $Gamma=2 pi Omega$ whenever $C$ _does_ enclose the cylinder.
	]
	
	
	
+ /* 7 */ *Newton's bucket.* An incompressible inviscid fluid is rotating under gravity $g$ with constant angular velocity $Omega$ about the $z$-axis, which is vertical, so that $bold(u)=(-Omega y, Omega x, 0)$ relative to fixed Cartesian axes. We wish to find the surfaces of constant pressure, and hence surface of a uniformly rotating bucket of water (which will be at atmospheric pressure).
	#parts[
		+ /* 7a */ Bernoulli's equation would imply that $p  slash  rho+|bold(u)|^(2)  slash  2+g z$ is constant, so the constant pressure surfaces are $ 
				z= "constant" -(Omega^(2))/(2 g)(x^(2)+y^(2)) .
			 $ But this suggests that the surface of a rotating bucket of water is at its highest in the middle. What is wrong?
			
		+ /* 7b */ Write down the Euler equations in component form for this velocity field and integrate them to find the pressure $p$. Explaining carefully your reasoning, use this to obtain the correct shape for the free surface. [_A thought experiment with a rotating bucket of water was used by Newton to argue that rotational motion is absolute, not relative - all observers would see the surface of the liquid is curved. Nowadays, the same idea, but with mercury as the liquid, is used to create liquid-mirror telescopes._]
	]
	
	
	
+ /* 8 */ *Using streamlines: The clepsydra.* One of the earliest means for measuring the passage of time, invented by the ancient Egyptians, was the _clepsydra_ (or 'water thief'): a large jar with a hole in its base is filled with water. The shape of the jar was such that the interval of time taken for the water surface to pass two equally-spaced markers on the side of the jar is constant. In this question you will determine the shape of jar required to achieve this. In particular, we denote the (axisymmetric) jar's radius a height $z$ above the hole by $a(z)$. The radius of the hole, $a_(h) != a(0)$, in general.
	#parts[
		+ /* 8a */ Explain why the curve $r=a(z)$ is a streamline.
			
		+ /* 8b */ If the surface of the water lies at $z=h(t)$, use an appropriate form of Bernoulli's principle to calculate the speed of liquid, $u$, leaving the jar at $z=0$. [_You may assume that the desired surface speed $u_(S)=|dot(h)| << u$._]
			
		+ /* 8c */ Use the principle of conservation of mass to link $u_(S), u, a_(h)$ and $a[h(t)]$; thereby determine the correct shape for a clepsydra.
	]
	
	
	
+ /* 9 */ [_Optional, but easy_] *Wind and pressure on weather maps.* At the scale of earth's atmosphere, the Coriolis effect becomes important; conservation of momentum in the Euler equations then becomes: $ 
		(upright(D u))/(upright(D) t)=-2 bold(Omega) and mb(u)-(1)/(rho) nabla p+mb(g)
	 $ where $Omega$ is the angular velocity of the earth's surface.\ '_Geostrophic balance_' is used to describe the conditions under which the material derivatives in this equation may be neglected. We will work in a local Cartesian coordinate system, $(x, y, z)$, the velocity field $mb(u)=(u, v, w)$, and we can write $bold(Omega)=omega sin phi.alt mb(e)_(z)$ where $phi.alt$ is the latitude --- this is the 'tangent plane'.
	#parts[
		+ /* 9a */ Show that in geostrophic balance $ 
				0=2 omega sin phi.alt v-(1)/(rho) (partial p)/(partial x), wide 0=-2 omega sin phi.alt u-(1)/(rho) (partial p)/(partial y) .
			 $
			
		+ /* 9b */ Show that this 'geostrophic wind' is incompressible. What plays the same role as the streamfunction here?
			
		+ /* 9c */ Explain why the wind direction is parallel to isobars (curves of constant pressure) on weather maps. [_To see this in practice, use the BBC weather website and choose a location, like Oxford. (You can make the map fullscreen and then change the options to show wind and pressure.) You could also compare the relation between pressure and wind direction for an equatorial city like Kinshasa or Bogotá._]
	]
