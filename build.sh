 rm *.aux
 rm *.log
 rm *.out 
 rm *.toc
 rm main.pdf

 pdflatex -synctex=1 -interaction=nonstopmode main.tex 
 biber main.tex
 pdflatex -synctex=1 -interaction=nonstopmode main.tex
 pdflatex -synctex=1 -interaction=nonstopmode main.tex
 
 # mv main.pdf relatorio.pdf
 
 # open relatorio.pdf
 
 rm *.aux
 rm *.log
 rm *.out 
 rm *.toc
 