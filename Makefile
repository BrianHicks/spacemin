install: init.el Cask Makefile
	cask install --verbose
	cask build --verbose
	touch -m $@
