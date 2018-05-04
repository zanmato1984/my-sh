#!/bin/sh

tmux new-session -d -s flash -n ch
tmux send-keys "cd $HOME/dev/theflash/ch-connector" "C-m"

tmux new-window -n ch-run
tmux send-keys "cd $HOME/dev/theflash/benchmark" "C-m"
tmux split-window
tmux send-keys "cd $HOME/dev/theflash/benchmark" "C-m"
tmux select-pane -t 1

tmux new-window -n spark
tmux send-keys "cd $HOME/dev/theflash/spark-connector" "C-m"

tmux new-window -n spark-debug
tmux send-keys "cd $HOME/dev/theflash/benchmark/sql-spark" "C-m"
tmux split-window
tmux send-keys "cd $HOME/dev/theflash/benchmark" "C-m"

tmux select-window -t 1
tmux a -t flash
