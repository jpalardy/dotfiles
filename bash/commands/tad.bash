
# throw-away directory
tad() {
  local tmux=1
  while getopts "r" opt; do
    case "$opt" in
      # r for "raw"
      r)
        tmux=0
        shift
        ;;
      *)
        echo >&2 "unknown flag: $opt"
        return 1
        ;;
    esac
  done
  local ts
  ts=$(date +%s)
  local d="$HOME/.throw-away/$ts"
  mkdir -p "$d"
  (
    cd "$d" || exit
    # git clone on argument
    if [ -n "$1" ]; then
      git clone "$1"
      cd "$(basename "$1" .git)" || exit
    fi
    if [ "$tmux" == 1 ]; then
      exec tmux
    else
      exec bash
    fi
  )
  rm -rf "$d"
}

# date name directory
dnd() {
  local args="$*"
  local name
  name="$(date +%F)-${args// /-}"
  mkdir "$name" && cd "$name" || return
}

