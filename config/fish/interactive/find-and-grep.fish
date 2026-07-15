alias rg "rg -i --sort path"
alias rg_ "rg --no-heading --no-filename --no-line-number"

abbr --add ff 'rg --files --follow | rgm ^'
abbr --add --set-cursor ffu 'rg --files --follow -u% | rgm ^'

function find-modtime
  rg --files -0 | find -files0-from - -printf '%T@\t%p\n' | sort -n | awk -F'\t' '{print strftime("%Y-%m-%dT%H:%M:%S", $1), $2}'
end

