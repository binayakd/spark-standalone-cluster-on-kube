FROM eclipse-temurin:17-jre-alpine

ARG USERID=1000
ARG SPARK_VERSION="3.3.0"

# add non root user
RUN adduser --disabled-password --shell /bin/ash --uid ${USERID} sparkuser

# install python and other dependencies 
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 curl bash\
  && python3 -m ensurepip \
  && ln -sf python3 /usr/bin/python \
  && ln -sf pip3 /usr/bin/pip \
  && pip install --no-cache --upgrade pip setuptools wheel

# install spark
WORKDIR /opt
RUN curl https://dlcdn.apache.org/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop3.tgz | tar -zx  \
  && mv spark-${SPARK_VERSION}-bin-hadoop3 spark \
  && mkdir /opt/spark/work-dir \
  && chown -R sparkuser:sparkuser /opt/spark

# set up env variables
ENV JAVA_HOME=/opt/java/openjdk
ENV SPARK_HOME=/opt/spark
ENV PYSPARK_PYTHON=python3
RUN for file in $SPARK_HOME/python/lib/*.zip; do export PYTHONPATH=$file:$PYTHONPATH; done

# switching to non root user
USER sparkuser
WORKDIR /opt/spark/work-dir