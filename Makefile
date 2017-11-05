CONVERT=convert

all: cheatsheet.pdf cheatsheet.png cheatsheet-thumb.png

clean:
	rm -f cheatsheet.pdf cheatsheet.out

cheatsheet.pdf: cheatsheet.tex
	pdflatex cheatsheet.tex
	rm -f cheatsheet.aux cheatsheet.log cheatsheet.out

cheatsheet.png: cheatsheet.pdf
	$(CONVERT) -density 100x100 +adjoin cheatsheet.pdf cheatsheet-%d.png

cheatsheet-thumb.png: cheatsheet.pdf
	$(CONVERT) -density 32x32 +adjoin cheatsheet.pdf cheatsheet-thumb-%d.png
