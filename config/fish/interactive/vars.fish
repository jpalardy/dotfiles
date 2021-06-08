
if set -q TMUX
  set -x TERM "screen-256color"
else
  set -x TERM "xterm-256color"
end

