/*
 * step.asy - draw the Heaviside step function
 */

import graph;
size(2inch, 1.5inch);

real c = 3.0/8.0;
real zero(real x) {return 0.0;}
real one(real x) {return 1.0;}

draw(graph(zero,-2,c));
draw(graph(one,c,2));

ylimits(-0.5,1.5);

labely("$1$", (0,1), W);
labelx("$c$", (c,0), S);

axes("$t$", "$y$", dashed);
