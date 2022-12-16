
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

function __uniq
  awk '!seen[$0]++' $argv
end

#-------------------------------------------------

function __cut
  cut -c "1-$COLUMNS" $argv
end

#-------------------------------------------------

function __ext
  # delete to slash
  # contains dot after first character
  # delete to first dot
  sed -E -e 's_.*/__' | rg '^..*\.' | sed -E -e 's/[^.]+//'
end

