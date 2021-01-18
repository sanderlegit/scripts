#!/bin/bash
UPPER=$(echo $1 | tr [a-z] [A-Z])
SDIR=$(dirname $(realpath $0))/
echo $SDIR
FHPP=$1.hpp
FCPP=$1.cpp
sed "s/Template/$1/g" $SDIR/Template.hpp > $PWD/$FHPP
sed -i "s/TEMPLATE/$UPPER/g" $FHPP
cat $FHPP
sed "s/Template/$1/g" $SDIR/Template.cpp > $PWD/$FCPP
cat $FCPP
