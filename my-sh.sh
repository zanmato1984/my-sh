export LC_ALL=en_US.UTF-8

# JAVA home
if [ $(uname) = "Darwin" ]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
elif [ $(uname) = "Linux" ]; then
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
fi

# CUDA
export PATH=/usr/local/cuda-11.1/bin:/usr/local/cuda-11.1/nsight-compute-2020.2.0:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-11.1/lib64:$LD_LIBRARY_PATH

# Languages
if [ $(uname) = "Darwin" ]; then
  export PATH=$JAVA_HOME/bin:$PATH
elif [ $(uname) = "Linux" ]; then
  export PATH=$JAVA_HOME/bin:$PATH
fi

# Scratch
export SCRATCH=/scratch
