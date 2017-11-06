
alias rg='rg -i'

ff() {
  rg --files | rg "${@:-^}"
}

ffu() {
  rg --files -u | rg "${@:-^}"
}

cdf() {
  local dest=$(rg --files | fzf -q "${@:-}")
  if [ -z "$dest" ]; then
    return
  fi
  cd "$dest"
}

cdfu() {
  local dest=$(rg --files -u | fzf -q "${@:-}")
  if [ -z "$dest" ]; then
    return
  fi
  cd "$dest"
}

