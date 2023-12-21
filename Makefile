
preview:
	@bash .setup.bash

diff:
	@vimdiff ssh/config ~/.ssh/config

# -------------------------------------------------

.PHONY: TODO
TODO:
	if [ ! -e TODO ]; then rg --files | rg -v -e '^vim/pack/bundle' -e '^vim/colors' | shuf | tee TODO; fi
	vim $$(cat TODO) -c 'vsp TODO' -c 'wincmd t'

clean:
	rm -rf TODO

