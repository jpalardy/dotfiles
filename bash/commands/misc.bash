
alias ls='ls --color=auto'
alias ll='ls -l'
alias l='ls -l'

h() {
  local COUNT=${COUNT:-25}
  if [ -z "$@" ]; then
    history $COUNT
  else
    history | grep -i "$@" | tail -n $COUNT
  fi
}

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
  find . -type f "$@" -printf "%s %p\n" | sort -n | thousands
}

#-------------------------------------------------

alias pwgen='pwgen -cny 30'

serve() {
  python -m SimpleHTTPServer ${1:-8000}
}

alias R="R --quiet"
alias r="R --quiet"

alias octave="octave-cli --quiet"
alias maxima="rlwrap maxima --quiet"

alias cask="brew cask"

