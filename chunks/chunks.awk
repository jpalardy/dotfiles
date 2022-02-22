
ARGIND == 1 {lut[$0]; next}

match($0, /^mix ([^ ]+) +# +(.*)/, arr) {
  print arr[1] "\t" arr[2]
}

# https://www.gnu.org/software/gawk/manual/html_node/String-Functions.html
#
# sub(regexp, replacement [, target])

{
  print "something" > "/dev/stderr"
}

