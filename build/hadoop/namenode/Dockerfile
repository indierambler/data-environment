# Docker build file for hadoop name node

# *****OS, Image, and Version*****
FROM hadoop-base


# *****Updates and Checks*****
HEALTHCHECK CMD curl -f http://localhost:9870/ || exit 1
RUN mkdir -p /hadoop/dfs/name
VOLUME /hadoop/dfs/name


# *****Create Environment*****
ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name


# *****Runtime*****
COPY run.sh /run.sh
RUN chmod a+x /run.sh
EXPOSE 9870
CMD ["/run.sh"]
