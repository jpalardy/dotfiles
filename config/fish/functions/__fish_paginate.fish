function __fish_paginate --description 'Paginate the current command using the users default pager'
  set -l cmd "vim -R -"

  if test -z (commandline -j | string join '')
    commandline -i $history[1]
  end

  if commandline -j | not string match -q -r "$cmd *\$"
    commandline -aj " &| $cmd;"
  end
end
