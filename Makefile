
preview:
	@bash .setup.bash
	@bash .setup-xdg.bash
	@diff -q ssh/config ~/.ssh/config || exit 0

run:
	@bash .setup.bash | bash
	@bash .setup-xdg.bash | bash

ssh-diff:
	@vimdiff ssh/config ~/.ssh/config

