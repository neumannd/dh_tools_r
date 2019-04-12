#!/bin/bash

# generate package files
echo "~~~ generate package files with roxygen2 ~~~"
Rscript -e "roxygen2::roxygenise()"
echo ""

# generate HTMLs
for iR in `ls man/*.Rd`; do
  jR=`basename -s .Rd ${iR}`
  echo "~~~ converting Rd to HTML: ${jR} ~~~"
  Rscript -e "tools::Rd2HTML('man/${jR}.Rd', 'html/${jR}.html')"
  echo ""
done
echo ""