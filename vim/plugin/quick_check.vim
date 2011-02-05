
function! QuickCheck()
  execute(join(["!", b:quickCheckCmd, expand("%")], " "))
endfunction
command -nargs=0 QuickCheck :call QuickCheck()

nnoremap <F4> :QuickCheck<CR>

