#!/bin/bash

docker run \
  -e SPARK_MASTER_HOST="0.0.0.0" \
  -p 7077:7077 \
  -p 8080:8080 \
  --rm \
  sparkpy:test \
  /opt/spark/bin/spark-class org.apache.spark.deploy.master.Master