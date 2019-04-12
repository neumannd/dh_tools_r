#!/bin/bash

# provide help
if [ $# -gt 0 ]; then
  if [ "$1" = "-h" ]; then
    echo "~~~~ HELP ~~~~"
    echo "$0 [-h] [tar]"
    echo ""
    echo "~~~ command line arguments ~~~"
    echo " -h : print this help"
    echo " tar: create a .tar.gz file of this package"
    echo ""
    echo "~~~ what this script does ~~~"
    echo " * generate *.Rd files from *.R source files by roxygen2"
    echo " * generate *.html files from *.Rd files by Rd2HTML function"
    echo " * grep the version number from DESCRIPTION (needed for .tar.gz)"
    echo " * optional: create a .tar.gz file in the top directory (if 'tar' is provided)"
    echo ""
    exit 0
  fi
fi

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

# get version
version=`grep Version: DESCRIPTION | sed 's/Version: //g'`

# create tar.gz
if [ $# -gt 0 ]; then
  if [ "$1" = "tar" ]; then
    echo "~~~ creating tar.gz file ~~~"
    dCurr=`basename \`pwd\``
    cd ..
    tar zcf dhtools_v${version}.tar.gz ${dCurr}
    echo ""
  fi
fi
