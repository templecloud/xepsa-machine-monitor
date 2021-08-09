#!/bin/bash

# docker run\
#  -d\
#  -p 9090:9090\
#  -v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml\
#  --name xepsa-prom\
#  prom/prometheus

docker run\
 -d\
 --net xepsa-machine-monitor-nw\
 -p 9090:9090\
 -v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml\
 --name xepsa-prom\
 prom/prometheus

 