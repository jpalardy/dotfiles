function g
  set -l config "$HOME/.lists/g"

  argparse -x add,edit add edit -- $argv
  or return 1

  # --add
  if set -q _flag_add
    set -l key (basename $PWD)
    set -l value (pwd | sed -e "s#"$HOME"/##")
    echo "$key = $value" | tee -a $config
    return
  end

  # --edit
  if set -q _flag_edit
    $EDITOR $config
    return
  end

  set -l pick $argv[1]

  # empty...
  if test -z "$argv"
    cat $config
    return
  end

  awk -v "key=$pick" -F' += +' '
    $1 == key {
      dst = $2
      if (dst !~ /^\//) {
        dst = ENVIRON["HOME"] "/" dst
      }
      print dst
      exit
    }
  ' $config | read -l dst
  test -n "$dst"; and cd "$dst"
end

complete -c g -l edit -l add
complete -c g --no-files -a "(g | fzf | awk '{ print \$1 }')"
