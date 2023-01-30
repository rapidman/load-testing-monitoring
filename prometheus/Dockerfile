FROM prom/prometheus:latest

LABEL maintainer="sibedge.com"

ADD prometheus.yml /etc/prometheus/prometheus.yml

CMD [ "--config.file=/etc/prometheus/prometheus.yml", \
    "--storage.tsdb.path=/prometheus", \
    "--web.console.libraries=/etc/prometheus/console_libraries", \
    "--web.console.templates=/etc/prometheus/consoles", \
    "--web.enable-lifecycle" ]

