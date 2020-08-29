#!/usr/local/bin/bash
#set -xv

#declare -a persons=( [Walther]=White [John]=Titor [Mert]=Uzeken )
#echo ${persons[Walther]}

declare -A MYMAP=( [foo]=bar [baz]=quux [corge]=grault ) # Initialise all at once
echo ${MYMAP[foo]}
echo ${MYMAP[baz]}

