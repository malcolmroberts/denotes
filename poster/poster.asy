// poster for advertising eBook.
// compile with asy -f pdf -tex pdflatex poster


import slide;
import graph;



defaultpen(black);
pagenumberpen=invisible;

real f(real x) {return (x != 0) ? x*sin(1/x) : 0;}
pair F(real x) {return (x,f(x));}


xaxis(background,invisible);
yaxis(background,-0.25,0.25,invisible);
real a=1.2/pi;
draw(background,graph(background,f,-a,a,10000),lightgrey);
label(background,"$x\sin\frac{1}{x}$",F(0.92/pi),3SE,grey+fontsize(14pt));
frame f=background.fit();
//box(f,RadialShade(yellow,0.6*yellow+red),above=false);
background.erase();
add(background,f);


title("Lab Notes for Math 201:",align=3S,fontsize(40pt));
center("Differential Equations for Engineers",fontsize(30pt));
center("Written for the Math/Stats GSA",fontsize(15pt));
center("by",fontsize(15pt));
center("Malcolm Roberts and Samantha Marion",fontsize(15pt));
skip(2);



center("Notes, examples, and problems.",fontsize(30pt));
center("Flow charts for solutions to common problems.",fontsize(22pt));
center("Because flow chars are awesome!",fontsize(15pt));


skip(2);

skip(1);

center("Available for \$1.00 as a Google eBook.",fontsize(24pt));

figure("ebookQR","width=5cm");
center("\tt http://books.google.com/books?id=-e6FRsqIfEIC",black+fontsize(18pt));
skip(1);
center("This is not a required text, but it's just a buck and might help!  Preview it if you want, eh?",fontsize(20pt));

