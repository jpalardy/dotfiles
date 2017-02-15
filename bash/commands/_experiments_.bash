
holidays() {
  gcal -q ${1:-CA_QU} -n
}

we() {
  vim $(which "$@")
}

# ldf -- last downloaded file
ldf() {
  local file=~/Downloads/$(ls -1t ~/Downloads/ | head -n1)
  read -p "confirm: $file "
  mv "$file" .
}

# scratch file
scr() {
  local ext="$1"
  touch "scratch.${ext}"
  vim "scratch.${ext}"
}

