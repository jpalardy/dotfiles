
alias mix_ mix

function __mix_complete
  if not set -q MIX_COMPLETIONS
    set -g MIX_COMPLETIONS (mix help | awk 'match($0, /^mix ([^ ]+) +# +(.*)/, arr) { print arr[1] "\t" arr[2] }' | string collect)
  end
  echo $MIX_COMPLETIONS
end

complete -c mix_ -f
complete -c mix_ -a "(__mix_complete)"

