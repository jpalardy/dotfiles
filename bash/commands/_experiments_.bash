
npm2svg() {
  npm ls --json "$@" | npx npm2dot | grep -v "undefined" | twopi -Tsvg -o out.svg -Goverlap=false
  open -a "Google Chrome" out.svg
}

title() {
  echo -ne "\033]0;"$*"\007"
}

hf() {
  local maxLines=$(($(tput lines) - 2))
  head -n $maxLines "$@"
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

