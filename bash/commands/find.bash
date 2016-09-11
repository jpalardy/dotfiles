
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

find_images() {
  find "$@" -type f | grep --color=no -E '(png|jpe?g|gif)$'
}

find_exts() {
  find "$@" -type f -name '*.*' | sed 's/.*\.//'
}

