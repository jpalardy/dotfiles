
plexco() {
  command plexco $?
}

waru() {
  fswatch "$@" -o | xargs -I% sh -c "${COMMAND:-make}; plexco \$?"
}

inet() {
  if command -v ip > /dev/null; then
    ip addr | grep --color -E 'inet[^6].*|$'
  else
    ifconfig | grep --color -E 'inet[^6].*|$'
  fi
}

# 2019-01-12
HOME() {
  if [ "$1" == "-f" ]; then
    rm -f ~/.HOME
    shift
  fi
  if [ ! -f ~/.HOME ]; then
    find ~ 2>/dev/null | tee ~/.HOME | rg "$@"
    return
  fi
  rg -N "${@:-" "}" ~/.HOME
}

# 2019-01-24
implode() {
  local target="$PWD"
  local code
  code=$(seq 0 9 | shuf -r -n 4 | awk '{printf "%s", $0}')
  read -r -p "$code: delete $target ? " input
  if [ "$input" != "$code" ]; then
    return
  fi
  cd ..
  rm -rf "$target"
}

# 2019-04-13
bootstrap() {
  echo "curl https://home.jpalardy.com/bootstrap/setup.bash"
}

# 2019-09-19
fzrepl () {
  fzf --print-query --preview="$1" --preview-window='up:99%' < /dev/null
}

# 2019-11-30
function title {
  echo -ne "\033]0;"$*"\007"
}

# 2020-02-04
brew-bins() {
  brew ls -v "$1" | grep -w bin
}
complete -W "$(brew ls)" brew-bins

