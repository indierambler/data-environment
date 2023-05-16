# Docker-Compose Environment for Scalable Data Analytics
## Overview
Stack: Spark, JupyterLab
Containers: cluster-base, spark-base, spark-master, spark-worker, jupyterlab
Requirements: docker, docker-compose (tested on Ubuntu Server 22.04)

## Description
This project provides a docker-compose environment that serves a JupyterLab 
instance and a locally-controlled, scalable Spark cluster. JupyterLab has
direct access to the Spark cluster resources and is useful for data analytics 
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
<localhost:8080>
- Access JupyterLab  web UI
<localhost:8888>
