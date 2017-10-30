bundle.ale:
	@rm -rf ale
	git clone --depth=1 https://github.com/w0rp/ale.git ale
	@rm -rf ale/.git
	@find ale -name .gitignore | xargs rm

bundle.fugitive:
	@rm -rf fugitive
	git clone --depth=1 https://github.com/tpope/vim-fugitive.git fugitive
	@rm -rf fugitive/.git
	@find fugitive -name .gitignore | xargs rm

bundle.gnupg:
	@rm -rf gnupg
	git clone --depth=1 https://github.com/jamessan/vim-gnupg.git gnupg
	@rm -rf gnupg/.git
	@find gnupg -name .gitignore | xargs rm

bundle.nerdcommenter:
	@rm -rf nerdcommenter
	git clone --depth=1 https://github.com/scrooloose/nerdcommenter.git nerdcommenter
	@rm -rf nerdcommenter/.git
	@find nerdcommenter -name .gitignore | xargs rm

bundle.slime:
	@rm -rf slime
	git clone --depth=1 https://github.com/jpalardy/vim-slime slime
	@rm -rf slime/.git
	@find slime -name .gitignore | xargs rm

bundle.spacehi:
	@rm -rf spacehi
	git clone --depth=1 https://github.com/jpalardy/spacehi.vim.git spacehi
	@rm -rf spacehi/.git
	@find spacehi -name .gitignore | xargs rm

bundle.tabular:
	@rm -rf tabular
	git clone --depth=1 https://github.com/godlygeek/tabular.git tabular
	@rm -rf tabular/.git
	@find tabular -name .gitignore | xargs rm

.PHONY: bundle.ale bundle.fugitive bundle.gnupg bundle.nerdcommenter bundle.slime bundle.spacehi bundle.tabular

