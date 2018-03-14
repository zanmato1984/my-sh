#!/bin/sh

tmux new-session -d -s inceptor -n hive
tmux send-keys 'ghv' 'C-m'

tmux new-window -n ngmr
tmux send-keys 'gngmr; cd spark' 'C-m'
tmux split-window -h
tmux send-keys 'gngmr; cd idbc' 'C-m'
tmux select-pane -t 1
tmux split-window -v
tmux send-keys 'gngmr' 'C-m'
tmux select-pane -t 3
tmux split-window -v
tmux send-keys 'gngmr; cd inceptor' 'C-m'
tmux select-pane -t 2

tmux new-window -n inceptor_idea
tmux send-keys 'gdev; cd inceptor_idea' 'C-m'

tmux new-window -n mysql
tmux send-keys 'msql' 'C-m'

tmux new-window -n run
tmux send-keys 'gdev; cd inceptor_idea/sql' 'C-m'
tmux split-window -v
tmux send-keys 'gdev; cd inceptor_idea' 'C-m'

tmux new-window -n ut
tmux send-keys 'ghv; cd sqlUnitTest' 'C-m'
tmux split-window -v
tmux send-keys 'cd dev/player' 'C-m'

tmux select-window -t 5
tmux select-pane -t 2
tmux -2 a -t inceptor
