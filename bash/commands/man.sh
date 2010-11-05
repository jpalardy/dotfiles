
manfiles() {
  find $(echo $MANPATH | tr : ' ') -type f
}

man_() {
  pick_with_vim manfiles man
}

