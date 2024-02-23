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
  if test -z "$pick"
    fzf < $config | awk '{ print $1 }' | read pick
    if test -z "$pick"
      return
    end
  end

  awk -v "key=$pick" -F' += +' '
    function fix(path) {
      if (path ~ /^\//) {
        return path
      }
      return ENVIRON["HOME"] "/" path
    }
    $1 == key {
      print fix($2)
      exit
    }
    match($1, key) {
      partial = fix($2)
    }
    END {
      if (partial) {
        print partial
      }
    }
  ' $config | read -l dst
  test -n "$dst"; and cd "$dst"
end

function __g_keys
  awk -F' += +' '{ print $1 "\t" $2 }' "$HOME/.lists/g"
end

complete -c g -l edit -l add
complete -c g --no-files -a "(__g_keys)"
