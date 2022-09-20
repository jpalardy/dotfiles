
function git-diff
  git diff $argv &| vim -R -
end

abbr --add --global glg "git log --graph --pretty=colorful --all"

function gcp
  argparse enable -- $argv
  or return 1

  # --enable
  if set -q _flag_enable
    git config alias.gcp.enabled true
    return
  end

  git config alias.gcp.enabled 2>/dev/null | read -l gcp_config
  if test "$gcp_config" != "true"
    echo >&2 "gcp is disabled for this repository: gcp --enable?"
    return 1
  end
  git commit -av -m '-'; or return 1
  git remote | read -l remotes
  if test -n "$remotes"
    git push
  else
    echo >&2 "no remotes"
    return 1
  end
end
