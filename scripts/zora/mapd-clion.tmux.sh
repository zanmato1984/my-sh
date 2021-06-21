#!/bin/sh

tmux new-session -d -s mapd-clion -n clion
tmux send-keys "source /usr/local/mapd-deps/mapd-deps.sh" "C-m"
tmux send-keys "clion" "C-m"
