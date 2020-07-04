
# wrap `cd`, add behaviors
cd() {
  local dest="${@:-"$HOME"}"
  if [ -f "$dest" ]; then
    dest=$(dirname "$dest")
  fi
  builtin cd "$dest"
}

# HELPER -- generate the list of parent directories
parent_dirs() {
  local d="${1:-$PWD}"
  while true; do
    echo "$d"
    test "$d" = '/' && break
    d=${d:h}
  done
}

# pick from parent directories and cd into it
b() {
  local count=$1
  if [ -n "$count" ]; then
    count=$((count + 1))
  fi
  pick_with_vim "parent_dirs" "cd" $count
}

# pick from a list of directories (ls) and cd into it
cdl() {
  if [ -n "$1" ]; then
    cd "$1" || return
  fi
  pick_with_vim "ls" "cd"
}

