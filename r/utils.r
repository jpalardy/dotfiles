
# useful R functions

pop.var = function (d) {
  var(d) * (length(d)-1) / length(d)
}

pop.sd = function (d) {
  sqrt(pop.var(d))
}

#-------------------------------------------------

gcd = function(x, y) {
  ifelse(x %% y != 0, gcd(y, x %% y), y)
}

lcm = function(x, y) {
  x * y / gcd(x, y)
}

