
alias rg "rg -i --sort-files"
alias rg_ "rg --no-heading --no-filename --no-line-number"

function ff
  set -l flags
  if test -n "$argv"
      and test $argv[1] = "-u" # -u belongs to first rg
      set flags $argv[1]
      set -e argv[1]
  end

  set -l pattern "^"
  if test -n "$argv"
    set pattern $argv
  end

  rg --files --follow $flags | rg $pattern
end

alias ffu "ff -u"

function fne
  ff "\\.$argv[1]\$"
end

