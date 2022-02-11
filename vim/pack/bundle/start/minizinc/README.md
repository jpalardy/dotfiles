vim-minizinc
============

Simple vim-Bundle for syntax highlighting for minizinc files and Gringo ASP files. Detects .mzn, .fzn, .dzn and .lp files. 
The definition of the syntax for vim is taken from the official minizinc-1.6 distribution. 

## Installation

### vim-plug 

https://github.com/junegunn/vim-plug

Add the line inbetween `call plug#begin()` and `call plug#end()` in `.config/nvim/init.vim`

```
Plug 'vale1410/vim-minizinc'
```

### Vundle 

Ensure you have [Vundle](https://github.com/gmarik/Vundle.vim) installed.
Ensure your ~/.vimrc file contains the following plugin line:

```
Plugin 'vale1410/vim-minizinc'
```

To install to vim add this line: 

```
$ vim +PluginInstall +qall
```

### References

For the original highlighting sources and target languages see: 

* http://www.minizinc.org/
* http://potassco.sourceforge.net/
* https://github.com/vale1410/bule
