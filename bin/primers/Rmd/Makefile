
%.html: %.Rmd
	R --vanilla --quiet -e 'rmarkdown::render("$<")'

.PHONY: build
build: report.html

.PHONY: clean
clean:
	rm -f report.html

