#!/bin/bash


let "TEMP = $1 + 10"
if (( $TEMP > 40 )); then
	let "TEMP = 40"
fi
if (( $TEMP < 0 )); then
        let "TEMP = 0"
fi

let "RED = $TEMP * 5"
let "BLUE = 255 - $RED"
if (( $RED > $BLUE )); then
	let "GREEN = $BLUE"
else
	let "GREEN = $RED"
fi

printf -v HEX_BLUE "%02x" "$BLUE"
printf -v HEX_RED "%02x" "$RED"
printf -v HEX_GREEN "%02x" "$GREEN"

#echo "tmp" $TEMP
echo ${HEX_RED} ${HEX_GREEN} ${HEX_BLUE}
