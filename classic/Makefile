TEX=texfot pdflatex -shell-escape -synctex=1 -file-line-error
BIB=biber
GLS=makeglossaries
PDFVIEWER=open

MAIN_FILE=ClassicThesis

.PHONY: all clean

all:
	$(TEX) $(MAIN_FILE)
	$(BIB) $(MAIN_FILE)
	# $(GLS) $(MAIN_FILE)
	$(TEX) $(MAIN_FILE)
	$(TEX) $(MAIN_FILE)

clean:
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

view:
	$(PDFVIEWER) $(MAIN_FILE).pdf&
