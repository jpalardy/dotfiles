
preview:
	@bash .setup.bash

diff:
	@vimdiff ssh/config ~/.ssh/config

# -------------------------------------------------

.PHONY: TODO
TODO:
	if [ ! -e TODO ]; then rg --files | rg -v -e '^vim/pack/bundle' -e '^vim/colors' -e '^TODO' | shuf > TODO; fi
	vim $$(cat TODO) -c 'vsp TODO'

clean:
	rm -rf TODO

