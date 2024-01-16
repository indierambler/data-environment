# Docker build file to lay groundwork for a jupyter server
# - java as a requirement for pyspark
# - python3 for development and to support pyspark

# *****OS, Image, and Version*****
FROM debian:bullseye-slim


# *****Settings*****
# internal java version tag (not used)
#ARG java_version=17-jre  # latest LTS version
# internal directory for workspace shared between containers
ARG shared_workspace=/opt/workspace
# spark_version set in jupyter build script
ARG spark_version
ENV spark_version=${spark_version}
# jupyterlab_version set in jupyter build script
ARG jupyterlab_version
ENV jupyterlab_version=${jupyterlab_version}


# *****Update and Load Packages*****
RUN mkdir -p ${shared_workspace}/data && \
    apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    default-jre-headless \
    python3 && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# *****Create Environment*****
ENV shared_workspace=${shared_workspace}
ENV spark_version=${spark_version}
ENV jupyterlab_version=${jupyterlab_version}


# *****Runtime*****
VOLUME ${shared_workspace}
CMD ["bash"]
