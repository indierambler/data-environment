# Docker build file for hadoop node manager

# *****OS, Image, and Version*****
FROM hadoop-base


# *****Updates and Checks*****
HEALTHCHECK CMD curl -f http://localhost:8042/ || exit 1


# *****Runtime*****
ADD run.sh /run.sh
RUN chmod a+x /run.sh
EXPOSE 8042
CMD ["/run.sh"]
