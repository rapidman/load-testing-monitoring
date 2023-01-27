#!/bin/bash

JVM_ARGS="-Xms1024m -Xmx1024m" jmeter \
        -JNUMBER_OF_THREADS=10 \
        -JRAMP_UP_PERIOD_SECONDS=10 \
        -JLOOP_COUNT=2 \
        -n -t SibCoins.jmx