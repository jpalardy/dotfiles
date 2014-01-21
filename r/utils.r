
# useful R functions

pop.var = function (d) {
  var(d) * (length(d)-1) / length(d)
}

pop.sd = function (d) {
  sqrt(pop.var(d))
}

