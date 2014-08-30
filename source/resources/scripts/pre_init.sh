#!/bin/sh

function check_context {

    # This function check if the contextualization files 
    # are available on server

    # HTTP NOT FOUND error code
    res=404
    # Number of seconds between tries
    seconds=1

    while [ $res -ne 200 ]
    do
        res=`curl -s -I $1 | grep HTTP/1.1 | awk {'print $2'}`
        if [ $res -ne 200 ]; then
            echo "[ERROR] Error $res on $1"
            sleep $seconds
        fi
    done
}

CONTEXT_PROVIDER=cloud.terradue.com
CLOUD_DRIVER_PREFIX=jclouds-labs_

internal_ip=`/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
tmp=${internal_ip//./-}
context_id=$CLOUD_DRIVER_PREFIX$tmp
url=http://$CONTEXT_PROVIDER/context/$context_id/context.tgz

check_context $url

cd /tmp
rm -Rf context*
curl -s -O $url
tar xvzf /tmp/context.tgz

cp /tmp/context/* /mnt/context/

sh -x /mnt/context/init.sh

exit 0
