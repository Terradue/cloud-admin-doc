#!/bin/bash

mv /etc/fstab.bkp /etc/fstab

mv /var/log/context.log.sandbox /var/log/context

mv /tmp/oozie /var/log/

umount /mnt/application
rm -rf /application/*

mount /dev/ /application

mv /etc/rc.d/rc.local.bkp /etc/rc.d/rc.local

exit 0
