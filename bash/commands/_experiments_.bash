
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

implode() {
  local target=$PWD
  cd ..
  read -p "delete $target "
  rm -rf $target
}

