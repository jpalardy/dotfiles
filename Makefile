
preview:
	@bash .setup.bash $$FLAGS

diff:
	@vimdiff ssh/config ~/.ssh/config

# -------------------------------------------------

TODO:
	if [ ! -e TODO ]; then rg --files | rg -v -e '^vim/pack/bundle' -e '^vim/colors' | shuf | tee TODO; fi
	vim $$(cat TODO) -c 'vsp TODO' -c 'wincmd t'

