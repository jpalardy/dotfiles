
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

# 2021-02-15 -- with fzf's ctrl-r, maybe this isn't needed anymore
# # up/down history search
# autoload -U history-search-end
# zle -N history-beginning-search-forward-end history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# bindkey '^[[A' history-beginning-search-backward-end
# bindkey '^[[B' history-beginning-search-forward-end

