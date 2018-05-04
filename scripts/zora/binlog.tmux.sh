#!/bin/sh

tmux new-session -d -s binlog -n server
tmux send-keys "cd $GOPATH/src/github.com/pingcap/pd" "C-m"
tmux split-window -h
tmux send-keys "cd $HOME/dev/tikv" "C-m"
tmux select-pane -t 1
tmux split-window
tmux send-keys "cd $GOPATH/src/github.com/pingcap/tidb" "C-m"
tmux select-pane -t 3
tmux split-window
tmux send-keys "cd $HOME/dev/theflash/benchmark" "C-m"
tmux select-pane -t 1

tmux new-window -n binlog
tmux send-keys "cd $GOPATH/src/github.com/pingcap/tidb-binlog" "C-m"
tmux split-window
tmux send-keys "cd $GOPATH/src/github.com/pingcap/tidb-binlog" "C-m"
tmux select-pane -t 1

tmux new-window -n cli
tmux split-window
tmux send-keys "cd $HOME/dev/theflash/benchmark" "C-m"
tmux select-pane -t 1

tmux select-window -t 1
tmux a -t binlog
