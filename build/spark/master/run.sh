#!/bin/bash

# wait for hadoop config files in shared workspace or timeout
i=0
until [[ $i -gt 5 ]]; do
    if [[ -f $shared_workspace/hadoop_conf/.new_hadoop_configs_available ]]; then
        cp $shared_workspace/hadoop_conf/*-site.xml $SPARK_HOME/conf/
        rm $shared_workspace/hadoop_conf/.new_hadoop_configs_available
        break
    elif [[ $i -eq 5 ]]; then
        echo Spark master failed to locate new hadoop configuration files in shared workspace
    fi
    sleep 1
    ((i++))
done

# start spark-connect server
./sbin/start-connect-server.sh --packages org.apache.spark:spark-connect_2.12:${spark_version}

# start spark master node
./sbin/start-master.sh

# run infinitely
tail -f /dev/null

