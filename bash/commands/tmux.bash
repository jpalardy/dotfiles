
alias tls='tmux list-sessions'
alias tma='tmux attach-session -t'

if [ -n "$TMUX_PANE" ]; then
  echo TMUX_PANE: "$TMUX_PANE"
fi

