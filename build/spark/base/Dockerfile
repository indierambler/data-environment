# Docker build file for base spark framework
# - java as the only requirement to install spark
# - python3 for development and to support pyspark

# *****OS, Image, and Version*****
FROM debian:bullseye-slim


# *****Settings*****
# internal java version (not used)
#ARG java_version=17-jre  # latest LTS version
# internal directory for workspace shared between containers
ARG shared_workspace=/opt/workspace
# spark_version set in spark build script
ARG spark_version
ENV spark_version=${spark_version}
# hadoop_version set in spark build script
ARG hadoop_version
ENV hadoop_version=${hadoop_version}
# hadoop major version
ENV HADOOP_MAJOR_VERSION="3"
# spark archive file and directory name
ENV SPARK_ARCHIVE_NAME=spark-${spark_version}-bin-hadoop${HADOOP_MAJOR_VERSION}
# url at which to retrieve spark tarball
ENV SPARK_URL=https://archive.apache.org/dist/spark/spark-${spark_version}/${SPARK_ARCHIVE_NAME}.tgz


# *****Update and Load Packages*****
RUN mkdir -p ${shared_workspace} && \
    apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    default-jre-headless \
    python3 \
    procps \
    curl && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    curl "$SPARK_URL" -o spark.tgz && \
    tar -xvf spark.tgz && \
    mv ${SPARK_ARCHIVE_NAME} /usr/bin/ && \
    echo "alias pyspark=/usr/bin/${SPARK_ARCHIVE_NAME}/bin/pyspark" >> ~/.bashrc && \
    echo "alias spark-shell=/usr/bin/${SPARK_ARCHIVE_NAME}/bin/spark-shell" >> ~/.bashrc && \
    mkdir /usr/bin/${SPARK_ARCHIVE_NAME}/logs && \
    rm spark.tgz


# *****Create Environment*****
ENV shared_workspace=${shared_workspace}
ENV spark_version=${spark_version}
ENV hadoop_version=${hadoop_version}
ENV SPARK_HOME /usr/bin/${SPARK_ARCHIVE_NAME}
ENV SPARK_MASTER_HOST spark-master
ENV SPARK_MASTER_PORT 7077
ENV PYSPARK_PYTHON python3
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64


# *****Runtime*****
WORKDIR ${SPARK_HOME}
#CMD ["bash"]
