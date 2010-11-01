size(24cm,0);
import flowchart;

real dx=3,y=0, dy=-1.5, dys=-1, dyss=-0.8;

block title=roundrectangle(pack(Label("Heat Equation Flowchart",blue) ,"","Malcolm Roberts, 2010-05-04"),(-dx,y));
draw(title);

block pde=roundrectangle(pack(Label("The Heat Equation",blue),"",
				    "$\frac{\partial u}{\partial t} = \beta\frac{\partial^2 u}{\partial x^2}$"),
			 (0,0));
draw(pde);
y += dyss;
block sepvar=roundrectangle(pack(Label("Separation of Variables",blue),"",
				 "$u(x,t)=\sum_\alpha T_\alpha(t) X_\alpha(x)$"
				 ),(0,y));
draw(sepvar);
y += dys;

block modes=roundrectangle(pack(Label("Modes",blue),"","","","","",
				"$T_\alpha(t) X_\alpha(x)=
\cases{
e^{\alpha\beta t}\left[C_1(\alpha)\cos(\sqrt{-\alpha}x) +  C_2(\alpha)\sin(\sqrt{-\alpha}x)\right],&$\alpha<0$\cr
C_1(0) + C_2(0)x, &$\alpha=0$\cr
e^{\alpha\beta t}\left[C_1(\alpha)\cosh(\sqrt{\alpha}x) +  C_2(\alpha)\sinh(\sqrt{\alpha}x)\right],&$\alpha>0$
}$"
				),(0,y));

draw(modes);
y+=dyss;

block bc=diamond(Label("Boundary Conditions?",blue),(0,y));


draw(bc);
y+=dyss;
block hdbc=roundrectangle(pack(Label("Homogeneous Dirichlet",blue)
			       ,"","$u(0,t)=0, \,u(L,t)=0$"
				),(-dx,y));
block ndbc=roundrectangle(pack(Label("Non-Homogeneous Dirichlet",blue)
			       ,"","$u(0,t)=u_0,\, u(L,t)=u_L$"
				),(0,y));
block hnbc=roundrectangle(pack(Label("Homogeneous Neumann",blue)
			       ,"",
 "$\left.\frac{\partial u(x,t)}{\partial x}\right|_{x=0} 
= \left.\frac{\partial u(x,t)}{\partial x}\right|_{x=L} = 0 $"
				),(dx,y));

draw(hdbc);
draw(ndbc);
draw(hnbc);

real by=y-0.7;
block block1=rectangle(Label(minipage("$
T_\alpha(t)X_\alpha(0)=0\\ T_\alpha(t)X_\alpha(L)=0
$")),(-2.3,by),invisible,invisible);
draw(block1);
block block2=rectangle(Label(minipage("$\alpha\neq 0: \\T_\alpha(t)X_\alpha(0)=0\\ T_\alpha(t)X_\alpha(L)=0$")),(-0.5,by),invisible,invisible);
draw(block2);
block block3=rectangle(Label(minipage("$\alpha = 0: \\T_0(t)X_0(0)=u_0\\ T_0(t)X_0(L)=u_L$")),(0.75,by),invisible,invisible);
draw(block3);
block block4=rectangle(Label(minipage("$
T_\alpha(t)X^{'}_\alpha(0)=0\\ T_\alpha(t)X^{'}_\alpha(L)=0
$")),(2.5,by),invisible,invisible);
draw(block4);

y+=dy;



block hdmodes=roundrectangle(pack(Label("$u(x,t)=$"),"","$\sum_{n=1}^\infty b_n e^{-\beta\frac{n^2\pi^2}{L^2}t}\sin\left(\frac{n \pi x}{L}\right)$"),(-dx,y));
block ndmodes=roundrectangle(pack(Label("$u(x,t)=$"),"","$u_0 + \frac{u_L-u_0}{L}x+\sum_{n=1}^\infty b_n e^{-\beta\frac{n^2\pi^2}{L^2}t}\sin\left(\frac{n \pi x}{L}\right)$"),(0,y));
block hnmodes=roundrectangle(pack(Label("$u(x,t)=$"),"","$\frac{a_0}{2}+\sum_{n=1}^\infty a_n e^{-\beta\frac{n^2\pi^2}{L^2}t}\cos\left(\frac{n \pi x}{L}\right)$"),(dx,y));

draw(hdmodes);
draw(ndmodes);
draw(hnmodes);
y+=dys;

block hdic=roundrectangle(pack(Label("$u(x,0)=f(x)$",blue),
			       "",
			       "$b_n=\frac{2}{L}\int_0^L f(x) \sin(nx) \,dx$"),
			  (-dx,y));
block ndic=roundrectangle(pack(Label("$u(x,0)=f(x)$",blue),
			       "",
			       "$b_n=\frac{2}{L}\int_0^L\left( f(x)-u_0 - \frac{u_L-u_0}{L}x\right) \sin(nx) \,dx$"),
			  (0,y));
block hnic=roundrectangle(pack(Label("$u(x,0)=f(x)$",blue),
			       "",
			       "$a_n=\frac{2}{L}\int_0^L f(x) \cos(nx) \,dx$"),
			  (dx,y));

draw(hdic);
draw(ndic);
draw(hnic);
y+=dyss;

block solution=roundrectangle(pack(Label("Solution",blue),"",
			     "$u(x,t)$"
			     ),(0,y));
draw(solution);





add(new void(picture pic, transform t) {
    blockconnector operator --=blockconnector(pic,t);
    

    pde--Arrow--sepvar;

    sepvar--Label(minipage("$\frac{X_\alpha^{''}}{X_\alpha}= \frac{T^{'}_\alpha}{\beta T_\alpha}=\alpha$"),align=E)--Arrow--modes;
    
    modes--Arrow--bc;

    bc--Arrow--hdbc--Arrow--
      //      Label(minipage("$T_\alpha(t)X_\alpha(0)=0\\ T_\alpha(t)X_\alpha(L)=0$"))--
      hdmodes--Arrow--hdic--Down--Right--Arrow--solution;
    bc--Arrow--ndbc--
      //      Label(minipage("$\alpha\neq 0: \\T_\alpha(t)X_\alpha(0)=u_0\\ T_\alpha(t)X_\alpha(L)=u_L$"),0.3,SE)--
      //      Label(minipage("$\alpha = 0: \\T_0(t)X_0(0)=u_0\\ T_0(t)X_0(L)=u_L$"))--
      //      Label(minipage("$a b \\ c d$"),0.1,S)--
      Arrow--ndmodes--Arrow--ndic--Arrow--solution;
    bc--Arrow--hnbc--Arrow--
      //      Label(minipage("$T_\alpha(t)X^{'}_\alpha(0)=0\\ T_\alpha(t)X^{'}_\alpha(L)=0$"))--
      hnmodes--Arrow--hnic--Down--Left--Arrow--solution;

  });
