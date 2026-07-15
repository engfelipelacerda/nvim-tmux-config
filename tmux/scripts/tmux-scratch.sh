#!/bin/bash

session="_popup_scratchpad"

if ! tmux has -t "$session" 2>/dev/null; then
  session="$(tmux new-session -dP -s "$session" -F '#{session_id}')"
fi

tmux set-option -t "$session" key-table popup
tmux set-option -t "$session" status off
tmux set-option -t "$session" prefix None

exec tmux attach -t "$session"
