<div align="center">
  
  ![banner](https://github.com/AccuraHub/Docker-PS3NetSrv-with-RomM-library-support/blob/main/banner.png?raw=true)

  ### Store and play your ROMs with class
   
</div>


# Overview
<div align="justify">
  
[PS3NetSrv](https://github.com/aldostools/webMAN-MOD/) is a wonderful tool that allows us to easily run our ROMs over the network, but it lacks library management. On the other hand, we have a modern [RomM](https://romm.app/) for managing ROMs collection - so why not combine the features of both projects?

**Docker-PS3NetSrv-with-RomM-library-support** is a simple Apline based docker image with newest PS3NetSrv and [
RomM-PS3NetSrv-Cross-Mapping](https://github.com/AccuraHub/RomM-PS3NetSrv-Cross-Mapping/) script that maps RomM folder structure to PS3NetSrv - simply by creating symbolic links at PS3NetSrv path.

</div>

## How it works
During creation of container, script scans the RomM library and then links supported items to the appropriate PS3NetSrv folders inside docker container.

> [!NOTE]
> **Docker-PS3NetSrv-with-RomM-library-support** can be started without RomM library support, which will make it work like pure PS3NetSrv inside docker container. See [Configuration](#configuration) for a complete reference.

## Quick Start
> [!IMPORTANT]
> Always mount RomM library as `READ-ONLY`. Without this option, you risk damaging your collection in case of failure!

Clone this repository, build image, specify your RomM library path in `docker-compose.yaml` and run.

```bash
git clone https://github.com/AccuraHub/Docker-PS3NetSrv-with-RomM-library-support.git

cd Docker-PS3NetSrv-with-RomM-library-support

sudo docker build --no-cache -t ps3netsrv .
```

```yaml
services:
  ps3netsrv:
    image: ps3netsrv
    container_name: ps3netsrv
    hostname: ps3netsrv
    volumes:
      - {path_to_your_romm_instance}/library/roms:/ps3netsrv/ROMM_LIBRARY:ro
    ports:
      - 38008:38008
```

```bash
sudo docker compose up -d
```

> [!NOTE]
> `docker-compose.yaml` is preferred method but you can also use `docker run`.
> ```bash
> sudo docker run -d --rm -p 38008:38008 -v {path_to_your_romm_instance}/library/roms:/ps3netsrv/:ro ps3netsrv
> ```

## Configuration
### Environment variables
| Variable | Default value | Description |
|---|---|---|
| SYNC_ROMM_PATH | `true` | when this option is enabled container will scan RomM library on startup |
| PS3NETSRV_PORT | `38008` | port on which PS3NetSrv is running |

### Running without RomM library support
**Docker-PS3NetSrv-with-RomM-library-support** can be started without RomM library support, which will make it work like pure PS3NetSrv inside docker container. To do that change `SYNC_ROMM_PATH` to `false` in `docker-compose.yaml` and specify your PS3NetSrv path as volume

```yaml
services:
  ps3netsrv:
    image: ps3netsrv
    container_name: ps3netsrv

    environment:
      - PS3NETSRV_PORT=38008
      - SYNC_ROMM_PATH=false

    volumes:
      # Volume for RomM support
      # - /romm/library/roms:/ps3netsrv/ROMM_LIBRARY:ro

      # Uncomment if you want use standard PS3NetSrv folder structure 
      - ./ps3netsrv:/ps3netsrv:ro

    ports:
      - 38008:38008
```

### Permissions
> [!NOTE]
> to-do

### Issues
> [!NOTE]
> to-do