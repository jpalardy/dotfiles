function fish_prompt
  set -l laststatus $status
  if test $laststatus -ne 0
    printf "%sexit: %d\n" (set_color red) $laststatus
  end
  printf "%s%s%s " (set_color $color_host) (prompt_hostname) (set_color normal)
end
