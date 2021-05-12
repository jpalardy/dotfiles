
function vim-
  vim -c 'normal h'
end

bind \eh 'commandline -r vim-; commandline -f execute'

function vg
  vim -q (rg --vimgrep $argv | psub)
end

