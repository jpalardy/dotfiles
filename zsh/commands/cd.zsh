
# wrap `cd`, add behaviors
cd() {
  local dest="${@:-"$HOME"}"
  if [ "$dest" = "_" ]; then
    cd_ "$dest"
    return
  fi
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

# cd .. until a .git directory is found
cd_() {
  local p=$PWD
  while [ $p != "/" ]; do
    if [ -d "$p/.git" ]; then
      cd "$p"
      break
    fi
    p=${p:h}
  done
}

cdl() {
  run-not-blank cd $(ls | fzf -q "$1")
}

run-not-blank() {
  if [ $# -lt 2 ]; then
    return
  fi
  "$@"
}
