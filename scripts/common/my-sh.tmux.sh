#!/bin/sh

tmux new-session -d -s my-sh -n my-sh
tmux send-keys "cd $MY_SH_HOME" "C-m"
tmux split-window -h
tmux send-keys "cd $MY_SH_HOME" "C-m"
tmux select-pane -t 1
tmux split-window -v
tmux send-keys "cd $MY_SH_HOME/oh-my-zsh" "C-m"
tmux select-pane -t 3
tmux split-window -v
tmux send-keys "cd $MY_SH_HOME/bash-it" "C-m"
tmux select-pane -t 1

tmux new-window -n oh-my-zsh
tmux send-keys "cd ~/.oh-my-zsh" "C-m"
tmux split-window -v
tmux send-keys "cd" "C-m"
tmux select-pane -t 1

tmux new-window -n bash-it
tmux send-keys "cd ~/.bash_it" "C-m"
tmux split-window -v
tmux send-keys "cd" "C-m"
tmux select-pane -t 1

tmux new-window -n scripts
tmux send-keys "cd $MY_SH_HOME/scripts" "C-m"

tmux select-window -t 1
tmux a -t my-sh
