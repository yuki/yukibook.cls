# yukibook.cls
**yukibook.cls** is a LaTeX class to create textbooks with some custom features. See the file yukibook.pdf to see an example of what you can do with this class.

## How to use the class
You can see the the file **yukibook.tex** to see how to use the class. This is the minimum file:

```
\documentclass{yukibook}
\begin{document}

\yukibook{The Title \linebreak of the Book} 	% Title, you can use "\linebreak" in it
  {Your Name}  % Author
  {2021-2022}    % Year
  {The name \linebreak of the degree} % Name of degree
  {\textquote{A very good phrase for a very good book}}	% catch phrase
  {The phrase's author}	% the phrase's author
  {img/cover.png} % the image used in the cover
  {28436c} %color in HTML format
  {} % mini_title (used if you want to create cusom conditionals with text)

\part{Part 1}
\chapter{Chapter 1}
Here your content...

\section{Section 1}
Here your content...

\end{document}
```

The "**\yukibook**" class has 9 parameters:
1. The Title of the book
2. The author
3. Year
4. The name of the degree
5. A catch phrase
6. The phrase's author
7. The image of the cover
8. Color in HTML format for the cover and the titles
9. This a custom minititle that I use in my book to add conditional content

Copy the **img** directory, because the "seal.png" is used in the second page.


## How to create the PDF
To create the PDF, because of the need of the external dependencies, we need to use the **-shell-scape** parameter:

`pdflatex -shell-escape yukibook.tex`

### LaTeX Dependencies
In order to create the pdf you need all the dependencies the class needs. All of them should be installed with your LaTeX distribution:

- adjustbox
- babel
- blindtext
- caption
- csquotes
- enumitem
- extdash
- fancyhdr
- fontawesome5
- geometry
- graphicx
- href-ul
- hyperref
- hyphenat
- inputenc
- pifont
- pmboxdraw
- sourcecodepro
- sourcesanspro
- tcolorbox
- tikz
- titlesec
- wrapfig
- xcolor

### External dependencies
The package **minted** needs needs the [pygmentize](https://pygments.org/ "pygmentize") CLI program to work. Be sure to have it installed before using the class.
