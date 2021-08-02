function fish_prompt
  set -l laststatus $status

  if test $CMD_DURATION -ge 10000
    ding
  end

  if test $CMD_DURATION -ge 1000
    printf "🕒 %dms\n" $CMD_DURATION
  end

  if test $laststatus -ne 0
      echo -s (set_color red) "exit: $laststatus"
  end

  set -l normal (set_color normal)
  echo "🐟"
  echo -n -s $normal (set_color $color_host) (prompt_hostname) $normal ' '
end
