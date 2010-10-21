import graph;
size(150,IgnoreAspect);

real t=0;
real b=1;
real f(real x) {
  real val=0.0;
  val += 2*exp(-b*t)*sin(x);
  val += exp(-25*b*t)*sin(5*x);
  return val;
};


t=0;
draw(graph(f,0,pi),Pen(0),"$t=0$");
t=0.05;
draw(graph(f,0,pi),Pen(1)+dashed,"$t=0.05$");
t=0.1;
draw(graph(f,0,pi),Pen(2)+dashdotted,"$t=0.1$");
t=1;
draw(graph(f,0,pi),Pen(3)+longdashdotted,"$t=2$");


xaxis("$x$",BottomTop,LeftTicks);
yaxis("$y(x,t)$",LeftRight,RightTicks);
attach(legend(),point(E),20E);
