
function ftf () {
  find "${@:-"."}" $FIND_OPTIONS -type f -print
}
export -f ftf

function ftd () {
  find "${@:-"."}" -type d
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

