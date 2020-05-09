#!/bin/sh

tmux new-session -d -s cudf-clion -n clion
tmux send-keys "clion" "C-m"
