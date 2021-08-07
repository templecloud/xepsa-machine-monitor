#!/bin/bash

docker run\
 -d\
 -p 9090:9090\
 -v $(pwd)/prometheus.yaml:/etc/prometheus/prometheus.yaml\
 --name xepsa-prom\
 prom/prometheus
