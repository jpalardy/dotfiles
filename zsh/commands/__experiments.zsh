
# 2019-01-24
implode() {
  local target="$PWD"
  local code
  code=$(seq 0 9 | shuf -r -n 4 | awk '{printf "%s", $0}')
  echo -n "$code: delete $target ? "
  read input
  if [ "$input" != "$code" ]; then
    return
  fi
  cd ..
  rm -rf "$target"
}

# 2021-01-28
tcd() {
  tmux capture-pane -b temp-capture-buffer "$@"
  tmux save-buffer -b temp-capture-buffer -
  tmux delete-buffer -b capture-buffer
}
alias tcd="tcd -t {last}"

