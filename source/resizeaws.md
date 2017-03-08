How to resize a Terradue's Developer Cloud Sandbox running at AWS EC2
=====================================================================

Scenario
--------

You have a running or just imported Developer Cloud Sandbox on AWS EC2 and you want to have a larger root disk, without attaching an additional disk.

Re-create the partition
-----------------------

* Login into the Sandbox,
* Update to the latest kernel and fdisk releases and reboot: 
```bash
$ sudo yum update -y util-linux-ng && sudo reboot
```
* Check your partition table by typing:
```bash
$ fdisk -l -c -u /dev/xvda

Disk /dev/xvda: 161.1 GB, 161061273600 bytes
255 heads, 63 sectors/track, 19581 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x0007572f

    Device Boot      Start         End      Blocks   Id  System
/dev/xvda1   *           1          64      512000   83  Linux
Partition 1 does not end on cylinder boundary.
/dev/xvda2              64       19581   156771358+  8e  Linux LVM
```

*Here we are assuming that the main device is */dev/xvda**

* Modify the partition table, by typing:
```bash
$ fdisk -c -u /dev/xvda
(fdisk) Command (m for help): d
(fdisk) Partition number (1-4): 2
(fdisk) Command (m for help): n
(fdisk) Partition type:
p primary
e extended
Select (default p): p
Partition number (1-4, default 1): 2
First sector (63-40558591, default 63): 64
Last sector, +sectors or +size{K,M,G} (63-40558591, default 40558591): [PRESS ENTER TO ACCEPT LARGEST DEFAULT]
(fdisk) Command (m for help): t
Partition number (1-4): 2
Hex Code (type L to list codes): 8e
(fdisk) Command (m for help): w
```

* Reboot the system:
```bash
$ reboot
```

Extend the LVM
---------------

* If you're confident about the final outcome :
```bash
# pvresize /dev/xvda2 && lvextend -l +100%FREE /dev/mapper/vg_centos-lv_root && resize2fs /dev/mapper/vg_centos-lv_root && df -h && reboot
```

* Otherwise resize it step by step :
```bash
$ sudo pvresize /dev/xvda2
$ sudo lvextend -l +100%FREE /dev/mapper/vg_centos-lv_root 
$ sudo resize2fs /dev/mapper/vg_centos-lv_root
```

* Check the new size ; eventually reboot:
```bash
$ df -h
```

References
----------

1. [fdisk resize/grow physical partition](http://litwol.com/content/fdisk-resizegrow-physical-partition-without-losing-data-linodecom)
