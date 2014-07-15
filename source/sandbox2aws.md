Exporting a Terradue's Cloud Developer Sandbox to AWS
=====================================================

Preparation of the disk
-----------------------

* Login into the Sandbox,
* As root, remove all external disks from /etc/fstab (*Tip*. Make first a backup of that file to eventually replace it at the end of the exporting process):
```bash
$ vi /etc/fstab
```
* As root, remove the old contextualization log file:
```bash
$ rm -f /var/log/context.log
```
* (Optional) As root, remove the old oozie log files (they can be heavy):
```bash
$ rm -rf /var/log/oozie
```

Snapshot of the disk
---------------------

Converting the disk before the upload
-------------------------------------


Upload of the disk on AWS
--------------------------

References
----------

1. [VM Import/Export](http://aws.amazon.com/ec2/vm-import/)
2. [VM Import/Export for Linux](http://aws.amazon.com/blogs/aws/vm-import-export-for-linux/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+AmazonWebServicesBlog+(Amazon+Web+Services+Blog))




