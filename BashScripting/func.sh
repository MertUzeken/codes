#!/usr/local/bin/bash

read nmbr
read -a nrlist <<< $nmbr
read op

operation(){
case "$3" in
	+)
		echo $(($1+$2));;
	-)
		echo $(($1-$2));;
	*)
		echo $(($1*$2));;
	/)
		echo $(($1/$2));;
esac
}

operation "${nrlist[0]}" "${nrlist[1]}" "${op}"
