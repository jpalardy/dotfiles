
# $< -- first dependency
# $^ -- all dependencies

#-------------------------------------------------
# sample rule
#-------------------------------------------------

RMDs = $(wildcard *.Rmd)
HTMLs = $(RMDs:.Rmd=.html)

%.html: %.Rmd
	R --vanilla --quiet -e 'rmarkdown::render("$<")'

.PHONY: build
build: $(HTMLs)

.PHONY: clean
clean:
	rm -f report.html

#-------------------------------------------------
# 99% makefile -- http://nuclear.mutantstargoat.com/articles/make/
#-------------------------------------------------

src = $(wildcard *.c)
obj = $(src:.c=.o)

LDFLAGS = -lGL -lglut -lpng -lz -lm

myprog: $(obj)
	$(CC) -o $@ $^ $(LDFLAGS)

.PHONY: clean
clean:
	rm -f $(obj) myprog

#-------------------------------------------------
# making some targets as intermediate, for cleanup
#-------------------------------------------------

# details https://www.gnu.org/software/make/manual/html_node/Chained-Rules.html

.INTERMEDIATE: whatever
.PRECIOUS: whatever
# .SECONDARY: whatever

#-------------------------------------------------
# generated auto-include
#-------------------------------------------------

dep = $(obj:.o=.d)

-include $(dep)     # include all dep files in the makefile

%.d: %.c
	@$(CPP) $(CFLAGS) $< -MM -MT $(@:.d=.o) >$@

#-------------------------------------------------
# subdir make
#-------------------------------------------------

libfoo:
	$(MAKE) -C libs/foo

#-------------------------------------------------
# required VAR
#-------------------------------------------------

ifndef VAR
$(error VAR is not set)
endif

#-------------------------------------------------
# other tips:
# Your Makefiles are wrong | Jacob Davis-Hansson
#   https://tech.davis-hansson.com/p/make/
#-------------------------------------------------

SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.ONESHELL:
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules  # maybe ...

