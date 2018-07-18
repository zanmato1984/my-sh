#!/bin/sh

tmux new-session -d -s binlog -n algernon
tmux send-keys "cd $HOME/dev/algernon" "C-m"
tmux split-window
tmux send-keys "cd $HOME/dev/algernon/data" "C-m"
tmux split-window -h
tmux send-keys "cd $HOME/dev/algernon/log" "C-m"
tmux select-pane -t 3

tmux new-window -n ch
tmux send-keys "cd $HOME/dev/theflash/benchmark" "C-m"
tmux split-window
tmux send-keys "cd $HOME/dev/theflash/benchmark" "C-m"
tmux select-pane -t 1

tmux new-window -n binlog
tmux send-keys "cd $GOPATH/src/github.com/pingcap/tidb-binlog" "C-m"
tmux split-window
tmux send-keys "cd $GOPATH/src/github.com/pingcap/tidb-binlog" "C-m"
tmux select-pane -t 1

tmux new-window -n cli
tmux send-keys "cd $HOME/dev/theflash/benchmark" "C-m"
tmux split-window
tmux send-keys "cd $HOME/dev/theflash/benchmark" "C-m"
tmux select-pane -t 1

tmux select-window -t 1
tmux a -t binlog
