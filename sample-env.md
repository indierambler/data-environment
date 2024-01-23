#--- Sample .env file ---#
# .env is required to run build.sh and docker-compose up
# 
# TO USE:
# 1. rename this file to ".env" and leave in the project's root directory
# 2. replace the environment variables with desired values 

# Hadoop settings
HADOOP_SUBDOMAIN="hadoop.domain.com"
HADOOP_VERSION="3.3.6"
HADOOP_CLUSTER_NAME=my_hadoop_cluster
HDFS_DIR=/path/to/shared/container/workspace
HADOOP_NAMENODE_DIR=/my/hadoop/volumes/namenode
HADOOP_DATANODE_DIR=/my/hadoop/volumes/datanode
HADOOP_HISTORYSERVER_DIR=/my/hadoop/volumes/historyserver
HADOOP_NAMENODE_HTTP_PORT=x.x.x.x:9870
HADOOP_NAMENODE_IPC_PORT=x.x.x.x:9000
HADOOP_DATANODE_PORT=x.x.x.x:9864

# Spark settings
SPARK_SUBDOMAIN="spark.domain.com"
SPARK_VERSION="3.5.0"
SPARK_USER=spark
SPARK_MASTER_WEBUI_PORT=8080
SPARK_MASTER_PORT=x.x.x.x:7077
SPARK_CONNECT_PORT=x.x.x.x:15002
SPARK_WORKER1_WEBUI_PORT=8081
SPARK_WORKER1_MEMORY="10G"
SPARK_WORKER1_CORES=2

# Jupyter settings
JUPYTER_SUBDOMAIN="jupyter.domain.com"
JUPYTERLAB_VERSION="4.0.0"
JUPYTER_PORT=60010

# secrets
# secrets can be added to this section and passed through docker-compose.yaml
