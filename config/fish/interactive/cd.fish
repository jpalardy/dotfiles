# save default "cd" as "__cd", for override (next)
if ! functions -q __cd
  functions -c cd __cd
end

function cd
  set -l dst $argv[1]
  # cd to base git directory
  if test "$dst" = "_"
    set dst $PWD
    while test "$dst" != "/"
      if test -d "$dst/.git"
        __cd $dst
        break
      end
      set dst (dirname $dst)
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
  if test "$argv[1]" != "_"
    cd ..
    return
  end

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
  echo */ | string split " " | fzf -q "$argv[1]" | read -l result
  if test -n "$result"
    cd $result
  end
end
