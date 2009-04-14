import graph;
size(300,IgnoreAspect);

int N=10;
real f(real x) {
  real val=0.0;
  for(int n=1; n <= N; ++n) {
    real bn=(2*(-1)^(n+1))/n;
    val += bn*sin(n*x);
  }
  return val;
};
real X(real x) {
  return x;
}

draw(graph(X,-pi,pi),"$x$");
N=2;
draw(graph(f,-pi,pi),Pen(0)+Dotted,"2 terms");
N=10;
draw(graph(f,-pi,pi),Pen(1)+dashed,"10 terms");
N=100;
draw(graph(f,-pi,pi),Pen(2)+dashdotted,"100 terms");
N=1000;
draw(graph(f,-pi,pi),Pen(3)+longdashdotted,"1000 terms");


xaxis("$x$",BottomTop,LeftTicks);
yaxis("$f(x)$",LeftRight,RightTicks);
attach(legend(),point(E),20E);
