alias rg "rg -i --sort-files"
alias rg_ "rg --no-heading --no-filename --no-line-number"

alias ff "rg --files --follow"
alias ftf "find . -type f"

function fne
  ff | rg "\\.$argv[1]\$"
end

function f.
  find . -name '.*' -type f | sed -e 's/^..//' | sort
end
