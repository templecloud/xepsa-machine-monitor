#!/bin/bash

# Default   : localhost:9100/metrics

_NW='xepsa-machine-monitor-nw'
_NAME='xepsa-node-exporter'

# Ensure Docker network.
#
_dnw_id="$(docker network ls | grep ${_NW} | cut -d' ' -f1)"
if [ -z "${_dnw_id}" ]; then
  docker network create ${_NW}
fi

# Start Docker container.
#
docker run -d\
 --net ${_NW}\
 --network-alias ${_NAME}\
 --pid host\
 -v /:/host:ro,rslave\
 --name ${_NAME}\
 prom/node-exporter:latest --path.rootfs=/host

# Check container host alias DNS A record.
#
if [ ! -z "${_dnw_id}" ]; then
  docker run --rm --network ${_NW} nicolaka/netshoot dig ${_NAME}
fi


