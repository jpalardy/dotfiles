
# URLs
/^https?:/ {
  print $0 | "bookmark"
  next
}

# print everything else as-is
{
  print
}

