#!/bin/sh

tmux new-session -d -s waterdrop -n sqlparser4j
tmux send-keys 'cd dev/sqlparser4j' 'C-m'

tmux new-window -n hive
tmux send-keys 'ghv' 'C-m'

tmux new-window -n formatter
tmux send-keys 'cd dev/inceptor-formatter' 'C-m'

tmux new-window -n inceptor-sqlparser4j
tmux send-keys 'cd dev/inceptor-sqlparser4j' 'C-m'

tmux new-window -n sdk
tmux send-keys 'cd dev/inceptor-sdk' 'C-m'

tmux new-window -n repo
tmux send-keys 'cd dev/waterdrop/product/localRepository' 'C-m'
tmux split-window -v
tmux send-keys 'cd dev/waterdrop/product/localRepository' 'C-m'
tmux select-pane -t 1

tmux new-window -n waterdrop
tmux send-keys 'cd dev/waterdrop' 'C-m'

tmux select-window -t 1
tmux -2 a -t waterdrop
