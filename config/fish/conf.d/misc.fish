if status --is-interactive
  abbr --add --global im "iex -S mix"
  abbr --add --global go-lintall "golangci-lint run --enable-all -v --color=always"
  abbr --add --global vr vimrepl
  alias grep "grep -E --color=auto"
  abbr --add --global rsy "rsync -av --progress"
  alias pwgen "pwgen -cny 30"
  alias R "R --quiet --no-save --no-restore"

  function serve
    set -l port 8000
    if test -n "$argv[1]"
      set port $argv[1]
    end
    python3 -m http.server $port
      or python -m SimpleHTTPServer $port
  end

  bind \e` 'commandline -i "($history[1])"'
  bind \ew 'warp'
  bind \eg '__fish_grep'

  function h
    if test (count $argv) = 0
      history
      return
    end
    history | rg $argv
  end
end
