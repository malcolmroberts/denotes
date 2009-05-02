import graph;
size(150,100);

real c=3/8;
real f(real x) {
  real val=0.0;
  if (x>c) val=1.0;
  return val;
};
bool3 branch(real x)
{
  if(x == c) return false;
  return default;
}
real zero(real x) {return 0;}
real one(real x) {return 1;}


ylimits(-0.5,1.5);


draw(graph(zero,-2,c));
draw(graph(one,c,2));

//draw(graph(f,-2,2,branch));

//ytick("$1$",(0,1),E);
labely("$1$",(0,1),W);
//xtick("$c$",(c,0),N);
labelx("$c$",(c,0),S);

axes("$t$","$y$",dashed);
attach(legend(),point(E),20E);

