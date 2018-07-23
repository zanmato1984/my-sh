#!/bin/sh

tmux new-session -d -s flash -n storage
tmux send-keys "cd $HOME/dev/theflash/storage" "C-m"

tmux new-window -n storage-run
tmux send-keys "cd $HOME/dev/theflash/benchmark" "C-m"
tmux split-window
tmux send-keys "cd $HOME/dev/theflash/benchmark" "C-m"
tmux select-pane -t 1

tmux new-window -n spark
tmux send-keys "cd $HOME/dev/theflash/computing" "C-m"

tmux new-window -n spark-run
tmux send-keys "cd $HOME/dev/theflash/computing" "C-m"

tmux new-window -n benchmark
tmux send-keys "cd $HOME/dev/theflash/benchmark/sql-spark" "C-m"
tmux split-window
tmux send-keys "cd $HOME/dev/theflash/benchmark" "C-m"

tmux select-window -t 1
tmux a -t flash
