function __count
  argparse min= -- $argv
  or return 1

  # --min
  set -l min 1
  if set -q _flag_min
    set min $_flag_min
  end

  awk -v "min=$min" '
    { counts[$0]++ }
    END {
      for(c in counts) {
        if (counts[c] >= min) {
          printf "%6d %s\n", counts[c], c
        }
      }
    }' $argv | sort -n
end

complete -c __count -l min -d "minimum value"

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

function __words
  awk '{for (i=1; i<=NF; i++) { print $i} }' $argv
end

function __letters
  grep -o . $argv
end

#-------------------------------------------------

function __ext
  # delete to slash
  # contains dot after first character
  # delete to first dot
  sed -E -e 's_.*/__' | rg '^..*\.' | sed -E -e 's/[^.]+//'
end

