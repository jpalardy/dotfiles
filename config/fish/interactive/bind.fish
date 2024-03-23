
function fzf-warp
  set -l config "$HOME/.lists/warp"
  fzf < $config | read -l result
  and commandline -- "ssh $result"
  commandline -f repaint
end

# esc-w
bind \ew fzf-warp

# -------------------------------------------------

# esc-h
bind \eh 'commandline -r "vim -c \"normal h\""; commandline -f execute'

# esc-`
bind \e` 'commandline -i "\$($history[1])"'

# ctrl-_ -- open rg results in vim
bind \c_ 'commandline -r "vim -q \$($history[1] --vimgrep | psub)"; commandline -f execute'

# esc-,
bind \e, fzf-contextual

