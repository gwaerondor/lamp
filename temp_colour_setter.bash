#!/bin/bash

TEMP=$(./get_temperature.bash)
RGB=$(./get_rgb.bash ${TEMP})
./connect_and_send_bytes.bash ${RGB}
