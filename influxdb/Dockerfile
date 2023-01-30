FROM influxdb:1.8.10-alpine

LABEL maintainer="sibedge.com"

ADD influx_init.iql /docker-entrypoint-initdb.d/influx_init.iql

ENV INFLUXDB_ADMIN_USER=admin
ENV INFLUXDB_ADMIN_PASSWORD=admin
