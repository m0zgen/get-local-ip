#!/bin/bash
# Author: Yevgeniy Goncharov aka xck, http://sys-admin.kz

# hostname -i
LOCAL_IP=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')

echo -e "\nYour IP: ${LOCAL_IP}\n"

# Example ping IP
/usr/bin/ping -c 2 $LOCAL_IP

echo -e "\nPing done!"

# Example curl
#curl -I http://$LOCAL_IP/phpinfo

echo -e "\nScript Done!\n"
