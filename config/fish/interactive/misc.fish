
alias l ll

abbr --add rsy "rsync -av --progress"
abbr --add pwgen "pwgen -cny 30"
alias R "R --quiet --no-save --no-restore"

abbr --add --position anywhere @u @{upstream}
abbr --add --position anywhere ..@u ..@{upstream}

abbr --add nv  nvim
abbr --add nvi nvim

abbr --add nwst --set-cursor 'ls -t % | head -n1'
abbr --add untilfail --set-cursor 'while %; end'

abbr --add 1pl 'printf "%s\n"'

abbr --add awk_ --set-cursor "awk '{ print % }'"

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

