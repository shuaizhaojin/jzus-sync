SRC_DIR = ${shell find . -type d -print}
ROOT = $(CURDIR)

pltfiles = $(foreach sdir,$(SRC_DIR), $(wildcard $(sdir)/*.plt))
epsfiles = $(pltfiles:.plt=.eps)
pdffiles = $(pltfiles:.plt=.pdf)

all:    $(epsfiles)

%.eps:	%.plt
	-cd $(<D) && cat $(CURDIR)/gnuplot.head $(<F) | sed 's#{output}#$(@F)#' | gnuplot > $(@F)
	../bin/fixbb $@
#	cp $@ .
#
slides:	$(pdffiles)

%.pdf:	%.plt
	-cd $(<D) && cat $(CURDIR)/slides.head $(<F) | sed 's#{output}#$(@F)#' | gnuplot > $(@F)
	../bin/fixbb $@
	-mv $@ .


			
clean:
	rm -f $(epsfiles)
	rm -f *.eps *.pdf
	#cd .. && rm -f $(notdir $(epsfiles))

#%.eps:	%.plt
#	cat gnuplot.head $< | sed 's/{output}/$@/' | gnuplot
#	mv $@ ..
