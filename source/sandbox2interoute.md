How to export a Terradue's Developer Cloud Sandbox to Interoute
===============================================================

Intended audience
-----------------

Anyone has the technical background to interact with *nix systems, BASH language, command line interfaces (CLI) and common network communication protocols.

Step 1. Preparation of the Sandbox
----------------------------------

* Login into the Sandbox,
* Type:
```bash
$ ./ciop-cloud-prepare.sh
```

Step 2. Snapshot of the disk
----------------------------

* Login into the Cloud Controller,
* Make an **Hot** snapshot of the OS disk.

Step 3. Restore of the Sandbox
------------------------------

* Login into the Sandbox,
* Type:
```bash
$ ./ciop-cloud-restore.sh
```

Step 4. Converting the disk before the upload
---------------------------------------------

* Download the disk from the Cloud Controller (or from a location made available from the Terradue Support Team),
* Convert the disk in a format suitable for ec2-import-instance tool:

```bash
$ qemu-img convert -O vmdk <source-disk> <destination-disk-type0>
```

Step 5. Upload of the disk on Interoute
---------------------------------------

```bash
$ ec2-import-instance -o <bucket-owner-access-key> -w <bucket-owner-secret-key> -f vmdk <vmdk_disk_type_5> -b <bucket_name> --region <region_name> -t <instance_type> -s <disk size> -a x86_64 -p Linux 
```

References
----------

1. [How to upload a template on Interoute](http://cloudstore.interoute.com/main/knowledge-centre/library/how-upload-template)
