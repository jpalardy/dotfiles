function commandline-append
  if test -z (commandline -j | string join '')
    commandline -i $history[1]
  end

  set -l trimmed_cmd (commandline -b | string trim)
  commandline -r "$trimmed_cmd $argv"
  commandline -f repaint
end

function __fish_paginate
  commandline-append "&| vim -R -"
end
