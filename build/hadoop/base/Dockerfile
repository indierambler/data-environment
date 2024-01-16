# Docker build file to lay groundwork for hadoop container group

# *****OS, Image, and Version*****
FROM debian:bullseye-slim


# *****Settings*****
# validate --build-args from build script
ARG hadoop_version
ARG spark_version
ARG base_dir
ARG namenode_dir
ARG datanode_dir
ARG resourcemanager_dir
ARG nodemanager_dir
ARG historyserver_dir
# persist args through build stages (and into runtime/child images)
ENV hadoop_version=${hadoop_version}
ENV spark_version=${spark_version}
ENV base_dir=${base_dir}
ENV namenode_dir=${namenode_dir}
ENV datanode_dir=${datanode_dir}
ENV resourcemanager_dir=${resourcemanager_dir}
ENV nodemanager_dir=${nodemanager_dir}
ENV historyserver_dir=${historyserver_dir}


# *****Update and Load Packages*****
# move PySpark/Hadoop test to the container (Write/Reading dataframe)
COPY ${base_dir}/test.py /

# update OS and inatall packages
RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    default-jre-headless \
    nano \
    netcat-traditional \
    net-tools \
    wget \
    curl \
    gnupg \
    libsnappy-dev \
    make \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev && \
    rm -rf /var/lib/apt/lists/*

# load and set up python and pyspark
# \/ new debian python build tool (fails) \/
#    py2dsp --build pyspark==${spark_version} && \
#    py2dsp --build pyspark[sql] && \
#    py2dsp --build pyspark[pandas_on_spark] && \
#    py2dsp --build pyspark[connect] && \
# /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\
RUN apt-get update && \
    apt-get install -y \
    pypi2deb \
    python3 \
    python3-pip && \
    PYSPARK_HADOOP_VERSION=3 pip3 install pyspark && \
    pip3 install \
    pyspark[sql] \
    pyspark[pandas_on_spark] \
    pyspark[connect] && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# load and set up hadoop
# - download hadoops gpg key so signature file can be read
# - download hadoop tarball (from hadoop suggested mirror server)
# - download hadoop signature file (from hadoop main site) to validate tarball
# - run tarball verification
# - extract the tarball and delete the original
# - simlink new install into main package dir
# - create logs and data directories
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
ARG HADOOP_URL=https://dlcdn.apache.org/hadoop/common/hadoop-${hadoop_version}/hadoop-${hadoop_version}.tar.gz
ARG HADOOP_SIGNATURE=https://downloads.apache.org/hadoop/common/hadoop-${hadoop_version}/hadoop-${hadoop_version}.tar.gz.asc
RUN curl -O https://downloads.apache.org/hadoop/common/KEYS && \
    curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz && \
    curl -fSL "$HADOOP_SIGNATURE" -o /tmp/hadoop.tar.gz.asc && \
    gpg --import KEYS && \
    set -x && \
    gpg --verify /tmp/hadoop.tar.gz.asc /tmp/hadoop.tar.gz && \
    tar -xvf /tmp/hadoop.tar.gz -C /opt/ && \
    rm /tmp/hadoop.tar.gz* && \
    ln -s /opt/hadoop-${hadoop_version}/etc/hadoop /etc/hadoop && \
    mkdir /opt/hadoop-${hadoop_version}/logs && \
    mkdir /hadoop-data


# *****Create Environment*****
ENV HADOOP_HOME=/opt/hadoop-${hadoop_version}
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV USER=root
ENV PATH $HADOOP_HOME/bin/:$PATH


# *****Runtime*****
COPY ${base_dir}/entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
