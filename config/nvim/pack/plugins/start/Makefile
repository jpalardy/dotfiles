
dirs = $(shell awk '{print $$1}' deps)

#-------------------------------------------------

all: $(dirs)

.deps.mk: deps
	@awk '{ \
	  print $$1 ":"; \
		print "	@rm -rf", $$1; \
	  print "	git clone --quiet --depth=1", $$2, $$1; \
	  print "	rm -rf", $$1 "/.git", $$1 "/.gitignore", $$1 "/.github", $$1 "/.gitattributes", $$1 "/.gitmodules", $$1 "/test*", $$1 "/scripts", $$1 "/doc", $$1 "/assets"; \
	  print ""; \
	}' $< > $@

clean:
	rm -rf .deps.mk

reset: clean
	rm -rf $(dirs)

-include .deps.mk

