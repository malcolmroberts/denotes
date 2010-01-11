size(14cm,0);
import flowchart;

real dx=2,dy=1;
block bernoulli=roundrectangle("Bernoulli DEs",(-dx,dy));
block linear=roundrectangle("Linear",(-dx,0));

block lincoeff=roundrectangle("Equations with \\Linear Coefficients",(0,dy));
block homo=roundrectangle("Homogeneous",(0,0));

block Gaxby=roundrectangle("$y'=G(ax+by)$",(dx,0));

block separable=roundrectangle("Separable",(0,-dy));

draw(bernoulli);
draw(linear);

draw(lincoeff);
draw(homo);

draw(Gaxby);

draw(separable);


add(new void(picture pic, transform t) {
    blockconnector operator --=blockconnector(pic,t);
    
    bernoulli--Label("$u$",align=E)--Arrow--linear;
    linear--Down--Right--Label("$u$",align=N)--Arrow--separable;

    lincoeff--Label("$u$",align=E)--Arrow--homo;
    homo--Label("$u$",align=E)--Arrow--separable;
    
    Gaxby--Down--Left--Label("$u$",align=N)--Arrow--separable;
    
  });
