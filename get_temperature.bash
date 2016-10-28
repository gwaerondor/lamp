#!/bin/bash
LINE=1
CITY=Stockholm
if [ ! -z "$1" ];
then LINE=$1
fi

if [ ! -z "$2" ];
then CITY=$2
fi


CITY_URL=$(w3m -dump http://fil.nrk.no/yr/viktigestader/verda.txt | grep -i $'\t'"$CITY"$'\t' | sed -e 's/^.*varsel\.xml//g')
if [ -z "$CITY_URL" ];
then exit 1
fi

TEMP=$(w3m -dump $CITY_URL | grep temperature | head -n $LINE | tail -1 | sed -e 's/^.*value.*"\(.*\)".*$/\1/g')
echo ${TEMP}
