PANDOC=pandoc

all: reflectionsOnTrustingTrust.html

%.html: %.md my_style.theme Makefile
	$(PANDOC) $< -s --metadata pagetitle=$* --mathjax=https://cdn.jsdelivr.net/npm/mathjax@3.2.2/es5/tex-mml-chtml.js --highlight-style my_style.theme -o $@

my_style.theme:
	$(PANDOC) --print-highlight-style pygments > $@

clean::
	rm -f *.html *.theme
