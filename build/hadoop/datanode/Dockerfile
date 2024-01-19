# Docker build file for hadoop data node

# *****OS, Image, and Version*****
FROM hadoop-base


# *****Updates and Checks*****
HEALTHCHECK CMD curl -f http://localhost:9864/ || exit 1
RUN mkdir -p /hadoop/dfs/data
VOLUME /hadoop/dfs/data


# *****Create Environment*****
ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data


# *****Runtime*****
ADD run.sh /run.sh
RUN chmod a+x /run.sh
EXPOSE 9864
CMD ["/run.sh"]
