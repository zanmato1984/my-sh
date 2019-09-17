#!/bin/sh

tmux new-session -d -s tiflash -n algernon
tmux send-keys "cd $HOME/dev/algernon" "C-m"
tmux split-window
tmux send-keys "cd $HOME/dev/algernon/log" "C-m"
tmux split-window -h
tmux send-keys "cd $HOME/dev/algernon/log" "C-m"
tmux select-pane -t 1
tmux split-window -h
tmux send-keys "cd $HOME/dev/algernon" "C-m"
tmux select-pane -t 1

tmux new-window -n client
tmux send-keys "cd $HOME/dev/algernon" "C-m"
tmux split-window -h
tmux send-keys "cd $HOME/dev/tiflash/storage" "C-m"
tmux select-pane -t 1

tmux new-window -n ch
tmux send-keys "cd $HOME/dev/tiflash/storage/ch" "C-m"
tmux split-window
tmux send-keys "cd $HOME/dev/tiflash/storage/ch/tests" "C-m"
tmux select-pane -t 1

tmux new-window -n storage
tmux send-keys "cd $HOME/dev/tiflash/storage" "C-m"

tmux new-window -n chspark
tmux send-keys "cd $HOME/dev/tiflash/computing/chspark" "C-m"

tmux new-window -n computing
tmux send-keys "cd $HOME/dev/tiflash/computing" "C-m"

tmux new-window -n tiflash
tmux send-keys "cd $HOME/dev/tiflash" "C-m"
tmux split-window
tmux send-keys "cd $HOME/dev/tiflash/tests" "C-m"
tmux select-pane -t 1

tmux select-window -t 1
tmux a -t tiflash
