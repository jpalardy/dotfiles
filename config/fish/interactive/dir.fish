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
  fish -c "exec tmux"
  rm -rf $dst
  cd $start_cd
end

# date name directory
function dnd
  if test (count $argv) = 0
    echo >&2 "missing directory name"
    return 1
  end
  set -l name (date +%F)-(string join "-" $argv)
  mkdir $name; and cd $name
end
