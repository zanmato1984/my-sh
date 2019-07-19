if [ $(uname) = "Darwin" ]; then
  export JAVA_HOME=`/usr/libexec/java_home`
  export GODEBUG=netdns=go
elif [ $(uname) = "Linux" ]; then
  export JAVA_HOME=/usr/lib/jvm/java-7-oracle
fi
# export SCALA_HOME=/usr/lib/scala-2.11.1
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/dev/go
export PATH=$MY_SH_HOME/scripts/common:$MY_SH_HOME/scripts/$MY_SH_DOMAIN:$JAVA_HOME:$JAVA_HOME/bin:$SCALA_HOME/bin:$MAVEN_HOME/bin:$(go env GOPATH)/bin:$GOROOT/bin:/usr/local/opt/llvm/bin:$PATH
