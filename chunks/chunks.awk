
match($0, /^mix ([^ ]+) +# +(.*)/, arr) {
  print arr[1] "\t" arr[2]
}

filename=gensub(" ", "-", "g", $0)
# only once
filename=gensub(" ", "-", 1, $0)

# https://www.gnu.org/software/gawk/manual/html_node/String-Functions.html
# sub(regexp, replacement [, target])

{
  print "something" > "/dev/stderr"
}

# user function
function abs(num) {
  return num < 0 ? -num : num
}

