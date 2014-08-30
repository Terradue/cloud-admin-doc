#!/bin/bash

# restoring fstab
mv /etc/fstab.bkp /etc/fstab

# restoring contextualization log
mv /var/log/context.log.sandbox /var/log/context

# restoring oozie log
mv /tmp/oozie /var/log/

# restoring application disk
umount /mnt/application
rm -rf /application/*

app_disk=`blkid | grep CIOP_APP | cut -d: -f1`
mount $app_disk /application

# restoring rc.local
mv /etc/rc.d/rc.local.bkp /etc/rc.d/rc.local

exit 0
