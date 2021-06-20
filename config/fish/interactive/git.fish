abbr --add --global git_vimdiff "git difftool"

function git_diff
  git diff $argv &| vim -R -
end

function glg
  set -l heads HEAD
  if git rev-parse @{upstream} &>/dev/null
    set heads $heads @{upstream}
  end
  git log --graph --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr)%Creset%C(auto)%d%Creset %C(dim white)%an%Creset' $heads $argv
end

complete -c glg -f
complete -c glg -l all

function gcp
  git config alias.gcp.enabled 2>/dev/null | read -l gcp_config
  if test "$gcp_config" != "true"
    echo >&2 "gcp is disabled for this repository -- fix: git config alias.gcp.enabled true"
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
