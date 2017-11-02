
_check_primers() {
  local word=${COMP_WORDS[COMP_CWORD]}
  local dirs=$(ls $DOTFILES/bin/primers/)
  COMPREPLY=( $(compgen -W "${dirs}" -- "$word") )
}
complete -F _check_primers prime

