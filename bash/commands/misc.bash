
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
  python3 -m http.server "$port" || python -m SimpleHTTPServer "$port"
}

alias R="R --quiet --no-save --no-restore"
alias r="R"

alias octave="octave-cli --quiet"
alias maxima="rlwrap maxima --quiet"

#-------------------------------------------------

alias cask="brew cask"
complete -W "list info install uninstall" cask

alias bds="brew desc -s"

#-------------------------------------------------

we() {
  vim "$(command -v "$@")"
}
complete -c we

