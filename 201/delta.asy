/*
 * delta.asy - draw several approximations of the delta fcn
 */

import graph;
size(2inch, IgnoreAspect);

real k;
real f(real x) {
  return k / pi / (k^2+x^2);
};

k=0.400; draw(graph(f,-1,1), "$k=$" + string(k));
k=0.125; draw(graph(f,-1,1), "$k=$" + string(k));
k=0.005; draw(graph(f,-1,1), "$k=$" + string(k));

ylimits(0,7, Crop);
xaxis("", BottomTop, LeftTicks);
yaxis("", LeftRight, RightTicks);
