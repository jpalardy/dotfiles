
manfiles() {
  find $(echo $MANPATH | tr : ' ') -type f
}

