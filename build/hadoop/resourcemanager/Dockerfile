# Docker build file for hadoop resource manager

# *****OS, Image, and Version*****
FROM hadoop-base


# *****Updates and Checks*****
HEALTHCHECK CMD curl -f http://localhost:8088/ || exit 1


# *****Runtime*****
COPY run.sh /run.sh
RUN chmod a+x /run.sh
EXPOSE 8088
CMD ["/run.sh"]
