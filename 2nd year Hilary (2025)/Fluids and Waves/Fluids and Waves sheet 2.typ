#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Fluids and Waves -- Sheet 2\ Complex potential, Blasius' theorem])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2025-01-10



	
+ /* 1 */ *An example of the velocity potential.* An impermeable sphere has a time-varying radius, $R(t)=a(1+cos Omega t)$, which induces a time-dependent irrotational, incompressible flow. The resulting velocity potential $phi.alt(r, t)$ satisfies Laplace's equation, $nabla^(2) phi.alt=0$, which in spherically-symmetric coordinates reads $ 
		0=(1)/(r^(2)) (partial)/(partial r)(r^(2) (partial phi.alt)/(partial r))
	 $
	#parts[
		+ /* 1a */ Explain why appropriate boundary conditions for $phi.alt(r, t)$, are $phi.alt_(r)(R, t)=dot(R)$ and $|nabla phi.alt| -> 0$ as $r -> oo$; solve for $phi.alt(r, t)$.
			
		+ /* 1b */ By using an appropriate form of Bernoulli's principle and neglecting any body force, calculate the pressure, $p[R(t), t]$, on the surface of the sphere (measured relative to the pressure at $oo$ ).
			
		+ /* 1c */ Show that the time average of the surface pressure, $overline(p-p_(oo))=(Omega)/(2 pi) integral_(0)^(2 pi  slash  Omega) (p[R(t), t]-p_(oo)) dif t$, is non-zero.
	]
	
	
	
+ /* 2 */ A line source of strength $Q$ is at $z=a$, and a line sink of the same strength is at $z=-a$, where $a in bb(R)^(+)$.
	#parts[
		+ /* 2a */ Write down the complex potential $w(z)$. Find $dif w  slash  dif z$, locate any stagnation points and sketch the streamlines.
			
		+ /* 2b */ Now let $a -> 0$ and $Q -> oo$ while keeping the product $a Q$ fixed. This gives the flow due to a doublet. Show that its complex potential is $mu  slash  z$, where $mu$ is to be found in terms of $a$ and $Q$. Show that the streamlines are circles through the origin with centres on the $y$-axis.
	]
	
	
	
+ /* 3 */ The velocity field $bold(u)=(Q  slash  2 pi r) bold(e)_(r)$, in terms of plane polar coordinates $(r, theta)$, corresponds to a line source if $Q>0$ or a line sink if $Q<0$.
	#parts[
		+ /* 3a */ Show that it is irrotational and incompressible for $r>0$. Find the velocity potential and streamfunction, and show that the complex potential is $ 
				w=(Q)/(2 pi) log z.
			 $ Explain why the streamfunction is a multi-valued function of position.
			
		+ /* 3b */ Fluid occupies the region $x>0$ and there is a plane rigid boundary at $x=0$. Find the complex potential for the flow due to a line source at the point $(d, 0)$, where $d>0$, and show that the pressure at $x=0$ decreases to a minimum at $|y|=d$ and thereafter increases with $y$.
	]
	
	
	
+ /* 4 */ Incompressible inviscid fluid occupies the region $y>0$, and there is an impermeable wall at $y=0$. There is a uniform flow, speed $U$, in the positive $x$-direction, and a line source of strength $Q$ at $(0, a)$, where $a>0$. Find the complex potential $w(z)$ and calculate $dif w  slash  dif z$. Let $beta=Q  slash  2 pi U a$. Show that if $beta>1$ there are two stagnation points, both on the wall, while if $beta<1$ there is only one, in the fluid, a distance $a$ from the origin. Try to sketch the streamlines in either case.
	
	
	
+ /* 5 */ *Blasius' Theorem.* Consider the steady, two-dimensional, irrotational flow of a fluid with constant density $rho$ past a closed body $B$.
	#parts[
		+ /* 5a */ If $p$ and $w$ are the pressure and complex potential of the flow, and $z=x+i y$, show that the force exerted on $B$ by the fluid is $(F_(x), F_(y))$, where $ 
				F_(x)+i F_(y)=integral.cont_(partial B) p i dif z=-(i rho)/(2) integral.cont_(partial B)abs((dif w)/(dif z))^(2) dif z
			 $ Explain why the integral on the right-hand side is not amenable to calculation via Cauchy's Theorem as it stands.
			
		+ /* 5b */ By taking the complex conjugate, or otherwise, deduce _Blasius' Theorem_: $ 
				F_(x)-i F_(y)=(i rho)/(2) integral.cont_(partial B)((dif w)/(dif z))^(2) dif z
			 $
			
		+ /* 5c */ Show that the moment (about the centre of $B$) exerted on $B$ by the fluid may similarly be written $ 
				M=Re [-(rho)/(2) integral.cont_(partial B) z ((dif w)/(dif z))^(2) dif z ] .
			 $
	]
	
	
	
+ /* 6 */ *Flow inside a cylinder: a modified Circle Theorem.* Modify the proof of Milne-Thomson's Circle Theorem to show that if $f(z)$ has all of its singularities lying in $|z|<a$ then the function $ 
		w(z)=f(z)+overline(f ((a^(2))/(overline(z))))
	 $ has:
	#parts[
		+ /* 6a */ the same singularities as $f$ within $|z|<a$;
			
		+ /* 6b */ the circle $|z|=a$ as a streamline.
	]
	
	
	
+ /* 7 */ Inviscid, incompressible fluid occupies the region $x^(2)+y^(2)>a^(2)$ outside a rigid circular cylinder of radius $a$. There is a line source of strength $Q$ at $(b, 0)$, where $b>a$, and there is also a circulatory flow around the cylinder as if due to a line vortex of strength $Gamma$ at the origin.
	#parts[
		+ /* 7a */ Explain why the complex potential is $ 
				w(z)=(Q)/(2 pi) log (z-b)+(Q)/(2 pi) log ((a^(2))/(z)-b )-(i Gamma)/(2 pi) log z .
			 $
			
		+ /* 7b */ Calculate $dif w  slash  dif z$ and use Blasius' Theorem to find the force components $(F_(x), F_(y))$ on the cylinder.\ 
			Adding the results, we have $ 
				F_x-i F_y=-rho (Q)/(2 pi)[-(Q a^(2))/(b(b^(2)-a^(2)))+(i Gamma)/(b)]
			 $ and hence $ 
				F_x=(rho Q^(2) a^(2))/(2 pi b(b^(2)-a^(2))),quad F_y=(rho Q Gamma)/(2 pi b).
			 $ Note that the horizontal component of the force is positive, independent of the sign of $Q$ -- the cylinder is pulled towards the source/sink. However, the sign of the vertical component of the force depends on the sign of the product $Q Gamma$: when there is positive circulation and a source, the fluid velocity is highest (and the pressure is lowest) above the cylinder so that the force acts to 'suck' the cylinder vertically upwards. When there is negative circulation (and a source), the highest velocity is at the bottom of the cylinder and the direction of the force reverses.
	]
	
	
	
+ /* 8 */ A two-dimensional irrotational incompressible flow has streamfunction $psi=A(x-c) y$, where $A$ and $c$ are real constants.
	#parts[
		+ /* 8a */ Write down (without further calculation), the corresponding complex potential. (_This is unique up to an additive constant. Why?_)
			
		+ /* 8b */ A circular cylinder of radius $a<abs(c)$ is introduced, its centre being at the origin. Find the force exerted on the cylinder by the resulting flow.
	]
