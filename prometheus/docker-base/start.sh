#!/bin/bash

docker run -d\
 -p 9090:9090\
 --name xepsa-prom\
 xepsa-prom
