
preview:
	@bash .setup.bash
	@bash .setup-xdg.bash
	@diff -q ssh/config ~/.ssh/config

run:
	@bash .setup.bash | bash
	@bash .setup-xdg.bash | bash

ssh-diff:
	@vimdiff ssh/config ~/.ssh/config

