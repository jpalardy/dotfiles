
alias tls='tmux list-sessions'

tmux2vim() {
  tmux capture-pane
  tmux show-buffer | vim -c "set buftype=nofile" -
}

