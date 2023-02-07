#!/bin/bash

JVM_ARGS="-Xms1024m -Xmx1024m" ../../apache-jmeter-5.5/bin/jmeter \
        -JNUMBER_OF_THREADS=10 \
        -JRAMP_UP_PERIOD_SECONDS=10 \
        -JLOOP_COUNT=2 \
        -JBASE_HOST=sibedgecoinstest.development.com \
        -JPORT_NUMBER=5001 \
        -JPROTOCOL=http \
        -JTHREAD_DURATION=0 \
        -JSTARTUP_DELAY=1 \
        -n -t SibCoins.jmx