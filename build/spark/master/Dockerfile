# Docker build file for master spark node

# *****OS, Image, and Version*****
FROM spark-base


# *****Settings*****
# internal master web ui port (used in docker-compose.yaml)
ARG spark_master_web_ui=8080
# spark_version set in spark build script and persisted in spark-base dockerfile
# SPARK_MASTER_PORT set in spark-base dockerfile (overwriting the .env value)
# SPARK_CONNECT_PORT set in spark-base dockerfile (overwriting the .env value)


# *****Create Environment*****
#ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
# setting so that spark doesn't start as a daemon
#ENV SPARK_NO_DAEMONIZE=true


# *****Runtime*****
EXPOSE ${spark_master_web_ui} ${SPARK_MASTER_PORT} ${SPARK_CONNECT_PORT}
# older master lauch command (before SPARK_NO_DAEMONIZE was available)
#CMD bin/spark-class org.apache.spark.deploy.master.Master >> logs/spark-master.out && \
#    bin/spark-class org.apache.spark:spark-connect_2.12:$spark_version

# execute runtime actions through script (copying appears not to work)
#COPY run.sh /run.sh
#RUN chmod a+x /run.sh
#CMD ["/run.sh"]

# execute runtime actions via list of commands
CMD cp $shared_workspace/hadoop_conf/*-site.xml $SPARK_HOME/conf/ && \
    ./sbin/start-connect-server.sh --packages org.apache.spark:spark-connect_2.12:${spark_version} && \
    ./sbin/start-master.sh && \
    tail -f /dev/null
