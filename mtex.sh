#!/bin/bash

# make two copies of the lab manual: a TA one and a student one.

# make TA version:
./sTA.sh
pdflatex 201.tex
pdflatex 201.tex
mv 201.pdf ta201.pdf 

# make student version:
./sStu.sh
pdflatex 201.tex
pdflatex 201.tex
