How to export a Terradue's Developer Cloud Sandbox to VMware ESXi
=================================================================

Intended audience
-----------------

Anyone has the technical background to interact with *nix systems, BASH language, command line interfaces (CLI) and common network communication protocols. 

Step 1. Preparation of the Sandbox
----------------------------------

* Login into the Sandbox,
* Type:
```bash
$ ./scripts/ciop-cloud-prepare.sh
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
$ ./scripts/ciop-cloud-restore.sh
```

Step 4. Converting the disk before the upload
---------------------------------------------

* Download the disk from the Cloud Controller (or from a location made available from the Operations Support Team at Terradue):

```bash
$ qemu-img convert -O vmdk <source-disk> <destination-disk-type0>
```

Step 5. Upload of the disk on ESXi
----------------------------------

* Login into the ESXi hypervisor through the VMware vSphere client,
* Click on ..,


References
----------

1. [Safe import of virtual machines to ESX/ESXi](http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2034095)
