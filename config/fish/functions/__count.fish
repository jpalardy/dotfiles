function __count
  awk -v "min_count=1" '
    { counts[$0]++ }
    END {
      for(c in counts) {
        if (counts[c] >= min_count) {
          printf "%6d %s\n", counts[c], c
        }
      }
    }' $argv | sort -n
end
