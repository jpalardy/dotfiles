abbr --add --global go-lintall "golangci-lint run --enable-all -v --color=always"
abbr --add --global vr vimrepl
abbr --add --global rsy "rsync -av --progress"
alias pwgen "pwgen -cny 30"
alias R "R --quiet --no-save --no-restore"

abbr --add --global reload! "source ~/.config/fish/config.fish"

alias tls "tmux list-sessions"

#-------------------------------------------------

function serve
  set -l port 8000
  if test -n "$argv[1]"
    set port $argv[1]
  end
  python3 -m http.server $port
    or python -m SimpleHTTPServer $port
end

