if [ $(uname) = "Darwin" ]; then
  export JAVA_HOME=/usr/local/opt/openjdk
elif [ $(uname) = "Linux" ]; then
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
fi

export GOPATH=$HOME/dev/go

export LC_ALL=en_US.UTF-8

# CUDA
export PATH=/usr/local/cuda-10.2/bin:/usr/local/cuda-10.2/nsight-compute-2019.5.0${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# Languages
export PATH=$JAVA_HOME:$JAVA_HOME/bin:$(go env GOPATH)/bin:$(go env GOROOT)/bin:/usr/local/bin:$PATH

# My-SH
export PATH=$MY_SH_HOME/scripts/common:$MY_SH_HOME/scripts/$MY_SH_DOMAIN:$PATH
