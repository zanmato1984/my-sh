#!/bin/sh

tmux new-session -d -s mapd -n scratch
tmux send-keys "cd $HOME/dev/omniscidb/build" "C-m"
tmux split-window
tmux send-keys "cd $HOME/dev/omniscidb/build" "C-m"
tmux select-pane -t 1

tmux new-window -n mapd
tmux send-keys "cd $HOME/dev/omniscidb" "C-m"

tmux new-window -n ClickHouse
tmux send-keys "cd $HOME/dev/ClickHouse" "C-m"

tmux select-window -t 1
tmux a -t mapd
