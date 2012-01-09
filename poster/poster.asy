import slide;
import graph;

defaultpen(black);
pagenumberpen=invisible;

real f(real x) {return (x != 0) ? x*sin(1/x) : 0;}
pair F(real x) {return (x,f(x));}


xaxis(background,grey);
yaxis(background,-0.25,0.25,grey);
real a=1.2/pi;
draw(background,graph(background,f,-a,a,10000),lightgrey);
label(background,"$x\sin\frac{1}{x}$",F(0.92/pi),3SE,grey+fontsize(14pt));
frame f=background.fit();
//box(f,RadialShade(yellow,0.6*yellow+red),above=false);
background.erase();
add(background,f);


title("Lab Notes for Math 201:",align=3S,fontsize(40pt));
center("Differential Equations for Engineers",fontsize(30pt));

skip(2);



center("A set of notes, examples, and problems.",fontsize(30pt));
center("Flow charts for solutions to common problems.",fontsize(22pt));

skip(2);
center("This is not a required text.",fontsize(20pt));
center("Developed by the Math and Stats Graduate Student Association for the
University of Alberta.",fontsize(20pt));
skip(1);

skip(1);

center("Available for \$5.00 as a Google eBook.",fontsize(24pt));
skip(1);
center("On sale for \$3.85!",fontsize(24pt));

figure("ebookQR","width=5cm");
center("\tt http://books.google.ca/ebooks?id=-e6FRsqIfEIC",black+fontsize(18pt));
