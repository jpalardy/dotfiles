
_complete_mix_command() {
  if [ -z "$_mix_task_list" ]; then
    _mix_task_list="$(mix help --search "" | awk '{print $2}')"
  fi
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "$_mix_task_list" "$cur") )
  return 0
}

complete -F _complete_mix_command -o default mix

