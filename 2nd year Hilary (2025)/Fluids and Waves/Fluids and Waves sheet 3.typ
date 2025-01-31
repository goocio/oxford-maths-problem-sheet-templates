#set text(size: 10pt, font: "New Computer Modern")
#set par(justify: true)
#set enum(numbering: n => [*(#n)*])
#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}
#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}
#let solution(body) = block(
	stroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body
)
#let mb(body) = math.upright(math.bold(body))

#align(center, text(1.75em)[Fluids and Waves -- Sheet 3\ Conformal maps, Vortices])
#align(center, text(1.4em)[YOUR NAME HERE :)])
#align(center, text(1.2em)[Hilary Term 2025])

// version uploaded 2024-09-27



	
	= $quad$ A: Fundamental Principles
	
+ /* 1 */ *Conformal maps.* Define the term _conformal map_. Write down conformal maps from the wedge $0<arg (z)<alpha$, from the strip $-a<y<a$ and from the semi-infinite strip $0<y<a, x>0$ onto the upper half-plane. Find all the points at which each map is not conformal.
	
	
	
+ /* 2 */ *Preservation under conformal mapping.* Show that the strength of a source or of a vortex is unaltered by a conformal transformation of the complex plane.
	
	
	
	= B: Applications
	
+ /* 3 */ Fluid occupies the region between two plane rigid boundaries at $y= plus.minus b$, and there is a line vortex of strength $Gamma$ at the origin $(x, y)=(0,0)$. Find the complex potential for the resulting flow by using
	#parts[
		+ /* 3a */ the method of images;
			
		+ /* 3b */ the conformal mapping $zeta=e^(alpha z)$ with suitably chosen $alpha>0$.
	]
	
	
	
+ /* 4 */ #parts[
		+ /* 4a */ Show that the circle $|zeta|=a$ is mapped to a line segment $ 
				S={z: op("Im") z=0,-2 a <= op("Re") z <= 2 a}
			 $ along the real- $z$-axis by the Joukowski transformation $ 
				z=zeta+(a^(2))/(zeta).
			 $
			
		+ /* 4b */ Deduce that the exterior of the line segment $S$ is mapped to the exterior of the circle $|zeta|=a$ by the transformation $ 
				zeta=(1)/(2)(z+sqrt(z^(2)-4 a^(2))) .wide (star)
			 $ Carefully define the function $sqrt(z^(2)-4 a^(2))$ and determine where the mapping $(star)$ is conformal.
	]
	
	
	
+ /* 5 */ #parts[
		+ /* 5a */ Show that the complex potential for a uniform stream of magnitude $U$ aligned at an angle $alpha$ to the real-$zeta$-axis with circulation $Gamma$ around a stationary circular cylinder of radius $a$ centred on the origin is given by $ 
				W(zeta)=U (zeta e^(-i alpha)+(a^(2) e^(i alpha))/(zeta))-(i Gamma)/(2 pi) log zeta
			 $
			
		+ /* 5b */ Hence find the complex potential $w(z)$ for flow past a flat plate at angle of incidence $alpha$ in a uniform stream of magnitude $U$ with circulation $Gamma$. Deduce that the velocity at the trailing edge of the plate is finite only if the circulation satisfies the _Kutta condition_ $ 
				Gamma+4 pi U a sin alpha=0.
			 $
			
		+ /* 5c */ Hence use the Kutta-Joukowski Lift Theorem to find the drag and lift forces experienced by the plate.
	]
	
	
	
+ /* 6 */ Two vortices, of strengths $Gamma_(1)$ and $Gamma_(2)$, are at the points $z=z_(1)$ and $z=z_(2)$ respectively in the complex plane.
	#parts[
		+ /* 6a */ Write down the equations of motion for the position vectors $z_(1)(t)$ and $z_(2)(t)$ if the vortices are free to move. Assuming that $Gamma_(1)+Gamma_(2) != 0$, show that $dif Z  slash  dif t=dif a  slash  dif t=0$, where $ 
				Z=(Gamma_(1) z_(1)+Gamma_(2) z_(2))/(Gamma_(1)+Gamma_(2))
			 $ is the centroid of the two vortices, and $a=|z_(1)-z_(2)|$ is the distance between them.
			
		+ /* 6b */ Deduce that each vortex moves in a circle centred on $Z$, with angular velocity $ 
				Omega=(Gamma_(1)+Gamma_(2))/(2 pi a^(2))
			 $ What happens in the exceptional case where $Gamma_(1)+Gamma_(2)=0$?
	]
	
	
	
+ /* 7 */ Fluid occupies the region $x^(2)+y^(2)>a^(2)$ outside a circular obstacle of radius $a$.
	#parts[
		+ /* 7a */ By using the Circle Theorem, find the resulting complex potential when a vortex of strength $Gamma$ is placed at $(x, y)=(b, 0)$, where $b>a$ (assuming there to be no circulation about the obstacle).
			
		+ /* 7b */ Explain why the vortex will move in a circle of radius $b$ with angular velocity of magnitude $ 
				Omega=(Gamma a^(2))/(2 pi b^(2)(b^(2)-a^(2))) .
			 $
	]
	
	
+ /* 8 */ Fluid occupies the quadrant $x>0, y>0$ bounded by two rigid boundaries along the $x$- and $y$-axes. Find the complex potential for the flow caused by a vortex at a point $z=c=a+i b$ in the fluid. If the vortex is free to move, show that it follows a path on which $ 
		(1)/(x^(2))+(1)/(y^(2))= "constant." 
	 $
	
	
	
+ /* 9 */ [_Harder_] Fluid occupies the semi-infinite channel ${z: op("Re") z>0,-a<op("Im") z<a}$.
	#parts[
		+ /* 9a */ Show that the flow induced by a line vortex of strength $Gamma>0$ at the point $z=d in bb(R)^(+)$ has complex potential $ 
				w(z)=(i Gamma)/(2 pi){-log [sinh ((pi z)/(2 a))-sinh ((pi d)/(2 a))]+log [sinh ((pi z)/(2 a))+sinh ((pi d)/(2 a))]}.
			 $
			
		+ /* 9b */ Show that the velocity components satisfy $ 
				u-i v=(i Gamma)/(4 a){op("cosech")((pi(z+d))/(2 a))-op("cosech")((pi(z-d))/(2 a))}
			 $
			
		+ /* 9c */ Deduce that, if the vortex is free to move, it will instantaneously travel downwards with speed $(Gamma)/(4 a)op("cosech")(pi d)/(a)$.
	]
