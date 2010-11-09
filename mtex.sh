#!/bin/bash

# make two copies of the lab manual: a TA one and a student one.

sed 's/setcounter{showsolutions}{0}/setcounter{showsolutions}{1}/g' 201.tex > /tmp/201.tex
mv /tmp/201.tex .
pdflatex 201.tex
pdflatex 201.tex
cp 201.pdf ta201.pdf

sed 's/setcounter{showsolutions}{1}/setcounter{showsolutions}{0}/g' 201.tex > /tmp/201.tex
mv /tmp/201.tex .
pdflatex 201.tex
pdflatex 201.tex
cp 201.pdf ta201.pdf
