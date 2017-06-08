
.PHONY: all open clean
all: report.html

%.html: %.Rmd
	R --vanilla --quiet -e 'rmarkdown::render("$<")'

open: report.html
	open $^

clean:
	rm -f report.html

