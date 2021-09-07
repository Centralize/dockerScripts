#!/usr/bin/bash

docker run -td -p 9090:9090 -v /home/mka/Sources/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus
