# Docker build file for base spark framework
# *****OS, Image, and Version*****
FROM cluster-base


# *****Settings*****
ARG spark_version=3.4.0
ARG hadoop_version=3  # see the spark distribution downloads site below


# *****Update and Load Packages*****
RUN apt-get update -y && \
    apt-get install -y procps && \
    apt-get install -y curl && \
    curl https://archive.apache.org/dist/spark/spark-${spark_version}/spark-${spark_version}-bin-hadoop${hadoop_version}.tgz -o spark.tgz && \
    tar -xf spark.tgz && \
    mv spark-${spark_version}-bin-hadoop${hadoop_version} /usr/bin/ && \
    mkdir /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}/logs && \
    rm spark.tgz


# *****Create Environment*****
ENV SPARK_HOME /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}
ENV SPARK_MASTER_HOST spark-master
ENV SPARK_MASTER_PORT 7077
ENV PYSPARK_PYTHON python3


# *****Runtime*****
WORKDIR ${SPARK_HOME}
