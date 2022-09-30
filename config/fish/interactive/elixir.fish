function ex-summary
  awk '$1 ~ /^defp?$/ {sub("\\\\(.*", ""); print $1, $2}' $argv | uniq -c
end
