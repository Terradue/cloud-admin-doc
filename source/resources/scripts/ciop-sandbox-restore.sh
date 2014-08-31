#!/bin/bash

# -------------------------------------------------------------------------- #
# Copyright 2014, Terradue Srl http://www.terradue.com/                      #
#                                                                            #
# Licensed under the Apache License, Version 2.0 (the "License"); you may    #
# not use this file except in compliance with the License. You may obtain    #
# a copy of the License at                                                   #
#                                                                            #
# http://www.apache.org/licenses/LICENSE-2.0                                 #
#                                                                            #
# Unless required by applicable law or agreed to in writing, software        #
# distributed under the License is distributed on an "AS IS" BASIS,          #
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.   #
# See the License for the specific language governing permissions and        #
# limitations under the License.                                             #
#--------------------------------------------------------------------------- #


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
