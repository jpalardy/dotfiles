
# wrap `cd`, add behaviors
cd() {
  local dest="${@:-"$HOME"}"
  if [ -f "$dest" ]; then
    dest=$(dirname "$dest")
  fi
  builtin cd "$dest"
}

# go back n times
b() {
  repeat ${1:-1}; cd ..
}

# pick parent with fzf
bu() {
  local selection=""
  selection=$(
    local p=$PWD
    while [ $p != "/" ]; do
      echo $p
      p=${p:h}
    done | fzf
  )
  if [ "$selection" != "" ]; then
    cd "$selection"
  fi
}

# pick from a list of directories (ls) and cd into it
cdlv() {
  if [ -n "$1" ]; then
    cd "$1" || return
  fi
  pick_with_vim "ls" "cd"
}
# fzf variant
cdlz() {
  local selection=""
  selection=$(ls | fzf -q "$1")
  if [ "$selection" != "" ]; then
    cd "$selection"
  fi
}
alias cdl="cdlz"

# pick from a list of files (recursively) and cd into it
cdfv() {
  pick_with_vim "ff" "cd"
}
# fzf variant
cdfz() {
  local selection=""
  selection=$(ff | fzf -q "$1")
  if [ "$selection" != "" ]; then
    cd "$selection"
  fi
}
alias cdf="cdfz"

