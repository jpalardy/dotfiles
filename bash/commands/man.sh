
manfiles() {
  find $(echo $MANPATH | sed 's/:/ /g') -type f
}

