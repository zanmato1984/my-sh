if [ $(uname) = "Darwin" ]; then
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home
  export JAVA_VERSION=7
  export MAVEN_HOME=/opt/apache-maven-3.3.3
  export GOROOT=/usr/local/opt/go/libexec
  export GODEBUG=netdns=go
elif [ $(uname) = "Linux" ]; then
  export JAVA_HOME=/usr/lib/jvm/java-7-oracle
  export JAVA_VERSION=7
  export MAVEN_HOME=/opt/apache-maven-3.3.3
  export GOROOT=/usr/local/go
fi
#TODO
export SCRIPT_HOME=$BASH_IT/script
export SCALA_HOME=/usr/lib/scala-2.11.1
export GOPATH=$HOME/dev/go
export GOROOT=/usr/local/go
export PATH=$JAVA_HOME:$JAVA_HOME/bin:$SCALA_HOME/bin:$MAVEN_HOME/bin:$(go env GOPATH)/bin:$GOROOT/bin:$SCRIPT_HOME:$PATH
