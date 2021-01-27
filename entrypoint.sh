#!/bin/sh

java -jar /usr/local/lib/rippanda.jar "$@" 2>&1 | tee /log-dir/log-$(date +%Y-%m-%d-%H-%M-%S).txt
