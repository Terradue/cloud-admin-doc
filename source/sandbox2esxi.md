How to export a Terradue's Developer Cloud Sandbox to VMware ESXi
=================================================================

Intended audience
-----------------

Anyone has the technical background to interact with *nix systems, BASH language, command line interfaces (CLI) and common network communication protocols.

Prerequisites
-------------

* To have root/admin permissions on the Sandbox,
* To have root/admin access to an ESXi installation,
* To have installed the [qemu-img](http://wiki.qemu.org/Main_Page) tool for manipulating disk images.

Step 1. Preparation of the Sandbox
----------------------------------

* Login into the Sandbox,
* Copy the content of the folder *resources/scripts* in a directory you prefer,
* Type:
```bash
$ ./resources/scripts/ciop-sandbox-prepare.sh
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
$ ./resources/scripts/ciop-sandbox-restore.sh
```

Step 4. Converting the disk before the upload
---------------------------------------------

* Download the disk from the Cloud Controller (or from a location made available from the Operations Support Team at Terradue),
* Convert it into the VMDK format:

```bash
$ qemu-img convert -O vmdk <source-disk> <destination-disk>
```
* *(Alternative)* If you encounter the message *"error while converting vmdk: Invalid argument"* after typing the previous command, just execute the following two steps:
```bash
$ qemu-img convert -O raw <source-disk> <destination-disk-raw>
$ qemu-img convert -O vmdk <source-disk-raw> <destination-disk-vmdk>
```

Step 5. Upload of the disk on ESXi
----------------------------------

* Copy the disk in VMDK format in a datastore you prefer. You can use the following command:

```bash
$ scp /path/to/disk.vmdk root@<esxi_host>:/vmfs/volumes/<datastore>/
```

Step 6. Create a virtual machine's configuration file (.vmx)
------------------------------------------------------------

* Login into the ESXi hypervisor through the VMware vSphere client,
* 

References
----------

1. [Safe import of virtual machines to ESX/ESXi](http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2034095)
