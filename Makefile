
preview:
	@bash .setup.bash
	@bash .setup-xdg.bash

run:
	@bash .setup.bash | bash
	@bash .setup-xdg.bash | bash

