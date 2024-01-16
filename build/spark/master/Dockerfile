# Docker build file for master spark node

# *****OS, Image, and Version*****
FROM spark-base


# *****Settings*****
# internal master web ui port (used in docker-compose.yaml)
ARG spark_master_web_ui=8080
# spark_version set in spark build script and persisted in spark-base dockerfile
# SPARK_MASTER_PORT set in spark-base dockerfile


# *****Create Environment*****
#ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64


# *****Runtime*****
EXPOSE ${spark_master_web_ui} ${SPARK_MASTER_PORT}
#CMD sbin/start-master.sh && sbin/start-connect-server.sh --packages org.apache.spark:spark-connect_2.12:$spark_version
CMD bin/spark-class org.apache.spark.deploy.master.Master >> logs/spark-master.out && \
    bin/spark-class org.apache.spark:spark-connect_2.12:$spark_version