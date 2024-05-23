TEX=texfot pdflatex -shell-escape -synctex=1 -file-line-error
BIB=biber
GLS=makeglossaries
PDFVIEWER=open

CLASSIC_FILE=ClassicThesis
PAPER_FILE=PaperThesis
ARXIV_FILE=main
EXTERNAL_GRAPHICS=Graphics
TIKZDIR=Tikz
TMPTIKZ=TikzTmp
TEMPLATE=fig_standalone_template

TIKZ_FIGURES=$(wildcard $(TIKZDIR)/*.tex)
TIKZ=$(TIKZ_FIGURES:$(TIKZDIR)/%=%)
TIKZ_FIGS_EXT_PDF=$(TIKZ:%.tex=$(FIGURES_EXT)/%.pdf)

.PHONY: all clean

all: figures paper classic

figures: $(TIKZ_FIGS_EXT_PDF)
	@echo ---------Preparing Tikz Figures---------
	-mv $(shell find $(TMPTIKZ) -name "*.pdf" -type f) $(EXTERNAL_GRAPHICS)

$(FIGURES_EXT)/%.pdf: $(TEMPLATE).tex $(TIKZDIR)/%.tex
	@echo - Compiling Figure $*
	sed 's/FIGURENAME/$*/g' $(TEMPLATE).tex > $(TEMPLATE)_tmp_$*.tex
	$(TEX) $(TEMPLATE)_tmp_$*.tex
	rm -f $(TEMPLATE)_tmp_$*.*
	rm -f $(TEMPLATE)_tmp_*.bib
	rm -f $(FIGURES_EXT)/*.bib

classic:
	@echo --------Compiling ClassicThesis---------
	$(TEX) $(CLASSIC_FILE)
	$(BIB) $(CLASSIC_FILE)
	# $(GLS) $(CLASSIC_FILE)
	$(TEX) $(CLASSIC_FILE)
	$(TEX) $(CLASSIC_FILE)

paper:
	@echo ---------Compiling PaperThesis----------
	$(TEX) $(PAPER_FILE)
	$(BIB) $(PAPER_FILE)
	$(TEX) $(PAPER_FILE)
	$(TEX) $(PAPER_FILE)

clean:
	@echo ----------------Cleanup-----------------
	-rm -f $(shell find . -name "*.aux" -type f)
	-rm -f $(shell find . -name "*.auxlock" -type f)
	-rm -f $(shell find . -name "*.acn" -type f)
	-rm -f $(shell find . -name "*.acr" -type f)
	-rm -f $(shell find . -name "*.alg" -type f)
	-rm -f $(shell find . -name "*.glg" -type f)
	-rm -f $(shell find . -name "*.glo" -type f)
	-rm -f $(shell find . -name "*.gls" -type f)
	-rm -f $(shell find . -name "*.glsdef" -type f)
	-rm -f $(shell find . -name "*.ist" -type f)
	-rm -f $(shell find . -name "*.log" -type f)
	-rm -f $(shell find . -name "*.lof" -type f)
	-rm -f $(shell find . -name "*.bbl" -type f)
	-rm -f $(shell find . -name "*.lot" -type f)
	-rm -f $(shell find . -name "*.out" -type f)
	-rm -f $(shell find . -name "*.toc" -type f)
	-rm -f $(shell find . -name "*.bcf" -type f)
	-rm -f $(shell find . -name "*.run.xml" -type f)
	-rm -f $(shell find . -name "*.blx.bib" -type f)
	-rm -f $(shell find . -name "*.synctex.gz" -type f)
	-rm -f $(shell find . -name "*.fls" -type f)
	-rm -f $(shell find . -name "*.fdb_latexmk" -type f)
	-rm -f $(shell find . -name "*.dvi" -type f)
	-rm -f $(shell find . -name "*.lol" -type f)
	-rm -f $(shell find . -name "*.blg" -type f)
	-rm -f $(shell find . -name "*.nav" -type f)
	-rm -f $(shell find . -name "*.snm" -type f)
	-rm -f $(shell find . -name "*.dep" -type f)
	-rm -f $(shell find . -name "*.dpth" -type f)
	-rm -f $(shell find . -name "*.md5" -type f)
	-rm -f $(shell find . -name "*.bkp" -type f)

view:
	@echo --------------Opening PDFs--------------
	$(PDFVIEWER) $(CLASSIC_FILE).pdf&
	$(PDFVIEWER) $(PAPER_FILE).pdf&

arxiv: paper
	@echo ---Preparing arXiv submission folder----
	mkdir -p ax
	# Expand your paper contents into a single tex file and inline the bbl needed
	# by arxiv.
	latexpand $(PAPER_FILE).tex --biber $(PAPER_FILE).bbl --output ax/$(ARXIV_FILE).tex
	./copy_figures.sh
	sed -e 's/Graphics\///g' -i .bkp ax/$(ARXIV_FILE).tex
	@echo "\033[0;31m Please compile ax/main.tex manually and inspect the PDF for correctness \033[0m"

submission: arxiv clean
	@echo -----Packing archive for submission-----
	-rm -f ax/$(ARXIV_FILE).pdf
	tar -C ax -cvvf ax.tar . 
