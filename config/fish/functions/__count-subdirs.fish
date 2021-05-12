function __count-subdirs
  find $argv -type f | awk -F/ '{print $2}' | __count
end
