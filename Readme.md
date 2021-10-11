# My personal CV in LaTeX

## Preparation in Mac OS X

1. install [BasicTeX](http://www.tug.org/mactex/morepackages.html)

```
brew install --cask basictex
```

> it will be probably necessary to add `texbin` to system `PATH` manually
> `export PATH="$PATH:/Library/TeX/Distributions/Programs/texbin"`

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

   - [fontawesome5](https://fontawesome.com/)
     `sudo tlmgr install fontawesome5`

   - [Helvetica Neue LT Std](https://freefontsdownload.net/free-helveticaneueltstdultltcno-font-135781.htm)

4. run command

```
	xelatex cv.tex
```

> It should be run 2 times to generate also graphic
