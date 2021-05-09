function __dupes
  awk '++seen[$0] == 2'
end
