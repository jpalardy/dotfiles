
dirs  = $(shell awk '{print $$1}' deps)
bundle_tasks = $(dirs:%=bundle.%)

#-------------------------------------------------

all: $(bundle_tasks)

.deps.mk: deps
	@awk '{ \
		print ".PHONY: bundle." $$1; \
	  print "bundle." $$1 ":"; \
	  print "	@rm -rf", $$1; \
	  print "	git clone --depth=1", $$2, $$1; \
	  print "	@rm -rf", $$1 "/.git"; \
	  print "	@find", $$1, "-name .gitignore -exec rm {} \\;"; \
	  print ""; \
	  targets[NR] = $$1; \
	}' $< > $@

clean:
	rm -rf .deps.mk

reset: clean
	rm -rf $(dirs)

#-------------------------------------------------

-include .deps.mk

