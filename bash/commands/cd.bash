
_pwd() {
  echo "${ATTR_RESET}${PATH_COLOR}-> $PWD$(__git_ps1)${ATTR_RESET}"
}

# replacement for 'cd'
better_cd() {
  local dest="${@:-"$HOME"}"

  if [ -f "$dest" ]; then
    dest=$(dirname "$dest")
  fi

  builtin cd "$dest"
  local result=$?

  _pwd

  return $result
}

# overwrites behavior of 'cd'
cd() {
  better_cd "$@"
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
    count=$(($count + 1))
  fi

  pick_with_vim "parent_dirs" "cd" $count
}

#-------------------------------------------------

# pick from a list of directories (recursive) and cd into it
cdf() {
  pick_with_vim "ack_find" "cd"
}

