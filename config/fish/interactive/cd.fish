# save default "cd" as "__cd", for override (next)
if ! functions -q __cd
  functions -c cd __cd
end

function cd
  set -l dst $argv[1]
  # cd to base git directory
  if test "$dst" = "_"
    set dst $(git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$dst"
      __cd $dst
    end
    return
  end
  # cd to filepath
  if test -f "$dst"
    __cd (dirname $dst)
    return
  end
  # delegate
  __cd $argv
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
  for dir in */; echo $dir; end | fzf -0 -q "$argv[1]" | read -l result
  test -n "$result"; and cd $result
end
