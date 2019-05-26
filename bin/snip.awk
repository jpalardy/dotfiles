
BEGIN {
  ft = ENVIRON["FT"]

  # global
  FIXED["--"]   = "-------------------------------------------------"
  FIXED["isod"] = strftime("%F")
  FIXED["ts"]   = strftime("%s")
  FIXED["cr"]   = "⏎"

  # javascript
  FIXED["javascript:fn"]       = "function"
  FIXED["javascript:function"] = "function (|) {}"
  FIXED["javascript:fori"]     = "for (let i = 0; i < |; i + = 1) {"
  FIXED["javascript:fe"]       = "forEach"
  FIXED["javascript:)"]        = ") => "
  PREFIX["javascript:json"]       = "JSON.stringify"
  PREFIX["javascript:require"]    = "require(\"|\")"
  PREFIX["javascript:console"]    = "console."
  PREFIX["javascript:settimeout"] = "setTimeout"

  # r
  FIXED["r:fn"] = "function"
  FIXED["r:|"]  = "%>%"
  FIXED["r:>"]  = "%>%"
}

#-------------------------------------------------

# blank, skip
NF == 0 {
  print
  next
}

# exact matches
{
  result = FIXED[$0]
  if (result) {
    print result
    next
  }
}

# no ft, skip
ft == "" {
  print
  next
}

# exact matches, w/ ft
{
  result = FIXED[ft ":" $0]
  if (result) {
    print result
    next
  }
}

# prefix matches, w/ ft
{
  for (k in PREFIX) {
    if (index(k, ft ":" $0) == 1) {
      print PREFIX[k]
      next
    }
  }
}

# print everything else as-is
{
  print
}

