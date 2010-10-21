/*
 * flow chart for second-order real-values linear non-homogeneous ODEs
 */

import flowchart;
defaultpen(fontsize(8pt));
usepackage("amsmath");

size(13cm,0);

real dx = 2;
real dy = 1;
real y=0;

block ODE=roundrectangle(Label("$a_2 y^{''}+ a_1 y^{'} + a_0 y =f(t)$"),(0,y));

y-=dy;

block homeqn=roundrectangle(pack(Label("Solve homogeneous equation"),"",
				 "$a_2 y_h^{''}+ a_1 y_h^{'} + a_0 y_h =0$",
				 "",
				 "$\implies y_h=C_1 y_1 + C_2 y_2$"),
				 (0,y));

y-=dy;

block peqn=roundrectangle(pack(Label("Find particular soltion"),"",
			      "$a_2 y_p^{''}+ a_1 y_p^{'} + a_0 y_p =f(t)$"),

			  (0,y));
/*
y-=dy;

block undet=roundrectangle(pack(Label("Undetermined coefficients"),"",
			      "$a_2 y+p^{''}+ a_1 y_p^{'} + a_0 y_p =f(t)$"),
			 (-dx,y));


block vop=roundrectangle(pack(Label("Variation of Parameters"),"",
			      "$a_2 y+p^{''}+ a_1 y_p^{'} + a_0 y_p =f(t)$"),
			 (dx,y));

*/
y-=dy;


block undet1=roundrectangle(Label("Find $f(t)$ in table, get $y_p$"),
				 (-dx,y));


block vop1=roundrectangle(pack(Label("Calculate Wronskians"),"",
			       "$w=
\left|\begin{matrix} y_1 & y_2 \\\ y_1' & y_2' \end{matrix}\right|$"),
			 (dx,y));

y-=dy;

block undet2=roundrectangle(Label("Is $y_p \cap \rm{span}\{y_1,y_2\}=\emptyset$?"),(-dx,y));

block vop2=roundrectangle(Label("$y_p= y_1 \int \frac{-f y_2}{w } \, dt + y_2 \int \frac{f y_1}{w} \, dt$"),(dx,y));

y-=dy;

block undet3=roundrectangle(
	       pack(
		    Label("determine coefficients by putting $y_p$ into"),
		    "",
		    "$a_2 y_p^{''}+ a_1 y_p^{'} + a_0 y_p =f(t)$"),
		    (-dx,y));

y-=dy;


block IC=roundrectangle(
	       pack(
		    Label("apply initial conditions to"),
		    "",
		    "$y=C_1 y_1 + C_2 y_2 + y_p$"),
		    (0,y));


draw(ODE);
draw(homeqn);
draw(peqn);
//draw(undet);
//draw(vop);
draw(undet1);
draw(vop1);
draw(undet2);
draw(vop2);
draw(undet3);
draw(IC);

add(new void(picture pic, transform t) {
    blockconnector operator --=blockconnector(pic,t);
    
    ODE--Label("$y=y_h+y_p$",align=E)--Arrow--homeqn;
    homeqn--Arrow--peqn;
    peqn--Arrow--undet1;
    undet1--Arrow--undet2;
    // FIXME: add a yes and a no arrow, with the yes looping back
    // and saying "$y_p \rightarrow t y_p$
    undet2--Arrow--undet3;
    peqn--Arrow--vop1;
    vop1--Arrow--vop2;
    
    vop2--Arrow--IC;
    undet3--Arrow--IC;
    // FIXME: fix directions of arrows.
  });


