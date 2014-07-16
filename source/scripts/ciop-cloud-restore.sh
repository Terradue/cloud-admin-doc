#!/bin/bash

mv /etc/fstab.bkp /etc/fstab

mv /var/log/context.log.sandbox /var/log/context

mv /tmp/oozie /var/log/

umount /mnt/application
rm -rf /application/*

app_disk=`blkid | grep CIOP_APP | cut -d: -f1`

mount $app_disk /application

mv /etc/rc.d/rc.local.bkp /etc/rc.d/rc.local

exit 0
