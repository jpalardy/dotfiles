
#-------------------------------------------------

# replacement for 'cd'
cd_pushd() {
  local dest=${1:-"$HOME"}
  if [ -f "$dest" ]; then
    dest=$(dirname $dest)
  fi

  builtin cd "$dest"
  local result=$?

  if [ $result == "0" ]; then
    echo $PWD >> $HOME/.dirs
  fi

  return $result
}

# overwrites behavior of 'cd'
cd() {
  cd_pushd "$@"
}

#-------------------------------------------------

# pick from directories in $HOME/.gorc and cd into it
go() {
  if [ ! -f $HOME/.gorc ]; then
    echo "$HOME/.gorc does not exist..."
    return 1
  fi

  pick_with_vim "cat $HOME/.gorc" "cd" $1
}

pwd_gorc() {
  pwd >> $HOME/.gorc
  vim $HOME/.gorc
}

#-------------------------------------------------

# pick from a list of recent directories
rd() {
  pick_with_vim "tail -n20 $HOME/.dirs" "cd"
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
c() {
  pick_with_vim "ack_find" "cd"
}

#-------------------------------------------------

