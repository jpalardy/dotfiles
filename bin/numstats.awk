
min == "" {min=max=$1}
$1 < min  {min = $1}
$1 > max  {max = $1}
          {sum+=$1; sumsq+=$1*$1}
END {
  print "count: ", NR;
  print "min:   ", min;
  print "max:   ", max;
  print "sum:   ", sum;
  print "mean:  ", sum/NR;
  print "stddev:", sqrt(sumsq/NR - (sum/NR)**2)
}

