
gri() {
  ack -a --no-group -i "$@"
}

gril() {
  ack -a --no-group -il "$@"
}

ff() {
  ack_find | grep -i --color=none "${@:-.}"
}

# grep over ff
ffg() {
  grep "$@" $(ff)
}

fne() {
  ff "\.$1\$"
}

