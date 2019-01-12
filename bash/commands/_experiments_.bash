
npm2svg() {
  npm ls --json "$@" | npx npm2dot | grep -v "undefined" | twopi -Tsvg -o out.svg -Goverlap=false
  open -a "Google Chrome" out.svg
}

title() {
  echo -ne "\033]0;"$*"\007"
}

plexco() {
  command plexco $?
}

waru() {
  fswatch "$@" -o | xargs -I% sh -c "${COMMAND:-make}; plexco \$?"
}

inet() {
  ifconfig | awk '/^[^\t]/ {interface=$1} $1 == "inet" {address=$2; print interface, address}' | column -t
}

minvim() {
  cat <<END
set hlsearch
set incsearch
set ignorecase
END
}

step() {
  mkdir "$@" && cd "$@"
}

glss() {
  gl "$HOME/Desktop/screenshots/"
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

