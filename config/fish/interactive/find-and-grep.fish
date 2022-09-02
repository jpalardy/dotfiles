alias rg "rg -i --sort path"
alias rg_ "rg --no-heading --no-filename --no-line-number"

function ff
  set -l restricted ""
  if string match -q -r '^-u' -- $argv[1]
    set restricted $argv[1]
    set --erase argv[1]
  end
  set -l filter ""
  if test -n "$argv"
    set filter "| rg" $argv
  end
  eval "rg --files --follow" $restricted $filter
end

function fne
  ff '\\.'$argv[1]'\$'
end

function f.
  find . -name '.*' -type f | sed -e 's/^..//' | sort
end
