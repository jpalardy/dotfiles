
# wrap `cd`, add behaviors
cd() {
  local dest="${@:-"$HOME"}"
  if [ -f "$dest" ]; then
    dest=${dest:h}
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

cdl() {
  run-not-blank cd $(ls | fzf -q "$1")
}

cdf() {
  run-not-blank cd $(ff | fzf -q "$1")
}

run-not-blank() {
  if [ $# -lt 2 ]; then
    return
  fi
  "$@"
}
