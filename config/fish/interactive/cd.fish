function cd
  set -l dst $argv[1]
  # cd to base git directory
  if test "$dst" = "_"
    set dst $(git rev-parse --show-toplevel)
    if test -n "$dst"
      builtin cd $dst
    end
    return
  end
  # cd to filepath
  if test -f "$dst"
    builtin cd (dirname $dst)
    return
  end
  # delegate
  builtin cd $argv
end

function b
  set -l cwd $PWD
  while test $cwd != "/"
    echo $cwd
    set cwd (path dirname $cwd)
  end | fzf | read -l result

  if test -n "$result"
    cd $result
  end
end

function cdl
  for dir in */; echo $dir; end | fzf -0 --tac -q "$argv[1]" | read -l result
  test -n "$result"; and cd $result
end
