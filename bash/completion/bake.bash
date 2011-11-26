
_check_bakefile() {
  local src_file="Bakefile"
  local generate_cmd="bake | awk '/^bake / {print \$2}'"
  local word=${COMP_WORDS[COMP_CWORD]}

  if [ ! -e "$src_file" ]; then
    return
  fi

  COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}
  local tasks=$(eval $generate_cmd)
  COMPREPLY=( $(compgen -W "${tasks}" -- "$word") )
}
complete -F _check_bakefile -o default bake

