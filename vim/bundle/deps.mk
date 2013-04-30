matchit:
	@rm -rf matchit
	git clone --depth=1 https://github.com/vim-scripts/matchit.zip.git matchit
	@rm -rf matchit/.git
	@find matchit -name .gitignore | xargs rm

nerdcommenter:
	@rm -rf nerdcommenter
	git clone --depth=1 https://github.com/scrooloose/nerdcommenter.git nerdcommenter
	@rm -rf nerdcommenter/.git
	@find nerdcommenter -name .gitignore | xargs rm

tabular:
	@rm -rf tabular
	git clone --depth=1 https://github.com/godlygeek/tabular.git tabular
	@rm -rf tabular/.git
	@find tabular -name .gitignore | xargs rm

coffee-script:
	@rm -rf coffee-script
	git clone --depth=1 https://github.com/kchmck/vim-coffee-script.git coffee-script
	@rm -rf coffee-script/.git
	@find coffee-script -name .gitignore | xargs rm

fugitive:
	@rm -rf fugitive
	git clone --depth=1 https://github.com/tpope/vim-fugitive.git fugitive
	@rm -rf fugitive/.git
	@find fugitive -name .gitignore | xargs rm

json:
	@rm -rf json
	git clone --depth=1 https://github.com/leshill/vim-json.git json
	@rm -rf json/.git
	@find json -name .gitignore | xargs rm

slime:
	@rm -rf slime
	git clone --depth=1 https://github.com/jpalardy/vim-slime slime
	@rm -rf slime/.git
	@find slime -name .gitignore | xargs rm

spacehi:
	@rm -rf spacehi
	git clone --depth=1 https://github.com/jpalardy/spacehi.vim.git spacehi
	@rm -rf spacehi/.git
	@find spacehi -name .gitignore | xargs rm

puppet:
	@rm -rf puppet
	git clone --depth=1 https://github.com/rodjek/vim-puppet.git puppet
	@rm -rf puppet/.git
	@find puppet -name .gitignore | xargs rm

clojure:
	@rm -rf clojure
	git clone --depth=1 https://github.com/vim-scripts/VimClojure.git clojure
	@rm -rf clojure/.git
	@find clojure -name .gitignore | xargs rm

syntastic:
	@rm -rf syntastic
	git clone --depth=1 https://github.com/scrooloose/syntastic.git syntastic
	@rm -rf syntastic/.git
	@find syntastic -name .gitignore | xargs rm

less:
	@rm -rf less
	git clone --depth=1 https://github.com/groenewege/vim-less.git less
	@rm -rf less/.git
	@find less -name .gitignore | xargs rm

gnupg:
	@rm -rf gnupg
	git clone --depth=1 https://github.com/jamessan/vim-gnupg.git gnupg
	@rm -rf gnupg/.git
	@find gnupg -name .gitignore | xargs rm

go:
	@rm -rf go
	git clone --depth=1 https://github.com/jnwhiteh/vim-golang.git go
	@rm -rf go/.git
	@find go -name .gitignore | xargs rm

jade:
	@rm -rf jade
	git clone --depth=1 https://github.com/digitaltoad/vim-jade.git jade
	@rm -rf jade/.git
	@find jade -name .gitignore | xargs rm

.PHONY: matchit nerdcommenter tabular coffee-script fugitive json slime spacehi puppet clojure syntastic less gnupg go jade

