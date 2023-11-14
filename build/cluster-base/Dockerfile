# Docker build file to lay groundwork for a spark cluster and jupyter
# - java as the only requirement to install spark
# - python3 for development and to support pyspark
# - volume creation to simulate HDFS
# *****OS, Image, and Version*****
FROM debian:bullseye-slim


# *****Settings*****
#ARG java_version=17-jre  # latest LTS version
ARG shared_workspace=/opt/workspace


# *****Update and Load Packages*****
RUN mkdir -p ${shared_workspace} && \
    apt-get update -y && \
    apt-get -y install default-jre-headless && \
    apt-get install -y python3 && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# *****Create Environment*****
ENV shared_workspace=${shared_workspace}


# *****Runtime*****
VOLUME ${shared_workspace}
CMD ["bash"]
