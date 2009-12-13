import graph;
size(150,IgnoreAspect);

real t=0;
real b=1;
real ind(int n) {
  real val=0.0;
  val += 4*((-1)^n-1)/(n^3*pi);
  return val;
}
int N=1000;
real f(real x) {
  real val=0.0;
  val += 1+x*(exp(pi)-1)/pi;
  for(int n=1; n < N; ++n) {
    val += ind(n)*exp(-b*t)*sin(n*x);
  }
  return val;
};


t=0;
draw(graph(f,0,pi),Pen(0),"$t=$"+(string)t);
t=0.1;
draw(graph(f,0,pi),Pen(1)+dashed,"$t=$"+(string)t);
t=1;
draw(graph(f,0,pi),Pen(2)+dashdotted,"$t=$"+(string)t);
//t=10;
//draw(graph(f,0,pi),Pen(3)+longdashdotted,"$t=$"+(string)t);
N=0;
draw(graph(f,0,pi),Dotted,"$t=\infty$");


xaxis("$x$",BottomTop,LeftTicks);
yaxis("$y(x,t)$",LeftRight,RightTicks);
attach(legend(),point(E),20E);
