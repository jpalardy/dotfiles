function vim-
  vim -c 'normal h'
end

function vg
  vim -q (rg --vimgrep $argv | psub)
end
