function fzf-warp
  set -l config "$HOME/.lists/warp"

  fzf < $config | read -l result
  and commandline -- "ssh $result"

  commandline -f repaint
end
