
function! GitDiff()
  diffthis

  let filename = expand("%")

  execute "botright vnew"
  Scratchy("git show HEAD:" . filename)

  diffthis
endfunction
command -nargs=* GitDiff :call GitDiff()

nmap <leader>gd :GitDiff<CR>

