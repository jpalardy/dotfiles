function readenv
  set -l filename $argv[1] .env
  awk -F '=' '{print "set -x", $1, "\"" $2 "\""}' $filename[1]
end
