# Docker build file for hadoop name node

# *****OS, Image, and Version*****
FROM hadoop-base


# *****Updates and Checks*****
HEALTHCHECK CMD curl -f http://localhost:9870/ || exit 1
RUN mkdir -p /hadoop/dfs/name
VOLUME /hadoop/dfs/name


# *****Updates and Changes*****
# move config files to shared directory for spark-hadoop integration
RUN mkdir $shared_workspace/hadoop_conf && \
    cp $HADOOP_CONF_DIR/core-site.xml $shared_workspace/hadoop_conf/ && \
    cp $HADOOP_CONF_DIR/hdfs-site.xml $shared_workspace/hadoop_conf/ && \
    cp $HADOOP_CONF_DIR/yarn-site.xml $shared_workspace/hadoop_conf/ && \
    touch ${shared_workspace}/hadoop_conf/.new_hadoop_configs_available


# *****Create Environment*****
ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name


# *****Runtime*****
COPY run.sh /run.sh
RUN chmod a+x /run.sh
EXPOSE 9870
CMD ["/run.sh"]
