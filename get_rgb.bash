#!/bin/bash


let "TEMP = $1 + 20"
if (( $TEMP > 50 )); then
	let "TEMP = 50"
fi
if (( $TEMP < 0 )); then
        let "TEMP = 0"
fi

let "BLUE = 255 - ( $TEMP % 10 ) * 25"
let "RED = ( $TEMP / 10 ) * 50"
printf -v HEX_BLUE "%02x" "$BLUE"
printf -v HEX_RED "%02x" "$RED"

#echo "tmp" $TEMP
echo $HEX_RED "00" $HEX_BLUE
