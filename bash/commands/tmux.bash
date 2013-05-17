
alias tls='tmux list-sessions'
alias tas='tmux attach-session -t'

tmux2vim() {
  tmux capture-pane
  tmux show-buffer | vim -c "set buftype=nofile" -
}

