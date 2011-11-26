
ff() {
  ack -af --sort-files | ack -i --no-color "${@:-.}"
}

fne() {
  ff "\.$1\$"
}

gr() {
  ack -a --no-group $OPTIONS "$@"
}

grl() {
  OPTIONS="-l" gr "$@"
}

gri() {
  OPTIONS="-i" gr  "$@"
}

gril() {
  OPTIONS="-il" gr  "$@"
}

ack_ignored() {
  (cat <(ack -af) <(ack -f)) 2>/dev/null | sort | uniq -u
}

