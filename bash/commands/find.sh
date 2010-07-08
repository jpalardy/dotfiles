
export FIND_OPTIONS="-name .git -prune -o -name .hg -prune -o -name *.swp -prune -o"

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

find_empty() {
  find . -type ${1:-d} -empty
}

############################################################

f() {
  ack -af ${1-.}
}

