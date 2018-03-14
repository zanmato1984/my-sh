#!/bin/sh

tmux new-session -d -s kundb -n kundb
tmux send-keys 'cd $GOPATH/src/github.com/youtube/vitess' 'C-m'

tmux new-window -n zk-vtctld
tmux send-keys 'cd $GOPATH/src/github.com/youtube/vitess/examples/local' 'C-m'
tmux split-window -v
tmux send-keys 'cd $GOPATH/src/github.com/youtube/vitess/examples/local' 'C-m'
tmux select-pane -t 1

tmux new-window -n vtgate-vttablet
tmux send-keys 'cd $GOPATH/src/github.com/youtube/vitess/examples/local' 'C-m'
tmux split-window -v
tmux send-keys 'cd $GOPATH/src/github.com/youtube/vitess/examples/local' 'C-m'
tmux select-pane -t 1

tmux new-window -n client
tmux send-keys 'cd $GOPATH/src/github.com/youtube/vitess/examples/local' 'C-m'

tmux new-window -n data
tmux send-keys 'cd $VTDATAROOT' 'C-m'

tmux select-window -t 1
tmux -2 a -t kundb
