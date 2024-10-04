alias rg "rg -i --sort path"
alias rg_ "rg --no-heading --no-filename --no-line-number"

abbr --add ff 'rg --files --follow | rgm'
abbr --add --set-cursor ffu 'rg --files --follow -u% | rgm'

