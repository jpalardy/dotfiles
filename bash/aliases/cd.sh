
#-------------------------------------------------

# cd into the directory of the given filename
function cdf() {
  cd $(dirname $1)
}

#-------------------------------------------------

# overwrites behavior of 'cd'
function cd_pushd() {
  local dest=${1:-"$HOME"}
  if [ -f "$dest" ]; then
    cdf "$dest"
  else
    pushd "$dest" >/dev/null
  fi
}
alias cd="cd_pushd"

#-------------------------------------------------

# pick from directories in $HOME/.gorc and cd into it
function go() {
  if [ ! -f $HOME/.gorc ]; then
    echo "$HOME/.gorc does not exist..."
    return 1
  fi

  pick_with_vim "cat $HOME/.gorc" "cd" $1
}

#-------------------------------------------------

# pick from directories visited in this session and cd into it
function tb() {
  pick_with_vim "dirs -l -p" "cd"
}

#-------------------------------------------------

# HELPER -- generate the list of parent directories
function parent_dirs() {
  local path="${1:-$PWD}"

  while [ "$path" != "/" ]; do
    echo "$path"
    path=`dirname "$path"`
  done
}

# pick from parent directories and cd into it
function b() {
  local count=$1
  if [ -n "$count" ]; then
    count=$(($count + 1))
  fi

  pick_with_vim "parent_dirs" "cd" $count
}

#-------------------------------------------------

# pick from a list of directories (recursive) and cd into it
function c() {
  pick_with_vim "ftd" "cd"
}

#-------------------------------------------------

