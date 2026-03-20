#!/bin/sh

if [ "$SYNC_ROMM_PATH" = true ] ; then
    python /ps3netsrv/RomM-PS3NetSrv-Cross-Mapping-latest/RomM-PS3NetSrv-Cross-Mapping.py
fi

/ps3netsrv/ps3netsrv_linuxX86_64 $PS3NETSRV_PORT