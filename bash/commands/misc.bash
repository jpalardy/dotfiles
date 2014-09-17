
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

alias grep='grep --color=auto'

alias reload="source $HOME/.bashrc"

alias man=vman

vman() {
  \man "$@" | col -b | view - -c "set ft=man nomod"
}

manfiles() {
  find $(echo $MANPATH | tr : ' ') -type f
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

serve() {
  python -m SimpleHTTPServer ${1:-8000}
}

alias R="R --quiet"

alias cask="brew cask"

