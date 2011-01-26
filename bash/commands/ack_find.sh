
ff() {
  ack -af --sort-files | ack -i --no-color "${@:-.}"
}

fne() {
  ff "\.$1\$"
}

