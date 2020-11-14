
__thousands() {
  awk '{$1=sprintf("%'\''19.lf", $1); print $0}' "$@"
}

__sum() {
  awk '{sum+=$1} END {print sum}' "$@"
}

__count() {
  local min_count=1
  if [ "$1" = "-d" ]; then
    min_count=2
    shift
  fi
  awk -v min_count="$min_count" '
    { counts[$0]++ }
    END {
      for(c in counts) {
        if (counts[c] >= min_count) {
          printf "%6d %s\n", counts[c], c
        }
      }
    }' "$@" | sort -n
}

__dupes() {
  awk '++seen[$0] == 2'
}

__uniq() {
  awk '!seen[$0]++'
}

__count-ext() {
  print -l **/*(:e) | __count
}

__cut() {
  cut -c "1-${COLUMNS}" "$@"
}

