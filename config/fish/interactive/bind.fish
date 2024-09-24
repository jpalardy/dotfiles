
function fzf-warp
  set -l config "$HOME/.lists/warp"
  fzf < $config | read -l result
  and commandline -- "ssh $result"
  commandline -f repaint
end

# esc-w
bind \ew fzf-warp

# -------------------------------------------------

function fzf-date
  printf "%s\n" (date +%F) (date +%s) | fzf | read -l result
  and commandline -i $result
  commandline -f repaint
end

# esc-t
bind \et fzf-date

# -------------------------------------------------

# esc-h
bind \eh 'commandline -r "vim -c \"normal h\""; commandline -f execute'

# esc-`
bind \e` 'commandline -i "\$($history[1])"'

# esc-_ -- open rg results in vim
bind \e_ 'commandline -r "vim -q \$($history[1] --vimgrep | psub)"; commandline -f execute'

# esc-,
bind \e, fzf-contextual

