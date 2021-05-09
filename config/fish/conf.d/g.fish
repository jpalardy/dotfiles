
function g
  set -l config "$HOME/.lists/g"
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

complete -c g --no-files -a "(__g_keys)"

