#!/bin/bash

# turn solutions on in 201.tex

sed 's/setcounter{showsolutions}{0}/setcounter{showsolutions}{1}/g' 201.tex > /tmp/201.tex
mv /tmp/201.tex .
