
alias rg="rg -i --sort-files"

ff() {
  local flags
  if [ "$1" == "-u" ]; then   # -u belongs to first rg
    flags="-u"
    shift
  fi
  rg --files $flags | rg "${@:-^}"
}
alias ffu="ff -u"

fne() {
  ff "\\.$1\$"
}

find-white() {
  local COLOR_RESET=$(tput sgr0)
  rg -l '\t' .   | awk -v hl="$(tput setaf 1)" -v reset="$COLOR_RESET" '{print hl "tab:" reset, $0}' # red
  rg -l '\s+$' . | awk -v hl="$(tput setaf 3)" -v reset="$COLOR_RESET" '{print hl "eol:" reset, $0}' # yellow
  rg -l '\r' .   | awk -v hl="$(tput setaf 8)" -v reset="$COLOR_RESET" '{print hl "dos:" reset, $0}' # gray
}

find-empty() {
  find . -type "${1:-f}" -empty
}

