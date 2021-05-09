function __sum
  awk '{sum+=$1} END {print sum}' $argv
end
