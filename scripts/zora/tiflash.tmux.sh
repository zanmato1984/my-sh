#!/bin/sh

tmux new-session -d -s tiflash -n storage
tmux send-keys "cd $HOME/dev/tiflash/storage" "C-m"

tmux new-window -n storage-run
tmux send-keys "cd $HOME/dev/tiflash/benchmark" "C-m"
tmux split-window
tmux send-keys "cd $HOME/dev/tiflash/benchmark" "C-m"
tmux select-pane -t 1

tmux new-window -n spark
tmux send-keys "cd $HOME/dev/tiflash/computing" "C-m"

tmux new-window -n spark-run
tmux send-keys "cd $HOME/dev/tiflash/computing" "C-m"

tmux new-window -n benchmark
tmux send-keys "cd $HOME/dev/tiflash/benchmark/sql-spark" "C-m"
tmux split-window
tmux send-keys "cd $HOME/dev/tiflash/benchmark" "C-m"

tmux new-window -n algernon
tmux send-keys "cd $HOME/dev/algernon" "C-m"
tmux split-window
tmux send-keys "cd $HOME/dev/algernon" "C-m"
tmux split-window -h
tmux send-keys "cd $HOME/dev/algernon/log" "C-m"
tmux select-pane -t 1
tmux split-window -h
tmux send-keys "cd $HOME/dev/algernon" "C-m"
tmux select-pane -t 1

tmux new-window -n tidb
tmux send-keys "cd $HOME/dev/algernon" "C-m"

tmux select-window -t 1
tmux a -t tiflash
