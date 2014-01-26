
if !exists("b:snippets")
  let b:snippets = {}
endif

let b:snippets['printf$']  = 'fmt.Printf("|", )'
let b:snippets['println$'] = 'fmt.Println("|")'
let b:snippets['main$'] = 'package main|func main() {}'

