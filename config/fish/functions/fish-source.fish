function fish-source
  if test -z (commandline -j | string join '')
    commandline -i $history[1]
  end

  set -l trimmed_cmd (commandline -b | string trim)
  commandline -r "$trimmed_cmd | source"
end
