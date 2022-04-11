export LC_ALL=en_US.UTF-8

# JAVA home
if [ $(uname) = "Darwin" ]; then
  export JAVA_HOME=`/usr/libexec/java_home`
elif [ $(uname) = "Linux" ]; then
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
fi

# GO path
export GOPATH=$HOME/dev/go

# CUDA
export PATH=/usr/local/cuda-11.1/bin:/usr/local/cuda-11.1/nsight-compute-2020.2.0:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-11.1/lib64:$LD_LIBRARY_PATH

# Languages
if [ $(uname) = "Darwin" ]; then
  export PATH=$JAVA_HOME:$JAVA_HOME/bin:$(go env GOPATH)/bin:$(go env GOROOT)/bin:/usr/local/bin:$PATH
elif [ $(uname) = "Linux" ]; then
  export PATH=$JAVA_HOME:$JAVA_HOME/bin:/usr/local/go/bin:/usr/local/bin:$PATH
fi

# My-SH
export PATH=$MY_SH_HOME/scripts/common:$MY_SH_HOME/scripts/$MY_SH_DOMAIN:$PATH

# Scratch
export SCRATCH=/scratch
