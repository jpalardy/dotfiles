
find_white() {
  ack -al '(	| +$)'
}

find_dos() {
  ack -al '^M'
}

find_empty() {
  find . -type ${1:-d} -empty
}

find_swp() {
  find . -name '.*.sw*'
}

