
dirs  = $(shell awk '{print $$1}' deps)
bundle_tasks = $(dirs:%=bundle.%)

#-------------------------------------------------

all: $(bundle_tasks)

.deps.mk: deps
	@awk '{ \
	  print "bundle." $$1 ":"; \
	  print "	@rm -rf", $$1; \
	  print "	git clone --quiet --depth=1", $$2, $$1; \
	  print ""; \
	}' $< > $@

clean:
	find . -mindepth 2 | rg '\.git(|hub|ignore)$$' | xargs --no-run-if-empty rm -rf
	rm -rf .deps.mk

reset: clean
	rm -rf $(dirs)

#-------------------------------------------------

-include .deps.mk

