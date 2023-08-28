function ws
  set -l ws_files (ls -a | rg '^\.ws' | sort)
  set -l pick
  switch (count $ws_files)
    case 0
      echo >&2 "no .ws files"
      return 1
    case 1
      set pick $ws_files[1]
    case '*'
      printf "%s\n" $ws_files | fzf | read pick
  end
  if test -z "$pick"
    return
  end
  cat $pick
end
