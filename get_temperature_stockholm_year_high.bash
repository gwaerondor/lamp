#!/bin/bash

high_temps=(-1 -1 3 9 16 21 22 20 15 10 4 1)
if (( $1 < 12 )); then
	echo ${high_temps[$1]}
fi
