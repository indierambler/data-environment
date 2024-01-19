# Docker build file to serve jupyterlab

# *****OS, Image, and Version*****
FROM jupyter-base


# *****Settings*****
# shared_workspace set in jupyter-base dockerfile
# spark_version set in jupyter build script and persisted in jupyter-base dockerfile
# jupyterlab_version set in jupyter build script and persisted in jupyter-base dockerfile


# *****Update and Load Packages*****
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    python3-pip \
    procps && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install wget pyspark==${spark_version} jupyterlab==${jupyterlab_version}


# *****Create Environment*****
ENV SHARED_WORKSPACE=${shared_workspace}
# internal jupyterlab web ui port (used in docker-compose.yaml)
ENV JUPYTER_PORT=8888
# number of additional ports jupyter will try if JUPYTER_PORT is busy
ENV JUPYTER_PORT_RETRIES=2


# *****Runtime*****
EXPOSE ${JUPYTER_PORT}
WORKDIR ${shared_workspace}
CMD jupyter lab --ip=0.0.0.0 --no-browser --allow-root --NotebookApp.token=
