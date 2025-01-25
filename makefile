all:
	pandoc -o win.html README.md -s --template="template.html"
