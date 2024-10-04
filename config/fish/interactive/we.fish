function we
  if test (count $argv) != 1
    echo >&1 "usage: we command"
    return 1
  end
  set -l name $argv[1]

  set -l src
  set -l line 1
  if functions -q $name
    functions $name | awk '/Defined in/ {print $4, $7}' | read src line
  else
    command -s $name | read src
  end

  if test -z "$src"; and alias | grep -w $name
    return 0
  end

  if test -z "$src"; and abbr | grep -w $name
    return 0
  end

  if test -z "$src"
    echo >&1 "not sure what $name is..."
    return 1
  end

  vim $src +$line
end

complete -c we -a "(__fish_complete_command)"
