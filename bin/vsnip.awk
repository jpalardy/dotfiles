
# URLs
/^https?:/ {
  system("bookmark " $0)
  print ""
  next
}

# print everything else as-is
{
  print
}

