# Docker-Compose Environment for ML Development
## Overview
Stack: Spark, JupyterLab, Python  
Containers: cluster-base, spark-base, spark-master, spark-worker, jupyterlab  
Requirements: docker, docker-compose (tested on Ubuntu Server 22.04)  
Tested Host OS: Ubuntu Server 22.04.2 LTS  
Coming Soon: Hadoop integration, JupyterHub integration, open Spark to outside applications  

## Description
This project provides a docker-compose environment that serves a JupyterLab 
instance and a locally-controlled, scalable Spark cluster. JupyterLab has
direct access to the Spark cluster resources. This is useful for data analytics 
and machine learning development.

## Get Running
1. Clone this repo  
```git clone git@github.com:indierambler/data-environment```
2. Move to the new project directory  
```cd data-environment```
3. Create the .env file  
```mv sample-env.md .env```
4. Add execute permissions to build script  
```chmod +x build/build.sh```
5. Build the docker images  
```build/build.sh```
6. Launch the containers  
```docker-compose up -d```

- Access Spark master web UI  
[http://localhost:8080](http://localhost:8080)
- Access JupyterLab  web UI  
[http://localhost:8888](http://localhost:8888)
