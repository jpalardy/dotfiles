
alias rg="rg -i"

ff() {
  rg --files | rg "${@:-^}"
}

ffu() {
  rg --files -u | rg "${@:-^}"
}

