
dirs  = $(shell awk '{print $$1}' deps)
bundle_tasks = $(dirs:%=bundle.%)

#-------------------------------------------------

all: $(bundle_tasks)

.deps.mk: deps
	@awk '{ \
	  print "bundle." $$1 ":"; \
		print "	@rm -rf", $$1; \
	  print "	git clone --quiet --depth=1", $$2, $$1; \
	  print "	rm -rf", $$1 "/.git", $$1 "/.gitignore", $$1 "/.github", $$1 "/.gitattributes", $$1 "/.gitmodules"; \
	  print ""; \
	}' $< > $@

clean:
	rm -rf .deps.mk

reset: clean
	rm -rf $(dirs)

#-------------------------------------------------

-include .deps.mk

