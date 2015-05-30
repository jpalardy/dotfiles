
alias tls='tmux list-sessions'
alias tma='tmux attach-session -t'

tp() {
  echo -n $TMUX_PANE | tee $HOME/.target_pane
  echo
}

