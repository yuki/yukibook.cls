\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{yukibook}[2021/11/24 Free LaTeX text book template]
\LoadClass[11pt,titlepage,twoside,openany,draft]{book}

%--------------------------------------------------------------------------
% Language
%--------------------------------------------------------------------------
\RequirePackage[spanish]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage{csquotes}

%--------------------------------------------------------------------------
% Geometry
%--------------------------------------------------------------------------
\RequirePackage[a4paper,margin=2cm,footskip=-0.5cm]{geometry}


%--------------------------------------------------------------------------
% Paragraph's style
%--------------------------------------------------------------------------
\setlength{\parindent}{0em} % identation
\setlength{\parskip}{1.2em}
\renewcommand{\baselinestretch}{1.4}


%--------------------------------------------------------------------------
% Fonts
%--------------------------------------------------------------------------
%\RequirePackage{kpfonts}
\RequirePackage[default]{sourcesanspro}
\RequirePackage{sourcecodepro}


%--------------------------------------------------------------------------
% TOC
%--------------------------------------------------------------------------
\renewcommand\@dotsep{200}

\renewcommand\tableofcontents{
  \begingroup
    \hypersetup{hidelinks} % hide links in TOC, too much blue in it

    \chapter*{\contentsname}
    \setcounter{tocdepth}{3}    % add to TOC subsubsections
    \setcounter{secnumdepth}{3} % add to subsubsections labels
    \setlength{\parskip}{0em}
      \@starttoc{toc}
    \setlength{\parskip}{1.2em}
  \endgroup
  \clearpage
}


%--------------------------------------------------------------------------
% Color definitions
%--------------------------------------------------------------------------
\RequirePackage{xcolor}
%\definecolor{headerscolor}{HTML}{023b80}
\definecolor{headerscolor}{HTML}{28436c}


%--------------------------------------------------------------------------
% Header and footer styling
%--------------------------------------------------------------------------
\RequirePackage{tikz}
\RequirePackage{fancyhdr}
\pagestyle{fancy}

\fancyhead{} % clear all header fields
\renewcommand{\headrulewidth}{0pt} %remove the header's rule

\fancyfoot{} % clear all footer fields
\fancyfoot[LE]{
  \begin{tikzpicture}
    \path [fill=headerscolor] (0, 0) rectangle (0.8, 0.8);
    \node [white] at (0.4,0.4) {\textbf{\thepage}};
  \end{tikzpicture}
  \begin{tikzpicture}
    \path (0, 0);
    \node at (0,0.35){\color{headerscolor}\footnotesize\textit{\@thetitle}};
  \end{tikzpicture}
}
\fancyfoot[RO]{
  \begin{tikzpicture}
    \path (0, 0);
    \node at (0,0.35){\color{headerscolor}\footnotesize\textit{\@thetitle}};
  \end{tikzpicture}
  \begin{tikzpicture}
    \path [fill=headerscolor] (0, 0) rectangle (0.8, 0.8);
    \node [white] at (0.4,0.4) {\textbf{\thepage}};
  \end{tikzpicture}
}

% TODO: change "\part"'s footer


%--------------------------------------------------------------------------
% Chapters and Titles definitions
%--------------------------------------------------------------------------
\RequirePackage{titlesec}

\titleclass{\chapter}{straight} % removes page break after new chapter

\titleformat{\chapter}[block]
  {\huge\bfseries\color{headerscolor}} % format of title
  {\thechapter. }                      % label before title
  {0pt} % length of separation between label and title
  {}    % before-code hook
\titlespacing{\chapter} {0pt}{0pt}{0pt} % with 0pt maintains \parskip space


\titleformat{\section}
	{\fontsize{16pt}{16pt}\bfseries\color{headerscolor}}
	{\thesection. }{0pt}{}
\titlespacing*{\section} {0pt}{0pt}{0pt}


\titleformat{\subsection}
	{\fontsize{14pt}{14pt}\bfseries\color{headerscolor}}
	{\thesubsection. }{0pt}{}
\titlespacing*{\subsection} {0pt}{0pt}{0pt}


\titleformat{\subsubsection}
	{\fontsize{12pt}{12pt}\bfseries\color{headerscolor}}
	{\thesubsubsection. }{0pt}{}
\titlespacing*{\subsubsection}{0pt}{0pt}{0pt}


\titleformat{\subparagraph}
	{\fontsize{12pt}{12pt}\color{headerscolor}}
	{\thesubsubsection. }{0pt}{}
\titlespacing*{\subparagraph}{0pt}{0pt}{-1em}


%--------------------------------------------------------------------------
% Links
%--------------------------------------------------------------------------
\RequirePackage[linktoc=all]{hyperref}
\urlstyle{same}
\hypersetup{
    colorlinks=true,
    allcolors=headerscolor,
    bookmarks=true,
    bookmarksopen=true
}
\RequirePackage{href-ul}


%--------------------------------------------------------------------------
% Colors
%--------------------------------------------------------------------------
\definecolor{code-bg-color}{HTML}{002b36}
\definecolor{inline-bg-color}{HTML}{202020}


%--------------------------------------------------------------------------
% Needed dependencies
%--------------------------------------------------------------------------
\RequirePackage{awesomebox}  % https://www.ctan.org/pkg/awesomebox
\RequirePackage{tcolorbox}
\tcbuselibrary{raster,fitting,minted,many,listings,breakable}
\usemintedstyle{friendly}
\setmintedinline[console]{style=native,bgcolor=inline-bg-color}


\RequirePackage{pmboxdraw} % for Systemctl's "box" unicode symbols
\RequirePackage{graphicx}
\RequirePackage{wrapfig}

\RequirePackage{caption}
\captionsetup{labelformat=empty,textfont={scriptsize}}

\RequirePackage{enumitem}
\setlist{topsep=-5pt}

%--------------------------------------------------------------------------
% Custom creations
%--------------------------------------------------------------------------
%% From Eisvogel pandoc-latex-template: https://github.com/Wandmalfarbe/pandoc-latex-template
\newtcolorbox{info-box}{
	colback=cyan!5!white,
	colframe=cyan!60!black
}
\newtcolorbox{warning-box}{
	colback=orange!5!white,
	colframe=orange!80!black
}
\newtcolorbox{error-box}{
	colback=red!5!white,
	colframe=red!75!black
}

\newtcblisting[auto counter,number within=section, list inside=mycommands]
  {mycode}[3]{
    listing only,adjusted title={#1}, listing engine=minted,minted language=#2,
    arc=2mm, breakable=true,enhanced jigsaw,
    minted options={fontsize=#3},colback=white,
    list entry={\protect\numberline{\thetcbcounter}#1}
}

%\newtcblisting[auto counter,number within=section, list inside=mycommands]
%  {mycode-fit}[4]{
%    listing only,adjusted title={#1}, listing engine=minted,minted language=#2,
%    arc=2mm, breakable=true,
%    fit to={\linewidth} and #4, enhanced jigsaw,
%    list entry={\protect\numberline{\thetcbcounter}#1}
%}

\newcommand{\itemimage}[6]{
  % #1 item text
  % #2 l / r : left or right position of the image
  % #3 size of the image
  % #4 image
  % #5 caption
  % #6 text
  \vspace{-1.7em}
  \parbox[t]{\dimexpr\textwidth-\leftmargin}{%
    \item[#1]
      \begin{wrapfigure}{#2}{#3\textwidth}
        \vspace{-12pt}
        \includegraphics[width=\linewidth]{#4}
        \vspace{-29pt}\caption{#5}\vspace{-30pt}
      \end{wrapfigure}
      \setlength{\parskip}{0.8em}
      #6
  }
}


%--------------------------------------------------------------------------
% for lorem ipsum
%--------------------------------------------------------------------------
\RequirePackage{blindtext}


%--------------------------------------------------------------------------
% Cover and insertion of table of contents
%--------------------------------------------------------------------------
\newcommand{\yukibook}[7]{

  \def\@thetitle{#1}
  \def\@theauthor{#2}
  \def\@theyear{#3}
  \def\@thedegree{#4}
  \def\@thephrase{#5}
  \def\@thephraseauthor{#6}
  \def\@thecoverpath{#7}

  \thispagestyle{empty}

  \newgeometry{margin=0pt}
  % Cover inspired by O'reilly books and from https://github.com/johnjohnlin/oreilly_cover
  \begin{tcolorbox}[
                boxrule=0mm,
                arc=0mm,
                colframe=headerscolor,
                colback=headerscolor,
                fit to={\paperwidth} and 2.5cm,
                fit basedim=130pt,
                halign=flush center,
                valign=center,
                top=1mm,bottom=1mm
              ]
      \color{white}\textbf{\textit{\@thedegree}}
  \end{tcolorbox}

  \begin{tcolorbox}[
                colframe=white,
                colback=white,
                fit to={\paperwidth} and 12.5cm,
                halign=flush center,
                valign=center,
                space to=\myspace,
              ]
      \includegraphics[height=13cm]{\@thecoverpath}
  \end{tcolorbox}

  \begin{tcolorbox}[
                boxrule=0mm,
                arc=0mm,
                colframe=headerscolor,
                colback=headerscolor,
                fit to={\paperwidth} and 8cm,
                fit basedim=130pt,
                halign=flush center,
                valign=center,
                top=1cm,bottom=1cm,
              ]
        \color{white}\textbf{\textit{\@thetitle}}
  \end{tcolorbox}

  \begin{tcolorbox}[
                boxrule=0mm,
                colframe=white,
                colback=white,
                fit to={\paperwidth} and 2cm,
                halign=flush right,
                valign=top,
                left=8cm,
                right=1cm
              ]
      \Large{\color{headerscolor}\textit{\@thephrase}} \\
      \small{\color{headerscolor}\textit{\@thephraseauthor}}
  \end{tcolorbox}

  \begin{tcolorbox}[
                boxrule=0mm,
                colframe=white,
                colback=white,
                fit to={\paperwidth} and 2.6cm,
                fit basedim=110pt,
                halign=flush left,
                left=1cm,
                valign=top
              ]
      \color{headerscolor}\textbf{\@theauthor} \linebreak
      \color{headerscolor}\textbf{\@theyear}
  \end{tcolorbox}

  \restoregeometry
  % Copyright page
  \null
  \vfill
  \begin{flushleft}
    \includegraphics[]{img/seal.png} \\
    Copyleft \textcopyright \ \@theauthor \\
    \vspace{5mm}
    \textbf{Licencia: } \href{https://creativecommons.org/licenses/by-sa/4.0/}{Creative Commons BY-SA 4.0} \\
    \vspace{5mm}
    Este libro se ha relizado teniendo en cuenta la cultura libre y puedes utilizarlo, modificarlo y compartirlo teniendo en cuenta la licencia Attribution-ShareAlike de \textbf{Creative Commons}.
    \vspace{5mm}
  \end{flushleft}

  \clearpage

  \tableofcontents

} % end of \yukibook
