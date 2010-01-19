/*
 * flow chart for second-order real-values linear homogeneous ODEs
 */

import flowchart;
defaultpen(fontsize(8pt));
size(13cm,0);

real dx = 2;
real dy = 1;

block ODE=roundrectangle(pack(Label("Differential equation"),"",
			      "$a_2 y^{''}+ a_1 y^{'} + a_0 y =0$"),
			 (0,dy));

block chareqn=roundrectangle(pack(Label("Characteristic equation"),"",
				  "$a_2 r^2 + a_1 r + a_0 =0$"),(0,0));

block realneq=roundrectangle(pack(Label("$r_1\neq r_2$, both real"),"",
				  "$y_1=e^{r_1t} ,y_2=e^{r_2 t}$"),(-dx,-dy));
block realeq=roundrectangle(pack(Label("$r_1=r_2$, real"),"",
				  "$y_1=e^{r_1t} ,y_2=te^{r_1 t}$"),(0,-dy));
block imag=roundrectangle(pack(Label("$r_{1,2}=\alpha \pm i \beta$"),"",
				  "$y_1=e^{\alpha t}\cos (\beta t) ,
                                    y_1=e^{\alpha t}\sin (\beta t)$"),
			  (dx, -dy));

block gsoln=roundrectangle(pack(Label("General solution"),"",
				"$y=C_1 y_1 + C_2 y_2$"),(0,-2dy));
			   
			   
block IC=roundrectangle("Match initial conditions",(0,-3dy));

draw(ODE);
draw(chareqn);

draw(realneq);
draw(realeq);
draw(imag);

draw(gsoln);

draw(IC);
add(new void(picture pic, transform t) {
    blockconnector operator --=blockconnector(pic,t);
    
    ODE--Label("$y=e^{rt}$",align=E)--Arrow--chareqn;
    chareqn--Arrow--realneq;
    chareqn--Arrow--realeq;
    chareqn--Arrow--imag;

    
    //realneq--unit(SE)--Right--Arrow--gsoln;
    // any way to get diagnol arrows using flowchart?
    realneq--Down--Right--Arrow--gsoln;
    realeq--Arrow--gsoln;
    imag--Down--Left--Arrow--gsoln;
    
    gsoln--Arrow--IC;
  });


