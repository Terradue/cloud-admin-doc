How to export a Terradue's Developer Cloud Sandbox to Interoute
===============================================================

Intended audience
-----------------

Anyone has the technical background to interact with *nix systems, BASH language, command line interfaces (CLI) and common network communication protocols.

Prerequisites
-------------

* To have root/admin permissions on the Sandbox,
* To have root/admin access to an ESXi 5.x installation,
* To have installed the [qemu-img](http://wiki.qemu.org/Main_Page) tool for manipulating disk images.

Step 1. Preparation of the Sandbox
----------------------------------

This step prepares your Sandbox in terms OS configuration. Furthermore it makes the OS and the Application disks a single one disk (i.e. it copies all the content of the */application* mount point in the */* mount point). Before to start, please make sure that:

- The */application* contains only the needed stuff to be executed in Cluster mode (i.e. it is clean), 
- The */* has enough space to contain all the data of the */application* (If not, please contact the Operations Support  Team at Terradue).

If the previous facts are verified, proceed with the following steps:

* Login into the Sandbox,
* Type:
```bash
$ sh ./resources/scripts/ciop-sandbox-prepare.sh
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
$ sh ./resources/scripts/ciop-sandbox-restore.sh
```

Step 4. Upload of the disk on Interoute
---------------------------------------

* Follow the walk through described [here](https://hub.interoute.com/VDCImageUpload/assets/ImageUploader/) (There is a PDF version in this repository, under *resources/pdf*).

References
----------

1. [Interoute Image Importer FAQ and Walk through](https://hub.interoute.com/VDCImageUpload/assets/ImageUploader/)
