#!/bin/sh

tmux new-session -d -s cudf -n scratch
tmux send-keys "cd $HOME/dev/scratch" "C-m"
tmux split-window
tmux send-keys "cd $HOME/dev/scratch" "C-m"
tmux select-pane -t 1

tmux new-window -n ClickHouse
tmux send-keys "cd $HOME/dev/ClickHouse" "C-m"

tmux new-window -n cudf
tmux send-keys "cd $HOME/dev/cudf" "C-m"

tmux select-window -t 1
tmux a -t cudf
