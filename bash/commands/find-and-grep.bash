
alias rg="rg -i"

ff() {
  rg --files | rg "${@:-^}"
}

ffu() {
  rg --files -u | rg "${@:-^}"
}

ftf() {
  local path=${1:-.}
  shift
  find "$path" -type f "$@"
}

fne() {
  ff "\\.$1\$"
}

