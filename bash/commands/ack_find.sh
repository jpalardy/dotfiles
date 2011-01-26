
ff() {
  ack -af | ack -i "$@"
}

fne() {
  ff "\.$1\$"
}

