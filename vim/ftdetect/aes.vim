
autocmd BufReadPre   *.aes set viminfo=
autocmd BufReadPre   *.aes set noswapfile

autocmd BufReadPost  *.aes let $vimpass = inputsecret("Password: ")
autocmd BufReadPost  *.aes silent '[,']!openssl enc -d -aes-256-cbc -a -salt -pass pass:$vimpass

autocmd BufWritePre  *.aes silent '[,']!openssl enc -e -aes-256-cbc -a -salt -pass pass:$vimpass

autocmd BufWritePost *.aes u

