
.PHONY: report

report:
	pandoc report.md -o report.pdf

clean:
	rm -f report.pdf
