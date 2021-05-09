function __uniq
  awk '!seen[$0]++' $argv
end
