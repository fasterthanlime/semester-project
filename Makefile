
.PHONY: report excerpts

report: excerpts
	pandoc -s report.md -H header.tex -V fontsize=12pt -V "author=Amos Wenger" -V "title=Semester Project" --toc -o report.pdf
	
excerpts:
	./build-excerpts

preview: report
	xdg-open report.pdf

clean:
	rm -f report.pdf
