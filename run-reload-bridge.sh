#!/bin/sh

echo "Getting bridge container ID..."

ID=`docker ps -a | grep home | grep arm | awk '{print $1}'`

if [ "${ID}X" != "X" ]; then
    echo "Stopping $ID"
    docker stop ${ID}
else
    echo "No running bridge container found... OK"
fi

if [ "${ID}X" != "X" ]; then
    echo "Removing $ID"
    docker rm --force ${ID}
fi

echo "Looking for existing container image..."

ID=`docker images | grep pelion-bridge | awk '{print $3}'`
if [ "${ID}X" != "X" ]; then
    echo "Removing Image $ID"
    docker rmi --force ${ID}
else
    echo "No container image found... (OK)"
fi

echo "Building container image..."

sleep 5

if [ -f Dockerfile ]; then
    docker build -t "mbed/pelion-bridge" .
else
    echo "Unable to find Dockerfile... change to repo directory and retry..."
    exit 1
fi

if [ "$?" = "0" ]; then
    echo "Starting Pelion Bridge..."
    ./start-bridge.sh $*
    if [ "$?" = "0" ]; then
        echo "Pelion Bridge Started!"
        exit 0
    else
        echo "Pelion Bridge Start FAILED"
        exit 2
    fi
fi

