#!/bin/sh

for dir in $DEVROOT/$HIVEROOT/src/build/dist/lib
do
  for file in `ls $dir`
  do
    CLASSPATH=$CLASSPATH:$dir/$file
  done
done

for dir in $DEVROOT/$HIVEROOT/src/build/ivy/lib
do
  for file in `ls $dir`
  do
    CLASSPATH=$CLASSPATH:$dir/$file
  done
done

for dir in $DEVROOT/$HIVEROOT/src/build/ivy/lib/hadoop0.20.shim
do
  for file in `ls $dir`
  do
    CLASSPATH=$CLASSPATH:$dir/$file
  done
done

CLASSPATH=$CLASSPATH:/usr/lib/hive/lib/mysql-connector-java.jar:$HOME_ABS/dev/WARP-1019-hive-0.12.0-transwarp/src/metastore/src/model/package.jdo
CLASSPATH=$CLASSPATH:$HOME_ABS/dev/WARP-1019-hive-0.12.0-transwarp/src/metastore/src/model/org/apache/hadoop/hive/metastore/model/*.java

# echo $CLASSPATH ;

$JAVA_HOME/bin/java -cp $CLASSPATH -Ddatanucleus.ConnectionDriverName=com.mysql.jdbc.Driver -Ddatanucleus.ConnectionURL=jdbc:mysql://localhost/hive_metastore?createDatabaseIfNotExist=true -Ddatanucleus.ConnectionUserName=root -Ddatanucleus.ConnectionPassword=warp123 -Ddatanucleus.Mapping=$HOME_ABS/dev/WARP-1019-hive-0.12.0-transwarp/src/metastore/src/model/package.jdo org.datanucleus.store.schema.SchemaTool -validate -v $HOME_ABS/dev/WARP-1019-hive-0.12.0-transwarp/src/metastore/src/model/package.jdo
