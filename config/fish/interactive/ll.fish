# detect if flag supported
if ls --group-directories-first &> /dev/null
  function ll --wraps ls --description "List contents of directory using long format"
    ls -lh --group-directories-first $argv
  end
end
