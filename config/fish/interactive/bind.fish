
function fzf-warp
  set -l config "$HOME/.lists/warp"
  fzf < $config | read -l result
  and commandline -- "ssh $result"
  commandline -f repaint
end

bind escape,w fzf-warp

# -------------------------------------------------

# open vim, with esc-h
bind escape,h 'commandline -r "vim -c FPScratchyH"; commandline -f execute'

# insert last command-line $(...)
bind escape,` 'commandline -i "\$($history[1])"'

# open rg results in vim
bind escape,minus 'commandline -r "vim -q \$($history[1] --vimgrep | psub)"; commandline -f execute'

bind escape,comma fzf-contextual

