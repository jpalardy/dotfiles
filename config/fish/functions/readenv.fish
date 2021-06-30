function readenv
  awk -F'[ =]' '{print "set -gx", $1, $2}' .env
end
