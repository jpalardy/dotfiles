function fzf-warp
  cat $HOME/.warp | eval (__fzfcmd) | read -l result
  and commandline -- "ssh $result"
  commandline -f repaint
end
