
load_bash_completion() {
  for dir in /usr/local/etc /etc; do
    if [ -e ${dir}/bash_completion ]; then
      source ${dir}/bash_completion
      complete -r vim 2>/dev/null
      complete -r sqlite3 2>/dev/null
      return
    fi
  done
  echo "no bash-completion"
}

load_bash_completion
unset load_bash_completion

