
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

function mktmp() {
  mktemp /tmp/tmp.XXXXXXXXXX 2>/dev/null
}

#-------------------------------------------------

function cat_rm() {
  cat $1
  rm $1 2>/dev/null
}

#-------------------------------------------------

function pick_from_list() {
  local tempfile=`mktmp` || local tempfile=/tmp/test$$
  trap "rm -f $tempfile" 0 1 2 5 15

  local items="$@"
  local nitems=`echo $items | xargs -n1 echo | cat -n`
  dialog --ascii-lines --clear --menu "pick:" 0 0 0 $nitems 2> $tempfile

  if [ "$?" != "0" ] ; then
    rm $tempfile
    return
  fi

  local nchoice=`cat_rm $tempfile`

  echo $items | xargs -n1 echo | sed -n ${nchoice}p 1>&2
}

#-------------------------------------------------

