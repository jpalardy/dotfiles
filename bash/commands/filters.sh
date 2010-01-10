
filters.blank() {
  cat "$@" | \grep .
}

filters.tidy() {
  cat "$@" | tidy -q -indent --indent-spaces 2 -wrap 0 -clean --tidy-mark no --show-warnings no
}

filters.thousands() {
  cat "$@" | awk '{$1=sprintf("%'\''19.lf", $1); print $0}'
}

filters.sum() {
  cat "$@" | awk '{sum+=$1} END {print sum}'
}
export -f filters.sum

