#!/bin/bash

nerdctl run \
  -p 7077:7077 \
  -p 8080:8080 \
  --rm \
  sparkpy:test \
  ../bin/spark-class org.apache.spark.deploy.master.Master -h 0.0.0.0