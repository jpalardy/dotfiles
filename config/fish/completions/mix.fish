
function __mix_default_completions
  echo "
    compile
    coveralls.html
    credo
    deps.clean
    deps.compile
    deps.get
    deps.tree
    deps.unlock
    deps.update
    dialyzer
    ecto.migrate
    ecto.reset
    ecto.rollback
    ecto.seed
    format
    hex.outdated
    new
    release
    test
  " | awk 'NF { print $1 }'
end

set -g MIX_COMPLETIONS "$(__mix_default_completions)"

function __mix_complete
  if not set -q MIX_COMPLETIONS
    set -g MIX_COMPLETIONS (mix help | awk 'match($0, /^mix ([^ ]+) +# +(.*)/, arr) { print arr[1] "\t" arr[2] }' | string collect)
  end
  if test -z "$MIX_COMPLETIONS"
    set -e MIX_COMPLETIONS
  end
  echo $MIX_COMPLETIONS
end

complete -c mix --no-files
complete -c mix -a "(__mix_complete)"

