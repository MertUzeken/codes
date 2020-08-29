#!/usr/local/bin/bash

#set -xv

Animals=(DOG,MOUSE,BIRD)            #Written to index [0]
Animals+=("CAT")                    #Written to index [1]
Animals+=([2]="TIGER" [3]="BEAR")   #Written to index [2] and [3]
echo ${Animals[@]}		    # @ = give all out
