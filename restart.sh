#!/bin/sh

cd ${HOME}/service
./killService.sh
cp ${HOME}/service/logs/pelion-bridge.log ${HOME}/pelion-bridge-$(date +%F-%H:%M:%S).log
sleep 2
./runService.sh &
cd ${HOME}
