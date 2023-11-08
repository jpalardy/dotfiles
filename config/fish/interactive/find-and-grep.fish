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

function fne
  ff '\\.'$argv[1]'\$'
end

function f.
  find . -name '.*' -type f | sed -e 's/^..//' | sort
end

function fz
  set pattern $argv .
  rg $pattern[1] | fzf
end

function fz_
  set pattern $argv .
  rg_ $pattern[1] | fzf
end
