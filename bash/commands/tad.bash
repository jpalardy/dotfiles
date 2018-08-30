
# throw-away directory
tad() {
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
    bash
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

