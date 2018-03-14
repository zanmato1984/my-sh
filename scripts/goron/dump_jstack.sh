#!/bin/bash

pid=jps | grep CoarseGrainedExecutorBackend | awk '{print $1}' 
echo "pid=$pid"
outdir=dump_jstack_out
if [ ! -n "$1" ] ;then    
else
  outdir=$1
fi
echo "outdir=$outdir"  

for i in {0..10} 
do 
  sudo -u yarn jstack ${pid} | tee run_${i}.log 
  sleep 1
done 
