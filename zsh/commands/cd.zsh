
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
  run-not-blank cd $(
    local p=$PWD
    while [ $p != "/" ]; do
      echo $p
      p=${p:h}
    done | fzf
  )
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
  run-not-blank cd $(ls | fzf -q "$1")
}
alias cdl="cdlz"

# pick from a list of files (recursively) and cd into it
cdfv() {
  pick_with_vim "ff" "cd"
}
# fzf variant
cdfz() {
  run-not-blank cd $(ff | fzf -q "$1")
}
alias cdf="cdfz"

run-not-blank() {
  if [ $# -lt 2 ]; then
    return
  fi
  "$@"
}
