#!/bin/bash

# remove all external disks from /etc/fstab
cp /etc/fstab /etc/fstab.bkp

# remove the old contextualization log file
rm -f /var/log/context.log

# remove the persistent rules (e.g. network interfaces)
rm -f /etc/udev/rules.d/70-persistent-*

# TODO: ask for the choice
# (Optional) remove the old oozie log files (they can be heavy)
rm -rf /var/log/oozie

app_disk=`blkid | grep CIOP_APP | cut -d: -f1`

# TODO: check app_disk
umount /application
mkdir -p /mnt/application
mount $app_disk /mnt/application

# TODO: check disk free on destination
cp -r /mnt/application /application

cp pre_init.sh /mnt/context/

exit 0
