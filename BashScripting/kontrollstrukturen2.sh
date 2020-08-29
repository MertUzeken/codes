#!/usr/local/bin/bash
#set -xv

echo "Bitte geben sie ihre Rechnung in folgendem Format an: 50 + 60 und bestätigen sie mit Enter. "
echo "Beachten sie, das für die Trennung leerzeichen eingefügt werden muss"
while true; do
echo "Geben sie nun ihre Rechnung ein:"
read op
read -a someop <<< $op

#echo "${someop[0]}"
#echo "${someop[1]}"
#echo "${someop[2]}"

if ! [[ ${someop[0]##*[^0-9]*}||${someop[2]##*[^0-9]*} ]]
then
	echo "Fehlerhafte eingabe"
else
case "${someop[1]}" in
	+)
		echo $((${someop[0]}+${someop[2]}));;
	-)
		echo $((${someop[0]}-${someop[2]}));;
	*)
		echo $((${someop[0]}*${someop[2]}));;
	/)
		echo $((${someop[0]}/${someop[2]}));;
	x)
		echo $((${someop[0]}*${someop[2]}));;
	:)
		echo $((${someop[0]}/${someop[2]}));;
esac
fi
done
