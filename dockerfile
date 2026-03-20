FROM alpine

ADD init.sh /

ARG PS3NETSRV_RELEASE=20250501
ARG PYTHONUNBUFFERED=1

ENV PS3NETSRV_PORT=38008
ENV SYNC_ROMM_PATH=true

EXPOSE $PS3NETSRV_PORT

RUN apk update && \
    apk upgrade && \
    apk add --no-cache tini python3 py3-pip && \
    ln -sf python3 /usr/bin/python && \
    wget https://github.com/aldostools/ps3netsrv/releases/download/${PS3NETSRV_RELEASE}/ps3netsrv_${PS3NETSRV_RELEASE}_linux.zip && \
    unzip ps3netsrv_${PS3NETSRV_RELEASE}_linux.zip && \
    rm ps3netsrv_${PS3NETSRV_RELEASE}_linux.zip && \
    mv ps3netsrv_${PS3NETSRV_RELEASE} ps3netsrv && \
    chmod +x /ps3netsrv/ps3netsrv_linuxX86_64 && \
    chmod +x /init.sh

WORKDIR /ps3netsrv
RUN mkdir GAMES PS3ISO PSXISO PS2ISO PSPISO BDISO DVDISO ROMS GAMEI PKG MOVIES MUSIC PICTURE REDKEY ROMM_LIBRARY && \
    wget -O RomM-PS3NetSrv-Cross-Mapping.zip https://github.com/AccuraHub/RomM-PS3NetSrv-Cross-Mapping/archive/refs/tags/latest.zip && \
    unzip RomM-PS3NetSrv-Cross-Mapping.zip && \
    rm RomM-PS3NetSrv-Cross-Mapping.zip

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/init.sh"]