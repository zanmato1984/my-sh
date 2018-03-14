#!/bin/sh

# nohup start_metastore.sh > /dev/null &
nohup /usr/lib/zookeeper/bin/zkServer.sh start > /dev/null &
nohup /usr/lib/hadoop-hdfs/bin/hdfs namenode > /dev/null &
nohup /usr/lib/hadoop-hdfs/bin/hdfs datanode > /dev/null &

sudo mkdir /var/run/hyperbase1
sudo chmod a+rw /var/run/hyperbase1
nohup /usr/lib/hbase/bin/start-hbase.sh > /dev/null &
