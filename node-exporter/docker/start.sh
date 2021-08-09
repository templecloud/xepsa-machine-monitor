#!/bin/bash

# Default   : localhost:9100/metrics
# Alt Image : quay.io/prometheus/node-exporte

# docker run -d\
#  --net host\
#  --pid host\
#  -v /:/host:ro,rslave\
#  prom/node-exporter:latest --path.rootfs=/host

_DNW_NAME='xepsa-machine-monitor-nw'
_NAME='xepsa-node-exporter'

# Ensure Docker network.
#
_dnw_id="$(docker network ls | grep ${_DNW_NAME} | cut -d' ' -f1)"
if [ -z "${_dnw_id}" ]; then
  docker network create ${_DNW_NAME}
fi

# Start Docker container.
#
docker run -d\
 --net ${_DNW_NAME}\
 --network-alias ${_NAME}\
 --pid host\
 -v /:/host:ro,rslave\
 --name ${_NAME}\
 prom/node-exporter:latest --path.rootfs=/host

# Check container host alias DNS A record.
#
if [ -z "${_dnw_id}" ]; then
  # docker run --rm --network xepsa-machine-monitor-nw nicolaka/netshoot dig xepsa-node-exporter
  docker run --rm --network ${_DNW_NAME} nicolaka/netshoot dig ${_NAME}
fi


