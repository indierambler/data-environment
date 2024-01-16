# Docker build file for hadoop history server

# *****OS, Image, and Version*****
FROM hadoop-base


# *****Updates and Checks*****
HEALTHCHECK CMD curl -f http://localhost:8188/ || exit 1
RUN mkdir -p /hadoop/yarn/timeline
VOLUME /hadoop/yarn/timeline


# *****Create Environment*****
ENV YARN_CONF_yarn_timeline___service_leveldb___timeline___store_path=/hadoop/yarn/timeline


# *****Runtime*****
COPY run.sh /run.sh
RUN chmod a+x /run.sh
EXPOSE 8188
CMD ["/run.sh"]
