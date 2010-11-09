#!/bin/bash

# turn solutions off in 201.tex

sed 's/setcounter{showsolutions}{1}/setcounter{showsolutions}{0}/g' 201.tex > /tmp/201.tex
mv /tmp/201.tex .
