
#-------------------------------------------------

function cdf() {
  cd $(dirname $1)
}

#-------------------------------------------------

function cd_pushd() {
  local dest=${1:-"$HOME"}
  if [ -f $dest ]; then
    cdf $dest
  else
    pushd "$dest" >/dev/null
  fi
}
alias cd="cd_pushd"

#-------------------------------------------------

alias mark_dir='echo $PWD >> $HOME/.gorc'

function go() {
  if [ ! -f $HOME/.gorc ]; then
    echo "$HOME/.gorc does not exist..."
    return 1
  fi

  if [ -n "$1" ]; then
    local dest=`cat $HOME/.gorc | sed -n $1p`
  else
    local tempfile=`mktmp` || local tempfile=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15

    local places=`cat $HOME/.gorc`
    pick_from_list $places 2> $tempfile

    local dest=`cat_rm $tempfile`
  fi

  [ -n "$dest" ] && cd $dest
}

#-------------------------------------------------

function tb() {
  local tempfile=`mktmp` || local tempfile=/tmp/test$$
  trap "rm -f $tempfile" 0 1 2 5 15

  local places=`dirs -l -p | sed 1d`
  pick_from_list $places 2> $tempfile

  local dest=`cat_rm $tempfile`

  [ -n "$dest" ] && cd $dest
}

#-------------------------------------------------

function c() {
  local tempfile=`mktmp` || local tempfile=/tmp/test$$
  trap "rm -f $tempfile" 0 1 2 5 15

  local places=`find . -maxdepth 1 -type d | sort | sed 1d`
  pick_from_list $places 2> $tempfile

  local dest=`cat_rm $tempfile`

  [ -n "$dest" ] && cd $dest && c
}

function b() {
  local tempfile=`mktmp` || local tempfile=/tmp/test$$
  trap "rm -f $tempfile" 0 1 2 5 15

  local places=`parent_dirs $(pwd)`
  pick_from_list $places 2> $tempfile

  local dest=`cat_rm $tempfile`

  [ -n "$dest" ] && cd $dest
}

function parent_dirs() {
  local path=$1

  while [ "$path" != "/" ]; do
    echo $path
    path=`dirname $path`
  done
}

#-------------------------------------------------

