# This is a very useful command for replacing 'old_thing' with 'new_thing' for all files in current directory:
#      find . -type f | xargs perl -pi -e 's/old_thing/new_thing/g'
#

PAPER = jzus-sync
DIFF = 1479371

.PHONY: plots figs dvi ps pdf diff spell

all:	pdf

%.dvi:	%.tex plots figs
	latex $<
	bibtex $* | grep --color -E "Warning|Missing|$$"
	latex $<
	latex $< | grep --color=auto -i -E "Warning|Missing|overfull|underfull"


%.ps:	%.dvi
	dvips -Ppdf -Pcmz -Pamz -tletter -D 600 -G0 -o $@ $<
#	cat $(PAPER).ps | /usr/bin/psnup -2 > out.ps

%.pdf:	%.ps
	ps2pdf14 -dEmbedAllFonts=true -dPDFSETTINGS=/prepress $<

plots:	
	$(MAKE) -C graphs

figs:	
	$(MAKE) -C pics

#v:	$(PAPER).dvi
#	xdvi $(PAPER).dvi &

v:	$(PAPER).ps
	gv $(PAPER).ps &

dvi:	$(PAPER).dvi

ps:	$(PAPER).ps

pdf: 	$(PAPER).pdf


backup: 
#	cp -a * $(BACKUP_DIRECTORY)
	scp * $(REMOTE_DIRECTORY2)
	scp * $(REMOTE_DIRECTORY)

$(PAPER).tex.$(DIFF):
	git show $(DIFF):$(PAPER).tex > $(PAPER).tex.$(DIFF)

$(PAPER)-diff.tex: $(PAPER).tex $(PAPER).tex.$(DIFF)
	./bin/latexdiff-fast  $(PAPER).tex.$(DIFF) $(PAPER).tex > $(PAPER)-diff.tex

diff:	clean-diff $(PAPER)-diff.pdf
	mv $(PAPER)-diff.pdf $(PAPER).pdf
	rm $(PAPER)-diff.* $(PAPER).tex.$(DIFF)

spell:	$(PAPER).tex
	hunspell -t $<

html:
	latex2html -split 0 -show_section_numbers -local_icons $(PAPER).tex 

reverse: 
	scp * $(HOME_DIRECTORY)

clean-diff:
	rm -f $(PAPER)-diff.* 
clean:
	rm -f *.ps *.pdf $(PAPER).log $(PAPER).bbl $(PAPER).toc $(PAPER).blg $(PAPER).dvi $(PAPER).aux *.log *~

veryclean: clean
	$(MAKE) -C graphs clean
	$(MAKE) -C figs clean
