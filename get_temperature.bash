#!/bin/bash
TEMP=$(w3m -dump http://www.yr.no/place/Sweden/Stockholm/Stockholm/forecast.xml | grep temperature | head -n 1 | sed -e 's/^.*value.*"\(.*\)".*$/\1/g')
echo ${TEMP}
