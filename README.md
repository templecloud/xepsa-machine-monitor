# Xepsa Machine Monitor

* Experiment with Prometheus and Grafana locally.

* Check container DNS record

    * `docker run --rm -it --network ${docker_nw} nicolaka/netshoot`

    * `docker run --rm --network ${docker_nw} nicolaka/netshoot dig ${docker_host_alias}`

## References

* https://registry.hub.docker.com/r/prom/prometheus


* Prometheus Endpoints
    * http://localhost:9090
    * http://localhost:9090/targets
    * http://localhost:9090/graph
    * http://localhost:9090/metrics
    * http://localhost:9090/consoles/prometheus.html


