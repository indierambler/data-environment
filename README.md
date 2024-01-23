# Docker-Compose Environment for ML Development
## Overview
**Stack:** Spark/Spark-Connect/PySpark, Hadoop/HDFS, JupyterLab   
**Containers:**
- spark-master
- spark-worker-1
- hadoop-namenode
- hadoop-datanode
- hadoop-resourcemanager
- hadoop-nodemanager-1
- hadoop-historyserver
- jupyterlab
**Server Requirements:** docker
**Local Requirements** java jdk
**Tested Host OS:** Ubuntu Server 22.04.2 LTS  
**Coming Soon:** JupyterHub integration, LocalStack S3 integration  

## Description
This project provides a docker compose environment that serves JupyterLab, a
scalable Spark cluster, and a hadoop file system. The JupyterLab instance has
direct access to the Spark cluster and hadoop resources. Spark and Hadoop
instances can also be accessed and used through a remote machine via
Spark-Connect. This is useful for scalable data analytics, machine learning
development, and personal datastack experience.

## Get Running
1. Clone this repo  
```git clone git@github.com:indierambler/data-environment```
2. Move into the new project directory  
```cd data-environment```
3. Create the .env file  
```mv sample-env.md .env```
4. Add execute permissions to build scripts
```chmod +x build/build.sh build/*/build.sh```
5. Build the docker base images
```build/build.sh```
6. Launch the containers  
```docker-compose up -d```

## Access User Interfaces
- Spark master web UI  
[http://localhost:8080](http://localhost:8080)
- JupyterLab  web UI  
[http://localhost:8888](http://localhost:8888)
- Spark-Connect URL
sc://<SERVER_IP_ADDR>:<SPARK_CONNECT_PORT>
- Spark master URL
spark://<SERVER_IP_ADDR>:<SPARK_MASTER_PORT>
