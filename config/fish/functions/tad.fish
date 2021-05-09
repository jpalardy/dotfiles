# throw-away directory
function tad
  set -l start_cd $PWD
  set -l dst "$HOME/.throw-away/"(date +%s)
  mkdir $dst
  cd $dst
  if test -n "$argv[1]"
    git clone $argv[1]
    cd (basename $argv[1] .git)
  end
  fish -c "exec tmux"
  rm -rf $dst
  cd $start_cd
end
