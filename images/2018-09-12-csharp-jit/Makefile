SHELL := bash

.PRECIOUS: %.tex %.pdf

all: mini-runtime.0.svg mini-runtime.1.svg mini-runtime.2.svg

%.svg: %.pdf
	pdf2svg $< $@

%.pdf: %.tex
	latex-mk --pdflatex $< || latexmk --pdf $<

%.tex: mini-runtime.tex
	sed "s/##VERSION##/$(subst .,,$(suffix $(basename $@)))/g" $< > $@

