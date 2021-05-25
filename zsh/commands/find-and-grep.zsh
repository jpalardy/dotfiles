
alias rg="rg -i --sort-files"
alias rg_="rg --no-heading --no-filename --no-line-number"

ff() {
  local flags
  if [ "$1" = "-u" ]; then   # -u belongs to first rg
    flags="-u"
    shift
  fi
  rg --files $flags | rg "${@:-^}"
}
alias ffu="ff -u"

fne() {
  ff "\\.$1\$"
}

