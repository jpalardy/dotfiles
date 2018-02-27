
SnippetG '--', '-------------------------------------------------'

function Snippet_isod(time)
  return strftime("%F")
endfunction

function Snippet_ts(time)
  return strftime("%s")
endfunction

SnippetG 'isod', function("Snippet_isod")
SnippetG 'ts', function("Snippet_ts")

