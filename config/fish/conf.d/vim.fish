
function vim-
  vim -c 'normal h'
end

bind \eh 'vim-'

function vg
  vim -q (rg --vimgrep $argv | psub)
end

