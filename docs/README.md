# About

This is a container setup that allows you to immediately synchronize JMeter results with InfluxDB and visualize what is happening in realtime.

![Grafana Dashboard](docs/images/Grafana.png)

## Preconditions

Ensure both docker and docker-compose are installed.

## Step 1 Adjust JMeter script

Define 2 variables on the Test Plan component.

| Name          | Value                              |
| ------------- | ---------------------------------- |
| CLIENTNAME    | Example                            |
| STARTDATETIME | `${__time(yy-MM-dd-HH:mm:ss:SSS)}` |

Add & configure in the Backend Listener in Jmeter.

![JMeter Backend Listener](docs/images/BackendListener.png)

| Name                            | Value                                                                              |
| ------------------------------- | ---------------------------------------------------------------------------------- |
| backend listener implementation | io.github.mderevyankoaqa.influxdb2.visualizer.JMeterInfluxDBBackendListenerClient. |
| testName                        | ${CLIENTNAME}_${STARTDATETIME}                                                     |
| node name                       | any                                                                                |
| influxDBURL                     | http://${BASE_HOST}:8086                                                           |
| influxDBToken                   | provide token from influx                                                          |
| influxDBOrganization            | sibedge                                                                            |

## Step 2 Mount docker volume on Docker Portainer host

Copy `./mnt` dir to root directory on docker-portainer host.

## Step 3 Start InfluxDB and Grafana

`docker-compose up -d`

## Step 4 Run JMeter script

- Download latest [JMeter](https://jmeter.apache.org/download_jmeter.cgi) release.
- Add `jmeter/bin` directory to `path` variable
- Launch `./run.sh`

## Step 5 Filter the correct testrun in Grafana

![Grafana Filter](docs/images/Grafana_filter.png)

It is the concatenation of `CLIENTNAME` and `STARTDATETIME`.

## Disclaimer

Based on <https://github.com/mderevyankoaqa/jmeter-influxdb2-listener-plugin/>
