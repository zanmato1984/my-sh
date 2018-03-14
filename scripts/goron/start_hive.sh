#!/bin/bash

source $BASH_IT/script/util.sh

NGMR_HOME="$DEVROOT/$NGMRROOT/spark"
NGMR_SHELL_HOME="$DEVROOT/$NGMRROOT/inceptor"
INCEPTOR_HOME="$DEVROOT/inceptor"

if [ $(uname) = "Darwin" ]; then
  MYSQL_CONNECTOR=$INCEPTOR_HOME/lib/mac
elif [ $(uname) = "Linux" ]; then
  MYSQL_CONNECTOR=$INCEPTOR_HOME/lib/ubuntu
fi

CLASSPATH=$CLASSPATH:$INCEPTOR_HOME/conf

# Whether IDE compiled classes are newer or command line built jars are.
ide_newer=`find $INCEPTOR_HOME/idea/out/production -newer $NGMR_SHELL_HOME/target/scala-2.10/inceptor_2.10-1.1.0-transwarp.jar`

if [ x"$ide_newer" = x"" ]; then
  # echo 'Command line built jars are newer.'
  paths=(
  $NGMR_SHELL_HOME/target
  $NGMR_HOME/core/target
  $NGMR_HOME/holodesk/target
  $NGMR_HOME/streaming/target
  $DEVROOT/$HIVEROOT/src
  $MYSQL_CONNECTOR
  )
else
  # echo 'IDE compiled classes are newer.'
  CLASSPATH+=:$INCEPTOR_HOME/idea/out/production/inceptor
  CLASSPATH+=:$INCEPTOR_HOME/idea/out/production/spark-core
  CLASSPATH+=:$INCEPTOR_HOME/idea/out/production/spark-holodesk
  CLASSPATH+=:$INCEPTOR_HOME/idea/out/production/spark-streaming
  CLASSPATH+=:$INCEPTOR_HOME/idea/out/production/hive
  paths=(
  $NGMR_SHELL_HOME/target/lib-idea
  $NGMR_HOME/core/target/lib-idea
  $NGMR_HOME/holodesk/target/lib-idea
  $NGMR_HOME/streaming/target/lib-idea
  $DEVROOT/$HIVEROOT/src/target/lib-idea
  $MYSQL_CONNECTOR
  )
fi

#Promote slf4j1.7.5
for jar in `find $NGMR_HOME/core/target/lib-idea -name 'slf4j*1.7.5*jar'`; do
  CLASSPATH+=:$jar
done

for path in ${paths[@]}; do
  for jar in `find_without_slf4j $path`; do
    CLASSPATH+=:$jar
  done
done

# echo $CLASSPATH;

$JAVA_HOME/bin/java $HADOOP_OPTS -Dlog4j.configuration=file://$INCEPTOR_HOME/conf/hive-log4j.properties -server -Xmx8192m -XX:+UseParNewGC -XX:NewRatio=2 -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=70 -cp $CLASSPATH $@
