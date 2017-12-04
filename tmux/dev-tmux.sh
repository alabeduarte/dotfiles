#!/bin/bash

tmux new-session -d

# horizontal split with 15%
tmux split-window -h -p 15

tmux new-window 'dev'
tmux -2 attach-session -d
