function __fish_paginate
  set -l cmd "vim -R -"

  if test -z (commandline -j | string join '')
    commandline -i $history[1]
  end

  if commandline -j | not string match -q -r "$cmd *\$"
    commandline -a " &| $cmd"
    commandline -f end-of-line
  end
end
