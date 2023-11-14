# Docker build file to serve jupyterlab
# *****OS, Image, and Version*****
FROM cluster-base


# *****Settings*****
ARG spark_version=3.4.0
ARG jupyterlab_version=4.0.0


# *****Update and Load Packages*****
RUN apt-get update -y && \
    apt-get install -y python3-pip && \
    apt-get install -y procps && \
    pip3 install wget pyspark==${spark_version} jupyterlab==${jupyterlab_version}


# *****Runtime*****
EXPOSE 8888
WORKDIR ${shared_workspace}
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=
