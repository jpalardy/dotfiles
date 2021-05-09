function __fish_grep
  set -l cmd "rg"

  if test -z (commandline -j | string join '')
    commandline -i $history[1]
  end

  commandline -aj " | $cmd "
  commandline -f end-of-line
end
