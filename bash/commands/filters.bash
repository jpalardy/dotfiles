
@thousands() {
  awk '{$1=sprintf("%'\''19.lf", $1); print $0}' "$@"
}

@sum() {
  awk '{sum+=$1} END {print sum}' "$@"
}
export -f @sum

@count() {
  awk '{counts[$0]++} END {for(c in counts) printf "%6d %s\n", counts[c], c}' "$@" | sort -k2
}

@uniq() {
  awk '!seen[$0]++'
}

