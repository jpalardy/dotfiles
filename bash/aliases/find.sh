
ftf() {
  find "${@:-"."}" $FIND_OPTIONS -type f -print
}

ftd() {
  find "${@:-"."}" $FIND_OPTIONS -type d -print
}

############################################################

fne() {
  find "${2:-"."}" -iname "*.$1"
}

ff() {
  find . -iname "*${1}*"
}

############################################################

find_white() {
  find . -type f -print0 | xargs -0 grep -il '	\|\s\+$'
}

find_dos() {
  find . -type f -print0 | xargs -0 grep -il ''
}

############################################################

hl() {
  grep -i $1 ~/.hl_data
}

hl_update() {
  find ~ > $HOME/.hl_data
}

############################################################

find_gt() {
  find "${2:-"."}" -type f -newer $1
}

find_ge() {
  find $1
  find_gt "$@"
}

find_empty() {
  find . -type ${1:-d} -empty
}
