function repo-sync
  if not set -q REPOS
    echo >&2 "environment variable REPOS is empty"
    return 1
  end

  argparse s/status -- $argv
  or return 1

  set -l cmds
  set -l cmd "new-session"
  if set -q TMUX
    set cmd "split-window"
  end

  for repo in $REPOS
    if set -q _flag_status
      set cmds $cmds "$cmd 'cd $repo; git st; exec $SHELL'"
    else
      set cmds $cmds "$cmd 'cd $repo; git fp; git st; git log --graph --pretty=color ..@{upstream}; exec $SHELL'"
    end
    set cmd "split-window"
  end
  set cmds $cmds "select-layout even-vertical"

  eval "tmux" (string join "\; " $cmds)
end
