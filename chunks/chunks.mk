
# $< -- first dependency
# $^ -- all dependencies

#-------------------------------------------------
# sample rule
#-------------------------------------------------

%.html: %.Rmd
	R --vanilla --quiet -e 'rmarkdown::render("$<")'

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

