#!/bin/sh

tmux new-session -d -s tiflash -n algernon
tmux send-keys "cd $HOME/dev/algernon" "C-m" # Control
tmux split-window -h
tmux send-keys "cd $HOME/dev/algernon" "C-m" # Status
tmux send-keys "./status.sh" "C-m"
tmux split-window
tmux send-keys "cd $HOME/dev/algernon/log" "C-m" # Log 1
tmux split-window
tmux send-keys "cd $HOME/dev/algernon/log" "C-m" # Log 2
tmux select-pane -t 1
tmux split-window
tmux send-keys "cd $HOME/dev/algernon" "C-m" # Client
tmux select-pane -t 1

tmux new-window -n tiflash
tmux send-keys "cd $HOME/dev/tiflash" "C-m"

tmux select-window -t 1
tmux a -t tiflash
