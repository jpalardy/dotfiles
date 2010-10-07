
function! GitDiff()
  diffthis

  let l:filename = expand("%")

  execute "botright vnew"
  Scratchy("git show HEAD:" . l:filename)

  diffthis
endfunction
command -nargs=* GitDiff :call GitDiff()

nmap <leader>gd :GitDiff<CR>

