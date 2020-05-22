
# wrap `cd`, add behaviors
cd() {
  local dest="${@:-"$HOME"}"
  if [ -f "$dest" ]; then
    dest=$(dirname "$dest")
  fi

  builtin cd "$dest" || return
  local result=$?

  echo "${ATTR_RESET}${PATH_COLOR}-> $PWD$(__git_ps1)${ATTR_RESET}"

  return $result
}

#-------------------------------------------------

# HELPER -- generate the list of parent directories
parent_dirs() {
  local path="${1:-$PWD}"

  while [ "$path" != "/" ]; do
    echo "$path"
    path=$(dirname "$path")
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

#-------------------------------------------------

# pick from a list of directories (ls) and cd into it
cdl() {
  if [ -n "$1" ]; then
    cd "$1" || return
  fi
  pick_with_vim "ls" "cd"
}

# pick from a find
fcd() {
  pick_with_vim "find ${1:-.}" "cd"
}

