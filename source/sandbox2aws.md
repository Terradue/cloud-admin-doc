Exporting a Terradue's Cloud Developer Sandbox to AWS
=====================================================

Preparation of the disk
-----------------------

* Login into the Sandbox,
* Type:
```bash
$ ./ciop-cloud-prepare.sh
```

Snapshot of the disk
---------------------

* Login into the Sandbox,
* Type:
```bash
$ ./ciop-cloud-restore.sh
```

Converting the disk before the upload
-------------------------------------

* Convert the disk in a format suitable for ec2-import-instance tool:

```bash
$ qemu-img convert -O vmdk <source-disk> <destination-disk-type0>
$ vmware-vdiskmanager -r <destination-disk-type0> -t 5 <destination-disk-type5>
```

Upload of the disk on AWS
--------------------------

References
----------

1. [VM Import/Export](http://aws.amazon.com/ec2/vm-import/)
2. [VM Import/Export for Linux](http://aws.amazon.com/blogs/aws/vm-import-export-for-linux/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+AmazonWebServicesBlog+(Amazon+Web+Services+Blog))




