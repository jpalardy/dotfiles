
#-------------------------------------------------

function join() {
  local joiner=$1; shift
  local result=$1; shift

  for x in "$@"; do
    result+="${joiner}${x}"
  done

  echo $result
}

#-------------------------------------------------

function cond_source () {
  [ -f $1 ] && . $1
}

#-------------------------------------------------

