###########################################################
#
# Makefile for LaTeX docs
#
# $Id: 
#

.SUFFIXES:
.SUFFIXES: .ps .dvi .tex

TEXINPUTS := .:${TEXINPUTS}
BIBINPUTS := .:${TEXINPUTS}

# Figures
PRNS =			$(wildcard *.prn)
PDFS :=			$(addsuffix .pdf, $(basename $(PRNS)))
VISIOEPSES :=		$(addsuffix .eps, $(basename $(PRNS)))
SHRINK =		shrink.sh


all: pdf
#all: eps dvi ps pdf # res
eps: fig obj ${VISIOEPSES}

PAPER=faq

pdf: $(PAPER).pdf

eqchecker.pdf: ddec_example_prog1_tfg.eps ddec_example_prog2_tfg.eps ddec_example_full_prod.eps

clean:
	$(RM) *.aux *.log *.bbl *.blg *~ *.out *.eps *-eps-converted-to.pdf \#*\# *.toc *.idx
	$(RM) $(patsubst %.tex, %.ps, $(wildcard *.tex))
	$(RM) $(patsubst %.tex, %.tmp.ps, $(wildcard *.tex))
	$(RM) $(patsubst %.tex, %.dvi, $(wildcard *.tex))
	$(RM) $(patsubst %.tex, %.pdf, $(wildcard *.tex))

distclean: clean
	$(RM) $(patsubst %.fig, %.eps, $(wildcard *.fig))
	$(RM) $(patsubst %.obj, %.eps, $(wildcard *.obj))

tarball: $(PAPER).tgz

%.pdf: %.tex $(wildcard *.bib)
	pdflatex $< -o $@
	#bibtex $*
	pdflatex $< -o $@
	pdflatex $< -o $@

%.eps: %.dot
	dot -Tps:cairo -Nfontname=helvetica $< -o $@
