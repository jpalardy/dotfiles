
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
  cd $(
    local p=$PWD
    while [ $p != "/" ]; do
      echo $p
      p=${p:h}
    done | fzf
  )
}

# pick from a list of directories (ls) and cd into it
cdl() {
  if [ -n "$1" ]; then
    cd "$1" || return
  fi
  pick_with_vim "ls" "cd"
}

# pick from a list of files (recursively) and cd into it
cdf() {
  pick_with_vim "ff" "cd"
}

