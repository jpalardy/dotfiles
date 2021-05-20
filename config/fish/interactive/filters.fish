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

function __sum
  awk '{sum+=$1} END {print sum}' $argv
end

function __uniq
  awk '!seen[$0]++' $argv
end

function __dupes
  awk '++seen[$0] == 2'
end

#-------------------------------------------------

function __cut
  cut -c "1-$COLUMNS" $argv
end

function __count-subdirs
  find $argv -type f | awk -F/ '{print $2}' | __count
end
