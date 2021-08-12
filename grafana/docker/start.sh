#!/bin/bash

# Default   : localhost:9100/metrics

_NW='xepsa-machine-monitor-nw'
_NAME='xepsa-grafana'

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
 -p 3000:3000\
 -e "GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-simple-json-datasource"\
 --name ${_NAME}\
 grafana/grafana:latest

# Check container host alias DNS A record.
#
if [ ! -z "${_dnw_id}" ]; then
  docker run --rm --network ${_NW} nicolaka/netshoot dig ${_NAME}
fi


