#!/bin/bash

# Remove xepsa-node-exporter container
#
_NAME='xepsa-node-exporter'
docker rm -f ${_NAME}

# Remove xepsa-machine-monitor-nw
#
_DNW_NAME='xepsa-machine-monitor-nw'

_dnw_id="$(docker network ls | grep ${_DNW_NAME} | cut -d' ' -f1)"
if [ -z "${_dnw_id}" ]; then
  docker network delete ${_DNW_NAME}
fi

