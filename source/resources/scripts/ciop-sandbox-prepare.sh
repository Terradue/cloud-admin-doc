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


function logThis
{
    echo -e "\n[`date`] $1"
}

logThis "Starting the Developer Cloud Sandbox preparation for snapshot..."

# check the application disk
app_disk=`blkid | grep CIOP_APP | cut -d: -f1`

if [[ -z "$app_disk" ]]; then
  logThis "There is a problem with your Application disk. Please contact the Operations Support Team at Terradue"
  exit 1
fi

# remove all external disks from /etc/fstab
cp /etc/fstab /etc/fstab.bkp
cp ./fstab /etc/fstab

# move the old contextualization log file to another name
mv /var/log/context.log /var/log/context.log.sandbox

# remove the persistent rules (e.g. network interfaces)
rm -f /etc/udev/rules.d/70-persistent-*

# (Optional) mv the old oozie log files (they can be heavy)
logThis "do you want to remove all the Oozie log (they will be not available in the new Sandbox)? (y/n)"
read -n 1 answer
if [ "$answer" == "y" ]; then mv /var/log/oozie /tmp/; fi

# Prepare the Application disk
logThis "Preparing Application disk..."

umount /application
mkdir -p /mnt/application
mount $app_disk /mnt/application
cp -r /mnt/application /application/

# Prepare the remote contextualization
logThis "Preparing the remote contextualization..."

cp ./pre_init.sh /mnt/context/
chmod +x /mnt/context/pre_init.sh

mv /etc/rc.d/rc.local /etc/rc.d/rc.local.bkp

cat > /etc/rc.d/rc.local << EOF
touch /var/lock/subsys/local

if [ -f /mnt/context/pre_init.sh ]; then
  sh -x /mnt/context/pre_init.sh >>/var/log/context.log 2>&1
fi
EOF

exit 0
