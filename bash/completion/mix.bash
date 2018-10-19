
# https://github.com/ai/rake-completion/blob/master/rake
_complete_mix_command() {
  [ -f mix.exs ] || exit 0
  # blow out cache if stale
  local recent
  recent=$(ls -t .mix-tasks mix.exs 2>/dev/null | head -n 1)
  if [ "$recent" != ".mix-tasks" ]; then
    rm -f .mix-tasks
  fi
  # regen cache if missing
  if [ ! -f ".mix-tasks" ]; then
    mix help --search "" | awk '{print $2}' > .mix-tasks
  fi
  awk -v re="^$2" '$0 ~ re' .mix-tasks
  return $?
}

complete -C _complete_mix_command -o default mix
