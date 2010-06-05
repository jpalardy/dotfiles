
thousands() {
  awk '{$1=sprintf("%'\''19.lf", $1); print $0}' "$@"
}

sum() {
  awk '{sum+=$1} END {print sum}' "$@"
}
export -f sum

