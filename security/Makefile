PANDOC=pandoc

all: lecture1.html lecture2.html lecture3.html lecture4.html lecture5.html lab-setup.html 

%.html: %.md my_style.theme Makefile
	$(PANDOC) $< --highlight-style my_style.theme -o $@

my_style.theme:
	$(PANDOC) --print-highlight-style pygments > $@

clean::
	rm -f *.html *.theme
