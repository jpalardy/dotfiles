
alias l ll

abbr --add --global rsy "rsync -av --progress"
alias pwgen "pwgen -cny 30"
alias R "R --quiet --no-save --no-restore"

abbr --add --global _a --set-cursor "awk '{print %}'"
abbr --add --global _t 'echo $CMD_DURATION'

alias h history

abbr --add --global reload! "source ~/.config/fish/config.fish"

abbr --add --global tm tmux

#-------------------------------------------------

function serve
  set -l port 8000
  if test -n "$argv[1]"
    set port $argv[1]
  end
  python3 -m http.server $port
    or python -m SimpleHTTPServer $port
end

