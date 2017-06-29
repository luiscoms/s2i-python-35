Python Docker image
===================

This repository contains the source for building various versions of
the Python application as a reproducible Docker image using
[source-to-image](https://github.com/openshift/source-to-image).
Users can choose between RHEL and CentOS based builder images.
The resulting image can be run using [Docker](http://docker.io).


Supported tags and respective `Dockerfile` links
--------------------------------------------------

- With `libffi-devel` installed
  -   [`latest` (*Dockerfile*)](http://github.com/luiscoms/s2i-python-35/blob/master/Dockerfile)
-   [`onbuild` (*Dockerfile.onbuild*)](http://github.com/luiscoms/s2i-python-35/blob/master/Dockerfile.onbuild)
- With oracle client installed `oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64`
  -   [`oracle` (*Dockerfile-oracle*)](http://github.com/luiscoms/s2i-python-35/blob/master/Dockerfile-oracle)
  -   [`oracle-onbuild` (*Dockerfile-oracle*)](http://github.com/luiscoms/s2i-python-35/blob/master/Dockerfile-oracle.onbuild)

Usage
-----

Usage instructions could be found on [s2i-python-container](https://github.com/sclorg/s2i-python-container/tree/master/3.5)
