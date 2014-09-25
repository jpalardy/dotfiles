
TabMacro '^require',    "^wwye^ivar \<esc>pa = "
TabMacro '{[a-z ,]\+}', '0f{ldi{i=substitute(substitute(@",", *",", ","g"),"\\([^, :]\\+\\)","\\1: \\1","g")'

