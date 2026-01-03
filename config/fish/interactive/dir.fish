# throw-away directory
function tad
  set -l start_cd $PWD
  set -l dst "$HOME/.throw-away/"(date +%s)
  mkdir -p $dst
  cd $dst; or return 1
  if test -n "$argv[1]"
    git clone $argv[1]; or return 1
    cd (basename $argv[1] .git)
  end
  if set -q TMUX
    echo "enter: $dst"
    fish
    echo "exit: $dst"
  else
    fish -c "exec tmux"
  end
  rm -rf $dst
  cd $start_cd
end

# date name directory
function dnd
  set -l name (date +%F)
  if test (count $argv) -ge 1
    set name $name-(string join "-" $argv)
  end
  mkdir $name; and cd $name
end
