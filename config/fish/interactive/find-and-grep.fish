alias rg "rg -i --sort-files"
alias rg_ "rg --no-heading --no-filename --no-line-number"

function ff
  set -l flags

  argparse u/unrestricted -- $argv
  or return

  # --unrestricted
  if set -q _flag_unrestricted
      set flags "-u"
  end

  if test -z "$argv"
    rg --files --follow $flags
  else
    rg --files --follow $flags | rg $argv
  end
end

function fne
  ff "\\.$argv[1]\$"
end

function f.
  find . -name '.*' -type f | sed -e 's/^..//' | sort
end
