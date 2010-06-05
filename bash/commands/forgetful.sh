
histogram() {
  awk '{printf "%s %3d : ", $2, $1; for(i=0; i<$1; i++) printf "#"; print ""}'
}

forgetful_preview() {
  csv2par "$@" | grep -i "20..-..-.." | sort | uniq -c | histogram
}

forgetful_preview_30() {
  forgetful_preview "$@" | head -n 30
}

show_forgetful() {
  local when;
  if [ -z "$1" ]; then
    when=$(date +'%Y-%m-%d')
  else
    when=$1
  fi

  grep -r $when . | awk -F: '{print $1}' | sort | uniq -c | awk '{print $2 "\t" $1}' | column -t
}

pick_forgetful_today() {
  pick_with_vim show_forgetful forgetful
}

