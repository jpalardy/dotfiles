function readenv
  set -l filename $argv[1] .env
  awk 'match($0, /^(export ?)(.+)( +|= *)(.*)/, arr) { print "set -gx", arr[2], arr[4]}' $filename[1]
end
