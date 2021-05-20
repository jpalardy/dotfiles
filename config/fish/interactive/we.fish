function we
  if test (count $argv) != 1
    echo >&1 "usage: we command"
    return 1
  end
  set -l name $argv[1]

  set -l src
  if functions -q $name
    functions $name | awk '/Defined in/ {print $4}' | read src
  else
    command -s $name | read src
  end

  if test -z "$src"
    echo >&1 "not sure what $name is..."
    return 1
  end

  $EDITOR $src
end

complete -c we -a "(__fish_complete_command)"
