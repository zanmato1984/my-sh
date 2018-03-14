#!/bin/sh

tmux new-session -d -s bashit -n bashit
tmux send-keys 'gbsht' 'C-m'

tmux new-window -n aliases
tmux send-keys 'gbsht; cd aliases/available' 'C-m'

tmux new-window -n plugins
tmux send-keys 'gbsht; cd plugins/available' 'C-m'

tmux new-window -n rc
tmux send-keys 'gbsht; cd rc' 'C-m'

tmux new-window -n script
tmux send-keys 'gbsht; cd script' 'C-m'

tmux select-window -t 1
tmux -2 a -t bashit
