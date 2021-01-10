
# wrap `cd`, add behaviors
cd() {
  local dest="${@:-"$HOME"}"
  if [ -f "$dest" ]; then
    dest=${dest:h}
  fi
  builtin cd "$dest"
}

# go back n times
b() {
  repeat ${1:-1}; cd ..
}

# pick parent with fzf
bu() {
  run-not-blank cd $(
    local p=$PWD
    while [ $p != "/" ]; do
      echo $p
      p=${p:h}
    done | fzf
  )
}

cdl() {
  run-not-blank cd $(ls | fzf -q "$1")
}

cdf() {
  local vim_after=0
  local ff_flags=""
  while true; do
    if [ "$1" = "-u" ]; then   # -u belongs to ff
      ff_flags="-u"
      shift
      continue
    fi
    if [ "$1" = "-v" ]; then   # -v belongs to "vim"
      vim_after=1
      shift
      continue
    fi
    break
  done
  local target
  target=$(ff $ff_flags | fzf -q "$1")
  run-not-blank cd "$target"
  if [ $vim_after = 1 ]; then
    run-not-blank vim "${target:t}"
  fi
}
alias cdfv="cdf -v"

run-not-blank() {
  if [ $# -lt 2 ]; then
    return
  fi
  "$@"
}
