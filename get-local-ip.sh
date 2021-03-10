#!/bin/bash
# Author: Yevgeniy Goncharov aka xck, http://sys-admin.kz

DISTR=$(uname)

if [ "$DISTR" == "Linux" ]; then
    # hostname -i
    LOCAL_IPs=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
elif [ "$DISTR" == "Darwin" ]; then
    LOCAL_IPs=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
else
    echo "Your distribution is not supported"
    exit 1
fi

echo -e "${LOCAL_IPs}"

