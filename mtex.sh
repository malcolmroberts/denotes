#!/bin/bash

# make two copies of the lab manual: a TA one and a student one.

# make TA version:
./sTA.sh
latexmk -pdf 201
mv 201.pdf ta201.pdf 

# make student version:
./sStu.sh
latexmk -pdf 201
