# Docker-Compose Environment for Big Data R & D
## Overview
**Stack:**  
- Spark/Spark-Connect/PySpark  
- Hadoop/HDFS  
- JupyterLab  

**Containers:**  
- spark-master
- spark-worker-1
- hadoop-namenode
- hadoop-datanode
- hadoop-resourcemanager
- hadoop-nodemanager-1
- hadoop-historyserver
- jupyterlab  

**Server Requirements:**  
- docker  

**Local Requirements:**  
- java-jdk  

**Tested Host OS:**  
- Ubuntu Server 22.04.2 LTS  

**Coming Soon:**  
- JupyterHub integration
- LocalStack S3 integration  

## Description
This project provides a docker compose environment that serves JupyterLab, a
scalable Spark cluster, and a scalable Hadoop file system. The JupyterLab
instance has direct access to the Spark cluster and hadoop resources. Spark
and Hadoop instances can also be accessed and used through a remote machine via
Spark-Connect. This is useful for scalable data analytics, machine learning
development, and personal datastack experience.

## Get Running
1. Clone this repo  
```git clone git@github.com:indierambler/data-environment```
2. Move into the new project directory  
```cd data-environment```
3. Create and Update the .env file  
```mv sample-env.md .env```  
Make sure to update the values inside the new .env file (```nano .env```)  
    - set subdomain values only if connecting to a reverse proxy
    - set directories to local locations where container data can be stored
    - set IP addresses to the local server's network address (ports need no change)
    - allocate cores and memory based on what is available in your system
4. Add execute permissions to build scripts  
```chmod +x build/build.sh build/*/build.sh```
5. Build the docker base images  
```build/build.sh```
6. Launch the containers  
```docker-compose up -d```

## Update (via git)
1. Move into data-environment directory  
```cd path/to/data-environment```  
2. Make sure data-environment is shut down  
```docker compose down```  
3. Pull Any Exiting Git Changes  
```git pull```  
4. Start data-environment back up  
```docker compose up -d```  

## Access Interfaces
### From Local Machine (server) running the data-environment
- JupyterLab web UI: [http://localhost:8888](http://localhost:8888)
- Hadoop web UI: [http://localhost:9870](http://localhost:9870)
- Spark master web UI: [http://localhost:8080](http://localhost:8080)
- Spark master URL: spark://local[n]:7077 (n = number of cores to use)
### From Remote Machine (client) with SSH access to server running data-environment
- JupyterLab web UI: http://<SERVER_IP_ADDR>:8888
- Hadoop web UI: http://<SERVER_IP_ADDR>:9870
- Spark master web UI: http://<SERVER_IP_ADDR>:8080
- Spark-Connect URL: sc://<SERVER_IP_ADDR>:15002

## Spark and HDFS Interactions
A Jupyter Notebook for learning and testing basic interactions with Spark
and HDFS can be found in the project folder at
[data-environment/demo/spark-demo.ipynb](https://github.com/indierambler/data-environment/blob/master/demo/spark-demo.ipynb).
This file can be used on a remote machine with SSH access to the Spark/Hadoop
server or uploaded directly to the JupyterLab instance for testing.

## Using With Nginx Reverse Proxy
This project is set up to work with the
[nginx-proxy/nginx-proxy](https://github.com/nginx-proxy/nginx-proxy) project.
Some things to keep in mind when connecting up to the reverse proxy:  
- Make sure the reverse proxy and data-environment docker-compose.yaml files
put all services on the same docker network
- Make sure docker-compose/.env subdomains are set correctly
