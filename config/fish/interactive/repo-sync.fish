function repo-sync
  if not set -q REPOS
    echo >&2 "environment variable REPOS is empty"
    return 1
  end

  set -l cmds
  set -l cmd "new-session"
  if set -q TMUX
    set cmd "split-window"
  end

  for repo in $REPOS
    set cmds $cmds "$cmd 'cd $repo; git fp; git st; git incoming; exec $SHELL'"
    set cmd "split-window"
  end
  set cmds $cmds "select-layout even-vertical"

  eval "tmux" (string join "\; " $cmds)
end
