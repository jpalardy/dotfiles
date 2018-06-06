
# throw-away directory
tad() {
  local ts
  ts=$(date +%s)
  local d="$HOME/.throw-away/$ts"
  mkdir -p "$d"
  (cd "$d" || exit; bash)
  rm -rf "$d"
}

# date name directory
dnd() {
  local args="$*"
  local name
  name="$(date +%F)-${args// /-}"
  mkdir "$name" && cd "$name" || return
}

