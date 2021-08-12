#!/bin/bash

_NW='xepsa-machine-monitor-nw'
_NAME='xepsa-prom'

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
 -p 9090:9090\
 -v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml\
 --name ${_NAME}\
 prom/prometheus

# Check container host alias DNS A record.
#
if [ ! -z "${_dnw_id}" ]; then
  docker run --rm --network ${_NW} nicolaka/netshoot dig ${_NAME}
fi