
.PHONY: report excerpts

report: excerpts graphs
	pandoc -s report.md -H header.tex -V fontsize=12pt -V "documentclass=article" --toc --reference-links -o report.pdf

slides: excerpts
	pandoc -s -t beamer -H header-slides.tex slides.md -o slides.pdf
	
excerpts:
	./build-excerpts

graphs:
	./build-graphs

preview: report
	xdg-open report.pdf

clean:
	rm -f report.pdf
