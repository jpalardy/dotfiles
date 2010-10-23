
ff() {
  ack_find | ack "$@"
}

fne() {
  ff "\.$1\$"
}

