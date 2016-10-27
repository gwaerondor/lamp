#!/bin/bash

TEMPERATURE=$(bash get_temperature.bash)
echo "Current temperature is ${TEMPERATURE} degrees centigrade"
RGB=$(bash get_rgb.bash ${TEMPERATURE})
bash connect_and_send_bytes.bash ${RGB}
