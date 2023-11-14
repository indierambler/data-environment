# Docker build file for master spark node
# *****OS, Image, and Version*****
FROM spark-base


# *****Settings*****
ARG spark_master_web_ui=8080


# *****Runtime*****
#ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
EXPOSE ${spark_master_web_ui} ${SPARK_MASTER_PORT}
#CMD sbin/start-master.sh && sbin/start-connect-server.sh --packages org.apache.spark:spark-connect_2.12:$spark_version
CMD bin/spark-class org.apache.spark.deploy.master.Master >> logs/spark-master.out && \
    bin/spark-class org.apache.spark:spark-connect_2.12:$spark_version
