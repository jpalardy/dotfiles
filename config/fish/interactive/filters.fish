
function __count
  awk '
    { counts[$0]++ }
    END {
      for(c in counts) {
        printf "%6d %s\n", counts[c], c
      }
    }
  ' $argv | sort -n
end

#-------------------------------------------------

function __sum
  awk '{sum+=$1} END {print sum}' $argv
end

function __diff
  awk 'NR > 1 { printf "%3d\n", $1-prev } { prev=$1 }' $argv
end

function __uniq
  awk '!seen[$0]++' $argv
end

#-------------------------------------------------

function __cut
  cut -c "1-$COLUMNS" $argv
end

