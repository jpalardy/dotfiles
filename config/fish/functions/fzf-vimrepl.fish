function fzf-vimrepl
  set -l config "$HOME/.lists/vimrepl"

  fzf < $config | read -l result
  and commandline -- $result

  commandline -f repaint
end
