
__thousands() {
  awk '{$1=sprintf("%'\''19.lf", $1); print $0}' "$@"
}

__sum() {
  awk '{sum+=$1} END {print sum}' "$@"
}

__count() {
  awk '{counts[$0]++} END {for(c in counts) printf "%6d %s\n", counts[c], c}' "$@" | sort -k2
}

__uniq() {
  awk '!seen[$0]++'
}

__count-ext() {
  print -l **/*(:t:e) | __count | sort -n
}

