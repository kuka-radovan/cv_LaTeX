# My personal CV in LaTeX

## Preparation in Mac OS X

1. install [BasicTeX](http://www.tug.org/mactex/morepackages.html)
```
brew cask install basictex
```
> it will be probably necessary to add `texbin` to system `PATH` manually
`export PATH="$PATH:/Library/TeX/Distributions/Programs/texbin"`

2. instal packages:
```
	sudo tlmgr install multirow
	sudo tlmgr install ucharcat
	sudo tlmgr install unicode-math
	sudo tlmgr install fontawesome
	sudo tlmgr install textpos
	sudo tlmgr install enumitem
	sudo tlmgr install lm-math
```

3. install fonts:
	- [fontawesome](http://fortawesome.github.io/Font-Awesome/)
	- Helvetica Neue LT Std

4. run command
```
	xelatex cv.tex
```
> It should be run 2 times to generate also graphic
