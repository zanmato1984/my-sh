export DEVROOT=$HOME/.devroot
if [ "$JAVA_VERSION" = "8" ]; then
  export MAVEN_OPTS="-Xmx8192m"
else
  export MAVEN_OPTS="-Xmx8192m -XX:MaxPermSize=2048m"
fi

# Inceptor
export HIVEROOT=hive-0.12.0-transwarp
export NGMRROOT=ngmr-1.7-transwarp
export INCEPTORIDEAROOT=inceptor_idea
export POOIQWRKNV_JKLJFWPEO_DFQQWE_LBIERPL_MDCJKD_NOT_RECOMMANDED=true
export INCEPTOR_SERVER=localhost

export SVN_ROOT=https://172.16.1.168/transwarp
export HIVE_TR=$SVN_ROOT/trunk/hadoop/sources/hive-0.12.0-transwarp
export NGMR_TR=$SVN_ROOT/trunk/hadoop/sources/ngmr-1.7-transwarp
export INCEPTOR_TR=$SVN_ROOT/trunk/hadoop/sources/inceptor_idea

# KunDB
export MYSQL_FLAVOR=MySQL56
if [ $(uname) = "Darwin" ]; then
  export VT_MYSQL_ROOT=/usr/local/opt/mysql56
fi
export VTROOT=$HOME/dev/go
export VTDATAROOT=$HOME/dev/go/vtdataroot

# Inceptor Scripts
alias rfricpt='touch $DEVROOT/$NGMRROOT/inceptor/target/scala-2.10/inceptor_2.10-1.1.0-transwarp.jar'
alias smst='$DEVROOT/$INCEPTORIDEAROOT/bin/start_hive.sh org.apache.hadoop.hive.metastore.HiveMetaStore &'
alias scldr='$DEVROOT/$INCEPTORIDEAROOT/bin/start_hive.sh org.apache.hadoop.hive.cli.CliDriver -N'
alias scldrm='$DEVROOT/$INCEPTORIDEAROOT/bin/start_hive.sh org.apache.hadoop.hive.cli.CliDriver -N --transwarpconf hive.metastore.uris=thrift://localhost:9083'
alias shsv='$DEVROOT/$INCEPTORIDEAROOT/bin/start_hive.sh io.transwarp.ngmr.NgmrServer &'
alias shsvm='$DEVROOT/$INCEPTORIDEAROOT/bin/start_hive.sh io.transwarp.ngmr.NgmrServer --hiveconf hive.metastore.uris=thrift://localhost:9083 &'
alias scldrr='$DEVROOT/$INCEPTORIDEAROOT/bin/start_hive.sh org.apache.hadoop.hive.cli.CliDriver -N -h localhost'
alias sbl='$DEVROOT/$INCEPTORIDEAROOT/bin/start_hive.sh org.apache.hive.beeline.BeeLine -u jdbc:hive://localhost:10000/default'
alias shsv2='$DEVROOT/$INCEPTORIDEAROOT/bin/start_hive.sh io.transwarp.inceptor.InceptorServer2 &'
alias shsv2m='$DEVROOT/$INCEPTORIDEAROOT/bin/start_hive.sh io.transwarp.inceptor.InceptorServer2 --hiveconf hive.metastore.uris=thrift://localhost:9083 &'
alias sbl2='$DEVROOT/$INCEPTORIDEAROOT/bin/start_hive.sh org.apache.hive.beeline.BeeLine -u jdbc:hive2://localhost:10000/default -n zhu -p 123456'
alias player='java -cp $HOME/dev/player/build/libs/player-1.0-all.jar io.transwarp.qa.player.SuiteRunner'
alias avro='java -cp $HOME/dev/player/build/libs/player-1.0-all.jar io.transwarp.qa.tools.AvroReader'

alias sall='$SCRIPT_HOME/start_all.sh'

alias scpinst='$SCRIPT_HOME/scp_install.sh'

alias updtrp='$SCRIPT_HOME/update_repo.sh'

# Locations
alias gdev='cd $DEVROOT'
alias gbsht='cd $BASH_IT'
alias ghv='cd $DEVROOT/$HIVEROOT/src'
alias gngmr='cd $DEVROOT/$NGMRROOT'

# Commands
alias msqld='mysqld_safe &'
alias msql='mysql -uroot -ppassword hive_metastore'
alias hbase='/usr/lib/hbase/bin/hbase shell'

alias tbsht='bashit.tmux.sh'
alias ticpt='inceptor.tmux.sh'
alias twtdp='waterdrop.tmux.sh'
alias tkdb='kundb.tmux.sh'

alias clhbs='rm -rf ~/.m2/repository/org/apache/hbase ~/.ivy2/cache/org.apache.hbase'
alias clhv='rm -rf ~/.m2/repository/org/apache/hive ~/.ivy2/local/org.apache.hive ~/.ivy2/local/org.apache.hive.shims ~/.ivy2/cache/org.apache.hive ~/.ivy2/cache/org.apache.hive.shims'
alias clspk='rm -rf ~/.m2/repository/org/apache/spark ~/.ivy2/local/org.apache.spark ~/.ivy2/cache/org.apache.spark'

alias rbdgrm='mvn clean org.antlr:antlr3-maven-plugin:3.4:antlr 2>&1 | tee ../grammar.log'
alias bdhv='mvn install -DskipTests -Pidea'
alias rbdhv='mvn clean install -DskipTests -Pidea'

alias bdspk='mvn install -DskipTests -Pyarn -Pidea'
alias rbdspk='mvn clean install -DskipTests -Pyarn -Pidea'

alias bdidbc='mvn install -DskipTests -Pidea'
alias rbdidbc='mvn clean install -DskipTests -Pidea'

alias bdicpt='mvn install -Dmaven.test.skip=true -Pidea -Pbonfire'
alias rbdicpt='mvn clean install -Dmaven.test.skip=true -Pidea -Pbonfire'

alias bdhvsdk='mvn install -DskipTests -Psdk -pl \!hbase-handler,\!service'

alias plt='$SCRIPT_HOME/plt.sh'

alias insthv='rm -rf $DEVROOT/precheck/jar/hive/*; cp `find $DEVROOT/$HIVEROOT/src -name "hive*jar" | grep -v "tests.jar"` $DEVROOT/precheck/jar/hive/'
alias instspk='rm -rf $DEVROOT/precheck/jar/spark/*; cp $DEVROOT/$NGMRROOT/spark/core/target/scala-2.10/spark-core_2.10-1.1.0-transwarp.jar $DEVROOT/precheck/jar/spark/ngmr-core_2.10-1.1.0-transwarp.jar; cp $DEVROOT/$NGMRROOT/spark/holodesk/target/scala-2.10/spark-holodesk_2.10-1.1.0-transwarp.jar $DEVROOT/precheck/jar/spark/ngmr-holodesk_2.10-1.1.0-transwarp.jar'
alias instidbc='rm -rf $DEVROOT/precheck/jar/idbc/*; cp $DEVROOT/$NGMRROOT/idbc/core/target/scala-2.10/idbc-core-1.0.0-transwarp.jar $DEVROOT/$NGMRROOT/idbc/hyperdrive/target/scala-2.10/hyperdrive-1.0.0-transwarp.jar $DEVROOT/$NGMRROOT/idbc/jdbc/target/scala-2.10/jdbcdrive-1.0.0-transwarp.jar $DEVROOT/precheck/jar/idbc/'
alias insticpt='rm -rf $DEVROOT/precheck/jar/inceptor/*; cp $DEVROOT/$NGMRROOT/inceptor/target/scala-2.10/inceptor_2.10-1.1.0-transwarp.jar $DEVROOT/precheck/jar/inceptor/ngmr-shell_2.10-1.1.0-transwarp.jar'
