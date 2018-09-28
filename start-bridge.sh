#!/bin/sh

#
# Environment Selection
#
if [ "$(uname)" = "Darwin" ]; then
    if [ ! -h /usr/local/bin/docker-machine ]; then
        # MacOS (toolkit docker installed (OLD))... default is to pin IP address to 192.168.99.100
        IP="192.168.99.100"
        BASE_IP=${IP}
        echo "IP Address:" ${IP}
        IP=${IP}:
    else
        # MacOS (native docker installed) - use localhost..."
        IP="127.0.0.1"
        BASE_IP=${IP}
        echo "IP Address:" ${IP}
        IP=${IP}:
    fi
elif [ "$(uname)" = "MINGW64_NT-10.0" ]; then
    # Windows - Must use the Docker Toolkit with the latest VirtualBox installed... pinned to 192.168.99.100
    IP="192.168.99.100"
    BASE_IP=${IP}
    echo "IP Address:" ${IP}
    IP=${IP}:
elif [ "$(uname)" = "MINGW64_NT-6.1" ]; then
    # Windows - Must use the Docker Toolkit with the latest VirtualBox installed... pinned to 192.168.99.100
    IP="192.168.99.100"
    BASE_IP=${IP}
    echo "IP Address:" ${IP}
    IP=${IP}:
else
    # (assume) Linux - docker running as native host - get the actual IP address (assumes ifconfig installed)
    IP="`/sbin/ifconfig|grep inet|grep -v inet6|grep -v 127.0.0.1|grep -v Bcast:0.0.0.0|head -1|sed 's/\:/ /'|awk '{print $3}'`"
    BASE_IP=${IP}
    if [ "${OVERRIDE_IP}X" != "X" ]; then
        IP=${OVERRIDE_IP}
    fi
    echo "IP Address:" ${IP}
    IP=${IP}:
fi

set -x

docker run -d -p ${IP}17362:17362 -p ${IP}28520:28520 -p ${IP}2222:22 -p ${IP}8234:8234 -t mbed/pelion-bridge  /home/arm/start_instance.sh
