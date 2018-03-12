alias tmux='tmux -2' 
alias tls='tmux ls' 
alias tat='tmux a -t' 
alias tns='tmux new-session -s'

alias msqld='mysqld_safe &'
alias msql='mysql -uroot -ppassword hive_metastore'
alias hbase='/usr/lib/hbase/bin/hbase shell'

alias tbsht='$SCRIPT_HOME/bashit.tmux.sh'
alias ticpt='$SCRIPT_HOME/inceptor.tmux.sh'
alias twtdp='$SCRIPT_HOME/waterdrop.tmux.sh'
alias tkdb='$SCRIPT_HOME/kundb.tmux.sh'

alias icv='iconv -f gbk -t utf-8'

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

alias svndiff='svn diff --diff-cmd=diff -x -U999999'
