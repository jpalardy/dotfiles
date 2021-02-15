
# 2021-01-28
# reset -- if sourced multiple times
unalias tcd 2>/dev/null
tcd() {
  tmux capture-pane -b temp-capture-buffer "$@"
  tmux save-buffer -b temp-capture-buffer -
  tmux delete-buffer -b capture-buffer
}
alias tcd="tcd -t {last}"

# 2021-02-09
alias dead-links='find . -xtype l'

