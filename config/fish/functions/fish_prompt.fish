function fish_prompt
  set -l laststatus $status

  if test $laststatus -ne 0
      echo -s (set_color red) "exit: $laststatus"
  end

  set -l normal (set_color normal)
  echo -n -s "🐟 " $normal (set_color $color_host) (prompt_hostname) $normal ' '
end
