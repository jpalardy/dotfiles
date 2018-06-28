
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

