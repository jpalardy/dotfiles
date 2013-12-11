
find_white() {
  ack -al '(	| +$)'
}

find_dos() {
  ack -al '^M'
}

find_dot() {
  ack -al '^\.'
}

find_empty() {
  find . -type ${1:-d} -empty
}

