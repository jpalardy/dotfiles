
preview:
	@bash .setup.bash $$FLAGS

.PHONY: TODO
TODO:
	if [ ! -e TODO ]; then rg --files | rg -v -e '^config/nvim/pack/' -e '^vim/colors' | shuf | tee TODO; fi
	vim $$(cat TODO) -c 'vsp TODO' -c 'wincmd t'

