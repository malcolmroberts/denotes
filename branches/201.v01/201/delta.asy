import graph;
size(150,IgnoreAspect);

real k=10;
real sqrtpi=sqrt(pi);
real f(real x) {
  real val=k/(pi*(k^2+x^2));
  return val;
};


k=0.4;
draw(graph(f,-1,1),Pen(0),"$k=$"+(string)k);
//k=0.1;
//draw(graph(f,-1,1),Pen(0),"$k=$"+(string)k);
k=0.125;
draw(graph(f,-1,1),Pen(0),"$k=$"+(string)k);
k=0.005;
draw(graph(f,-1,1),Pen(0),"$k=$"+(string)k);

//axes("$\delta$","$x$",Ticks);

ylimits(0,7,Crop);


xaxis("",BottomTop,LeftTicks);
yaxis("",LeftRight,RightTicks);
//attach(legend(),point(E),20E);
