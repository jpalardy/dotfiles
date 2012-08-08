
dirs  = $(shell awk '{print $$1}' deps)
clone = git clone --depth=1

#-------------------------------------------------

all: $(dirs)

clean:
	rm -rf $(dirs)

#-------------------------------------------------

depend:
	@awk '{ \
	  print $$1 ":"; \
	  print "	@rm -rf", $$1; \
	  print "	git clone --depth=1", $$2, $$1; \
	  print "	@rm -rf", $$1 "/.git"; \
	  print "	@find", $$1, "-name .gitignore | xargs rm"; \
	  print ""; \
	  targets[NR] = $$1; \
	} \
	END { \
	  printf ".PHONY:"; \
	  for (i=1; i<=NR; i++) { printf " %s", targets[i] } \
	  printf "\n\n"; \
	}' deps > deps.mk

#-------------------------------------------------

include deps.mk

