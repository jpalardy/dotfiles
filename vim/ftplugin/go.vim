
setlocal noexpandtab
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal tabstop=4

nmap <F4> :Fmt<CR>
imap <F4> <ESC><F4>

if !exists("b:snippets")
  let b:snippets = {}
endif

let b:snippets['printf']  = 'fmt.Printf("|", )'
let b:snippets['println'] = 'fmt.Println("|")'
let b:snippets['main'] = 'package main|func main() {}'

