
export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

_check_bakefile() {
  if [ ! -e Bakefile ]; then
    return
  fi

  local cache_file=".cache_bake_t"

  if [ ! -e "$cache_file" ]; then
    bake | awk '/^bake / {print $2}' > $cache_file
  fi

  local tasks=$(cat $cache_file)
  COMPREPLY=( $(compgen -W "${tasks}" -- $2) )
}
complete -F _check_bakefile -o default bake

