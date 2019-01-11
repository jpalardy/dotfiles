
alias ls='ls --color=auto'
alias ll='ls -l'
alias l='ls -l'

h() {
  local COUNT=${COUNT:-25}
  if [ $# -eq 0 ]; then
    history "$COUNT"
  else
    history | grep -i "$@" | tail -n "$COUNT"
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
  du -b --max-depth=1 "$@" | sort -n | @thousands
}

size_sort() {
  find . -type f "$@" -printf "%s %p\\n" | sort -n | @thousands
}

mod_sort() {
  find . -type f "$@" -printf "%T+ %p\\n" | sed -e 's/\........... / /' | sort
}

#-------------------------------------------------

alias pwgen='pwgen -cny 30'

serve() {
  local port="${1:-8000}"
  python -m http.server "$port" || python -m SimpleHTTPServer "$port"
}

alias R="R --quiet"
alias r="R --quiet"

alias octave="octave-cli --quiet"
alias maxima="rlwrap maxima --quiet"

#-------------------------------------------------

alias cask="brew cask"

_cask() {
  local word=${COMP_WORDS[COMP_CWORD]}
  local commands="search info install"
  COMPREPLY=( $(compgen -W "${commands}" -- "$word") )
}
complete -F _cask cask

alias bds="brew desc -s"

#-------------------------------------------------

we() {
  vim "$(command -v "$@")"
}
complete -c we

