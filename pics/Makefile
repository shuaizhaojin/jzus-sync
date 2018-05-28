VPATH = ../

figfiles = $(wildcard *.fig)
epsfiles = $(figfiles:.fig=.eps)

all:	$(epsfiles)

%.eps:	%.fig
	@echo \*
	@echo \* Converting $<
	@echo \*
	../bin/figfrag $<

clean:
	rm -f $(epsfiles)
