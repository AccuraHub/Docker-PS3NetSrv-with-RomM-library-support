# Docker-PS3NetSrv-with-RomM-library-support
## Store and play your ROMs with class

[PS3NetSrv](https://github.com/aldostools/webMAN-MOD/) is a wonderful tool that allows us to easily run our ROMs over the network, but it lacks library management. On the other hand, we have a modern [RomM](https://romm.app/) for managing ROMs collection - so why not combine the features of both projects?

**Docker-PS3NetSrv-with-RomM-library-support** is an simple Apline based docker image with newest PS3NetSrv and [
RomM-PS3NetSrv-Cross-Mapping](https://github.com/AccuraHub/RomM-PS3NetSrv-Cross-Mapping/) script that maps RomM folder structure to PS3NetSrv - simply by creating symbolic links at PS3NetSrv path.

## How it works
During creation of container, script scans the RomM library and then links elements to the appropriate PS3NetSrv folders.
