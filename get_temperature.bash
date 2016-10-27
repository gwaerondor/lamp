#!/bin/bash
LINE=1
if [ ! -z "$1" ];
then LINE=$1
fi
TEMP=$(w3m -dump http://www.yr.no/place/Sweden/Stockholm/Stockholm/forecast.xml | grep temperature | head -n $LINE | tail -1 | sed -e 's/^.*value.*"\(.*\)".*$/\1/g')
echo ${TEMP}
