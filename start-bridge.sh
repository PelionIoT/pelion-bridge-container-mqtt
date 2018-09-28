#!/bin/sh

IP="0.0.0.0:"

set -x

docker run -d -p ${IP}17362:17362 -p ${IP}28520:28520 -p ${IP}2222:22 -p ${IP}8234:8234 -t mbed/pelion-bridge  /home/arm/start_instance.sh
