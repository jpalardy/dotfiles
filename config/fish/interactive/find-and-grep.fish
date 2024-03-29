alias rg "rg -i --sort path"
alias rg_ "rg --no-heading --no-filename --no-line-number"

function ff
  set -l restricted
  if string match -q -r '^-u' -- $argv[1]
    set restricted $argv[1]
    set --erase argv[1]
  end
  if test (count $argv) -gt 0
    rg --files --follow $restricted | rgm $argv
  else
    rg --files --follow $restricted
  end
end

function fz
  rg_ $argv | fzf --exit-0
end

