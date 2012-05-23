
.PHONY: report excerpts

report: excerpts
	pandoc -s report.md -H header.tex -o report.pdf
	
excerpts:
	./build-excerpts

preview: report
	xdg-open report.pdf

clean:
	rm -f report.pdf
