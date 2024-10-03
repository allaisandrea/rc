#!/bin/bash

session="coding"

session_exists=$(tmux list-sessions | grep $session)

if [ "$session_exists" != "" ]; then
  echo "Session $session already exists. Attaching..."
  tmux attach -t $session
  exit
fi

tmux new-session -d -s $session
tmux rename-window -t $session:0 'dirt-vim'
tmux send-keys -t 'dirt-vim' 'cd ~/dirt' C-m 'clear' C-m 'vim' C-m
tmux new-window -n 'dirt-console' -t $session:1
tmux send-keys -t 'dirt-console' 'cd ~/dirt' C-m 'clear' C-m
tmux new-window -n 'dirt1-vim' -t $session:2
tmux send-keys -t 'dirt1-vim' 'cd ~/dirt1' C-m 'clear' C-m 'vim' C-m
tmux new-window -n 'dirt1-console' -t $session:3
tmux send-keys -t 'dirt1-console' 'cd ~/dirt1' C-m 'clear' C-m
tmux attach -t $session:0
