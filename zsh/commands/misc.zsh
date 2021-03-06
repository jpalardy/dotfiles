
alias ls='ls --color=auto'
alias ll='ls -l'
alias l='ls -l'

alias -g _V='|& vim -R -'
alias -g _T="\$(date +%F)"
alias -g _L='|& less -r'

alias reload!="source ~/.zshrc"

alias vr=vimrepl

h() {
  local COUNT=${COUNT:-25}
  if [ $# -eq 0 ]; then
    history -"$COUNT"
  else
    history 1 | grep -i "$@" | tail -n "$COUNT"
  fi
}

alias grep='grep -E --color=auto'
alias sed='sed -E'
alias whence="whence -avS"

alias ding='ding $?'

alias tls="tmux ls"

alias rsy="rsync -av --progress"

inet() {
  if command -v ip > /dev/null; then
    ip addr | grep --color -E 'inet[^6].*|$'
  else
    ifconfig | grep --color -E 'inet[^6].*|$'
  fi
}

alias man=vman
vman() {
  command man "$@" | col -b | view - -c "set ft=man nomod"
}

#-------------------------------------------------

size_sort() {
  find . -type f "$@" -printf "%s %p\\n" | sort -n | __thousands
}

#-------------------------------------------------

alias pwgen='pwgen -cny 30'

serve() {
  local port="${1:-8000}"
  python3 -m http.server "$port" || python -m SimpleHTTPServer "$port"
}

alias R="R --quiet --no-save --no-restore"

alias octave="octave-cli --quiet"
alias maxima="rlwrap maxima --quiet"

#-------------------------------------------------

alias cask="brew cask"
alias bds="brew desc -s"

#-------------------------------------------------

we() {
  vim "$(command -v "$@")"
}
compdef _command_names we

#-------------------------------------------------

for f in /usr/local/opt/fzf/shell/key-bindings.zsh \
         /usr/share/doc/fzf/examples/key-bindings.zsh; do
  [ -f "$f" ] && source "$f"
done

