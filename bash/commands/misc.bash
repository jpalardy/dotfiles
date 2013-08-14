
alias ls='ls --color=auto'
alias ll='ls -l'
alias l='ls -l'

h() {
  local COUNT=${COUNT:-25}

  if [ -z "$@" ]; then
    history $COUNT
  else
    history | ack "$@" | tail -n $COUNT
  fi
}

# -F : don't page if less than one screen
# -i : ignore-case
# -R : raw-control-char
# -S : chop-long-lines
# -c : clear-screen (rather than scroll to clear)
# -w : hilite-unread
# -X : no-init (won't clear screen on exit)
alias less='less -FiRSwX -c '

alias grep='grep --color=auto'

alias reload="source $HOME/.bashrc"

alias man=vman

vman() {
  \man "$@" | col -b | view - -c "set ft=man nomod"
}

#-------------------------------------------------

du_sort() {
  du -b --max-depth=1 $1 | sort -n | thousands
}

size_sort() {
  find ${1:-.} -type f -printf "%s %p\n" | sort -n | thousands
}

#-------------------------------------------------

alias apg='apg -a 1 -n 20 -m 20 -M SNCL -s'

rm_caches() {
  ack -ag '\.cache_' --print0 | xargs -0 rm -v 2>/dev/null
}

serve() {
  python -m SimpleHTTPServer ${1:-8000}
}

#-------------------------------------------------

tad() {
  local ts=$(date +%s)
  local d="$HOME/.throw_away/$ts"
  mkdir -p $d
  (cd $d; bash)
  rm -r $d
}

check_compressed() {
  curl -s -I --compressed --include "$@" | grep 'Content-Encoding'
}

