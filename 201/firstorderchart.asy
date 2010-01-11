size(18cm,0);
import flowchart;

real dx=2,dy=1;

block bernoulli=roundrectangle(pack(Label("Bernoulli DEs"),"","$\frac{dy}{dx} + Py = Qy^n$"),(-dx,dy));
block linear=roundrectangle(pack(Label("Linear DEs"),"","$\frac{dy}{dx} + Py = Q$"),(-dx,0));

block lincoeff=roundrectangle(pack(Label("DEs with Linear Coefficients"),"",
				   "$(a_1 x +b_1 y + c_1 )dx + (a_2 x + b_2 y + c_2 ) dy =0$"),(0,dy));
block homo=roundrectangle(pack(Label("Homogeneous"),"","$\frac{dy}{dx} = f\left(\frac{y}{x} \right)$"),(0,0));

block Gaxby=roundrectangle("$y'=G(ax+by)$",(dx,0));

block separable=roundrectangle(pack(Label("Separable DEs"),"","$h(y)\frac{dy}{dx} = g(x)$"),(0,-dy));

draw(bernoulli);
draw(linear);

draw(lincoeff);
draw(homo);

draw(Gaxby);

draw(separable);


add(new void(picture pic, transform t) {
    blockconnector operator --=blockconnector(pic,t);
    
    bernoulli--Label("$z=y^{1-n}$",align=E)--Arrow--linear;
    linear--Down--Right--Label("$\mu = \exp \left(\int P(x) \,dx\right)$",align=S)--Arrow--separable;

    lincoeff--Label(minipage("$x=u+h, y=v+k$,\\
                              $a_1 h + b_1 k + c_1 =0$\\ $a_2 h + b_2 k + c_2 =0 $"),align=E)--Arrow--homo;
    homo--Label("$z=\frac{y}{x}$",align=E)--Arrow--separable;
    
    Gaxby--Down--Left--Label("$z=ax+by$",align=N)--Arrow--separable;
    
  });
