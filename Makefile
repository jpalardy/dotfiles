
preview:
	@bash .setup.bash

diff:
	@vimdiff ssh/config ~/.ssh/config

TODO:
	rg --files | rg -v -e '^vim/pack/bundle' -e '^vim/colors' -e '^TODO' | shuf > $@

