#--- Sample .env file ---#
# .env is required to run build.sh and docker-compose up
# 
# TO USE:
# 1. rename this file to ".env" and leave in the project's root directory
# 2. replace the environment variables with desired values 

SPARK_VERSION='3.4.0'
SPARK_MASTER_WEBUI_PORT=8080
SPARK_WORKER_WEBUI_PORT=8081
SPARK_WORKER_MEMORY='1G'
SPARK_WORKER_CORES=1
JUPYTER_PORT=8888
