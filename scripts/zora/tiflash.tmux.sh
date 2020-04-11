#!/bin/sh

tmux new-session -d -s tiflash -n algernon
tmux send-keys "cd $HOME/dev/algernon" "C-m" # Control
tmux split-window -h
tmux send-keys "cd $HOME/dev/algernon" "C-m" # Status
tmux split-window
tmux send-keys "cd $HOME/dev/algernon/log" "C-m" # Log 1
tmux split-window
tmux send-keys "cd $HOME/dev/algernon/log" "C-m" # Log 2
tmux select-pane -t 1
tmux split-window
tmux send-keys "cd $HOME/dev/algernon" "C-m" # Client
tmux select-pane -t 1

tmux new-window -n tics
tmux send-keys "cd $HOME/dev/tics" "C-m"
tmux split-window
tmux send-keys "cd $HOME/dev/tics/tests" "C-m"
tmux select-pane -t 1

tmux new-window -n tiflash
tmux send-keys "cd $HOME/dev/tiflash" "C-m"
tmux split-window
tmux send-keys "cd $HOME/dev/tiflash/tests" "C-m"
tmux select-pane -t 1

tmux select-window -t 1
tmux a -t tiflash
