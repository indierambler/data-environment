# Docker build file for worker spark node
# *****OS, Image, and Version*****
FROM spark-base


# *****Settings*****
# internal worker web ui port (used in docker-compose.yaml)
ARG spark_worker_web_ui=8081
# SPARK_MASTER_PORT set in spark base dockerfile
# SPARK_MASTER_HOST set in spark base dockerfile


# *****Create Environment*****
# setting so that spark doesn't start as a daemon
#ENV SPARK_NO_DAEMONIZE=true


# *****Runtime*****
EXPOSE ${spark_worker_web_ui}
#CMD bin/spark-class org.apache.spark.deploy.worker.Worker spark://${SPARK_MASTER_HOST}:${SPARK_MASTER_PORT} >> logs/spark-worker.out
CMD ./sbin/start-worker.sh spark://${SPARK_MASTER_HOST}:${SPARK_MASTER_PORT} && \
    tail -f /dev/null
