# JMeter InfluxDB Grafana Docker container

This is a container setup that allows you to immediately synchronize JMeter results with InfluxDB and visualize what is happening in realtime.

![Grafana Dashboard](docs/images/Grafana.png)

## Prerequisites
Ensure both docker and docker-compose are installed.

## Start InfluxDB and Grafana
`docker-compose up -d`

## Adjust JMeter script
Define 2 variables on the Test Plan component.

Name | Value
------------ | -------------
CLIENTNAME | Example
STARTDATETIME | `${__time(yy-MM-dd-HH:mm:ss:SSS)}`
	
Add & configure the Backend Listener in Jmeter.

![JMeter Backend Listener](docs/images/BackendListener.png)

Name | Value
------------ | -------------
influxdbMetricsSender  |  org.apache.jmeter.visualizers.backend.influxdb.HttpMetricsSender
influxdbUrl | http://${__P(INFLUXDB_HOST, localhost)}:8086/write?db=jmeter_results
application	| ${CLIENTNAME}_${STARTDATETIME}
measurement	| jmeter
summaryOnly	| false
samplersRegex | .*
percentiles	| 90;95;99
testTitle	| Test name
eventTags	|

## Mount docker volume on Docker Portainer host 
Copy `./mnt` dir to root directory on docker-portainer host. 

## Run JMeter script
- Download latest [JMeter](https://jmeter.apache.org/download_jmeter.cgi) release. 
- Add `jmeter/bin` directory to `path` variable
- Launch `./run.sh`

## Filter the correct testrun in Grafana
![Grafana Filter](docs/images/Grafana_filter.png)

It is the concatenation of `CLIENTNAME` and `STARTDATETIME`.

## Disclaimer
Inspired by https://www.blazemeter.com/blog/make-use-of-docker-with-jmeter-learn-how
