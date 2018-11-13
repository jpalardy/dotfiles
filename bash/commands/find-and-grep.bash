
alias rg="rg -i"

ff() {
  local flags
  if [ "$1" == "-u" ]; then   # -u belongs to first rg
    flags="-u"
    shift
  fi
  rg --files $flags | rg "${@:-^}"
}

ffu() {
  ff -u "$@"
}

fne() {
  ff "\\.$1\$"
}

