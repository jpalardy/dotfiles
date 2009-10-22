
function ftf () {
  find "${@:-"."}" $FIND_OPTIONS -type f -print
}

function ftd () {
  find "${@:-"."}" $FIND_OPTIONS -type d -print
}

############################################################

function fne () {
  find "${2:-"."}" -iname "*.$1"
}

function ff () {
  find . -iname "*${1}*"
}

############################################################

function find_white() {
  find . -type f -print0 | xargs -0 grep -il '	\|\s\+$'
}

function find_dos() {
  find . -type f -print0 | xargs -0 grep -il ''
}

############################################################

function hl() {
  grep -i $1 ~/.hl_data
}

function hl_update() {
  find ~ > $HOME/.hl_data
}

############################################################

function find_gt() {
  find "${2:-"."}" -type f -newer $1
}

function find_ge() {
  find $1
  find_gt "$@"
}
