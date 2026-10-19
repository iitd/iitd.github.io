PANDOC=pandoc

all: reflectionsOnTrustingTrust.html

%.html: %.md my_style.theme Makefile
	$(PANDOC) $< --highlight-style my_style.theme -o $@

my_style.theme:
	$(PANDOC) --print-highlight-style pygments > $@

clean::
	rm -f *.html *.theme
