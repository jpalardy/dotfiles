
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

waru() {
  local good="/System/Library/Sounds/Purr.aiff"
  local bad="/System/Library/Sounds/Basso.aiff"
  fswatch "$@" -o | xargs -I% sh -c "${COMMAND:-make}; if [ \$? -eq 0 ]; then afplay $good; else afplay $bad; fi"
}

