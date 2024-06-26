
alias l ll

abbr --add rsy "rsync -av --progress"
abbr --add pwgen "pwgen -cny 30"
alias R "R --quiet --no-save --no-restore"

abbr --add --position anywhere @u @{upstream}
abbr --add --position anywhere ..@u ..@{upstream}

alias nv nvim

#-------------------------------------------------

function serve
  set -l port 8000
  if test -n "$argv[1]"
    set port $argv[1]
  end
  python3 -m http.server $port
    or python -m SimpleHTTPServer $port
end

#-------------------------------------------------

function implode
  echo $PWD | fzf | read -l target
  if test -n "$target"
    cd ..
    rm -rf -v $target
  end
end

