function g
  set -l config "$HOME/.lists/g"

  argparse --name g add edit -- $argv
  or return

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

  # empty...
  if test -z "$argv"
    cat $config
    return
  end

  awk -v "key=$argv[1]" -F' += +' '
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

function __g_keys
  awk -F' += +' '{ print $1 "\t" $2 }' "$HOME/.lists/g"
end

complete -c g -l edit -l add
complete -c g --no-files -a "(__g_keys)"
