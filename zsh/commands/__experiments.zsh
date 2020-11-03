
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

# 2020-10-28
tmr() {
  if [ $# -eq 0 ]; then
    tmux
    return
  fi
  tmux new-session "$*; exec $SHELL"
}

# 2020-10-30
alias tm=tmux

# 2020-11-02
alias tmrw="tmux rename-window $PWD:t"

