# date name directory
function dnd
  if test (count $argv) = 0
    echo >&2 "missing directory name"
    return 1
  end
  set -l name (date +%F)-(string join "-" $argv)
  mkdir $name; and cd $name
end
