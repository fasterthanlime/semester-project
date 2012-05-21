
.PHONY: report

report:
	pandoc -s report.md -o report.pdf

clean:
	rm -f report.pdf
