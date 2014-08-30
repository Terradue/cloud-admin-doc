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
$ ./resources/scripts/ciop-cloud-prepare.sh
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
$ ./resources/scripts/ciop-cloud-restore.sh
```

Step 4. Upload of the disk on Interoute
---------------------------------------

* Follow the walk through described [here](https://hub.interoute.com/VDCImageUpload/assets/ImageUploader/) (There is a PDF version in this repo, under *./resources/pdf*).

References
----------

1. [Interoute Image Importer FAQ and Walk through](https://hub.interoute.com/VDCImageUpload/assets/ImageUploader/)
