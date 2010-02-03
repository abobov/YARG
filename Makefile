INPUT = resume.xml

OUTPUT_TXT = resume.txt
OUTPUT_RTF = resume.rtf
OUTPUT_HTML = resume.html
OUTPUT_TEX = resume.tex
OUTPUT = $(OUTPUT_TXT) $(OUTPUT_RTF) $(OUTPUT_HTML) $(OUTPUT_TEX)

XSL_TXT = resume2txt.xsl
XSL_RTF = resume2rtf.xsl
XSL_HTML = resume2html.xsl
XSL_TEX  = resume2tex.xsl

WRAP_COMMAND = fmt -sw 72

all: $(OUTPUT)

$(OUTPUT_TXT): $(XSL_TXT) $(INPUT)
	xsltproc $^ | $(WRAP_COMMAND) > $@

$(OUTPUT_RTF): $(XSL_RTF) $(INPUT)
	xsltproc $^ > $@

$(OUTPUT_HTML): $(XSL_HTML) $(INPUT)
	xsltproc $^ > $@

$(OUTPUT_TEX): $(XSL_TEX) $(INPUT)
	xsltproc $^ > $@
	# TODO Change pdflatex behaviour to raise error
	-pdflatex $@

validate: $(INPUT) $(INPUT:xml=dtd)
	@xmllint --valid --noout $(INPUT) && echo "Document valid"

clean:
	-rm $(OUTPUT) &>/dev/null
	-rm $(OUTPUT_TEX:tex=){log,aux,pdf} &>/dev/null

# vim: spell
