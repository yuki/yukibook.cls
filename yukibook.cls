%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Yuki's LaTeX template for textbooks.
%
% Authors:
%   Rubén Gómez Olivencia (rugoli@gmail.com)
%     https://twitter.com/rugoli
%     https://github.com/yuki/yukibook.cls
%
% License:
%   CC BY-SA 4.0 (https://creativecommons.org/licenses/by-sa/4.0/)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------
% Class configuration
%--------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{yukibook}[2021/11/24 Yuki's template for textbooks]
\LoadClass[11pt,titlepage,twoside,openany,draft]{book}

%--------------------------------------------------------------------------
% Language
%--------------------------------------------------------------------------
\RequirePackage[spanish]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage{csquotes}
\RequirePackage{pifont}
\RequirePackage[none]{hyphenat}
\sloppy

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
\RequirePackage{fontspec}
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
\RequirePackage[table]{xcolor}
\definecolor{inline-bg-color}{HTML}{404040}

\definecolor{error-color}{HTML}{9e0000}

%--------------------------------------------------------------------------
% For tables
%--------------------------------------------------------------------------

\RequirePackage{tabularray}
\UseTblrLibrary{varwidth}
\SetTblrInner{
    vlines,
    hlines,
}
\NewTblrEnviron{yukitblr}
\SetTblrInner[yukitblr]{
    vlines,
    hlines,
    row{odd} = {headerscolor!10},
    row{1} = {bg=headerscolor,fg=white,font=\bfseries},
    cells={c,m},
    rowhead=1, %repeat head in new page
}

\SetTblrOuter[yukitblr]{
    long,
    label=none,
}

\DefTblrTemplate{contfoot-text}{default}{Continúa en la siguiente página}
\DefTblrTemplate{conthead-text}{default}{}
\DefTblrTemplate{caption}{default}{}
\DefTblrTemplate{conthead}{default}{}
\DefTblrTemplate{capcont}{default}{}


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
  \end{tikzpicture}}

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
    {\thesection. }
    {0pt}
    {}
\titlespacing*{\section} {0pt}{0pt}{0pt}


\titleformat{\subsection}
    {\fontsize{14pt}{14pt}\bfseries\color{headerscolor}}
    {\thesubsection. }
    {0pt}
    {}
\titlespacing*{\subsection} {0pt}{0pt}{0pt}


\titleformat{\subsubsection}
    {\fontsize{12pt}{12pt}\bfseries\color{headerscolor}}
    {\thesubsubsection. }
    {0pt}
    {}
\titlespacing*{\subsubsection}{0pt}{0pt}{0pt}


\titleformat{\paragraph}
    {\fontsize{11pt}{11pt}\bfseries\color{headerscolor}}
    {\theparagraph. }
    {0pt}
    {\uline}
\titlespacing*{\paragraph}{0pt}{0pt}{-1em}


%--------------------------------------------------------------------------
% Links
%--------------------------------------------------------------------------
\RequirePackage[linktoc=all]{hyperref}
\urlstyle{same}
\hypersetup{
    colorlinks=true,
%    allcolors=headerscolor,
%    bookmarks=true,
    bookmarksopen=true
}
\RequirePackage{href-ul}


%--------------------------------------------------------------------------
% Needed dependencies
%--------------------------------------------------------------------------
\RequirePackage{tcolorbox}
\tcbuselibrary{raster,fitting,minted,many,listings,breakable}
\usemintedstyle{friendly}
%\setmintedinline[console]{style=colorful}


\RequirePackage{pmboxdraw} % for Systemctl's "box" unicode symbols
\RequirePackage{graphicx}
\RequirePackage{svg} % for svg images

\RequirePackage[export]{adjustbox} % frames in graphics
\RequirePackage{wrapfig}
\RequirePackage{fontawesome5}

\RequirePackage{caption}
\captionsetup{labelformat=empty,textfont={scriptsize}}

\RequirePackage[shortcuts]{extdash}

\RequirePackage{enumitem}
\setlist{topsep=-5pt}


%--------------------------------------------------------------------------
% Custom color BOXES
%--------------------------------------------------------------------------
\newcommand{\custombox}[5]{
    \begin{tcolorbox}[
        colframe=#1, colbacktitle=#1,
        colupper=#1, colback=#2,
        enhanced, sidebyside, segmentation hidden,
        lefthand width=1.2cm,
        title=\textbf{#3},]
      \centering
      \color{#1}
      \fontsize{30pt}{-10pt}#4
      \tcblower
      \color{#1}
      #5
    \end{tcolorbox}
}
%% Inspired on awesomebox
\newcommand{\infobox}[1]{
    \custombox{cyan!60!black}{cyan!5!white}{Información}{\faInfoCircle}{#1}
}

\newcommand{\warnbox}[1]{
    \custombox{orange!80!black}{orange!5!white}{¡Atención!}{\faExclamationCircle}{#1}
}

\newcommand{\errorbox}[1]{
    \custombox{error-color}{red!4!white}{¡Cuidado!}{\faExclamationTriangle}{#1}
}

%--------------------------------------------------------------------------
% CODE custom creations
%--------------------------------------------------------------------------
\newtcblisting[auto counter,number within=section, list inside=mycommands]
  {mycode}[3]{
    listing only,adjusted title={\faTerminal \hspace{10pt}#1}, listing engine=minted,minted language=#2,
    breakable=true,enhanced jigsaw,
    minted options={fontsize=#3},colback=white,
    list entry={\protect\numberline{\thetcbcounter}#1}
}

\DeclareTotalTCBox{\inlineconsole}{ v }
  {verbatim,colupper=white,colback=inline-bg-color,colframe=black,enhanced}{#1}

\DeclareTotalTCBox{\commandbox}{ v }
  {verbatim,colupper=white,colback=inline-bg-color,colframe=black,enhanced}{\faTerminal\hspace{0pt}  #1}

\DeclareTotalTCBox{\configfile}{ v }
  {verbatim,colupper=white,colback=inline-bg-color,colframe=black,enhanced}{\faFile\hspace{0pt}  #1}

\DeclareTotalTCBox{\configdir}{ v }
  {verbatim,colupper=white,colback=inline-bg-color,colframe=black,enhanced}{\faFolderOpen\hspace{0pt}  #1}


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
\newcommand{\yukibook}[9]{

  \def\@thetitle{#1}
  \def\@theauthor{#2}
  \def\@theyear{#3}
  \def\@thedegree{#4}
  \def\@thephrase{#5}
  \def\@thephraseauthor{#6}
  \def\@thecoverpath{#7}
  \definecolor{headerscolor}{HTML}{#8}
  \def\@minititle{#9}

  \thispagestyle{empty}

  \newgeometry{margin=0pt}
  %---------------------------------------------------
  % Cover inspired by O'reilly books
  % and from https://github.com/johnjohnlin/oreilly_cover
  %---------------------------------------------------
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
                boxrule=0mm,
                arc=0mm,
                colframe=white,
                colback=white,
                fit to={\paperwidth} and 12.5cm,
                halign=flush center,
                valign=center,
                space to=\myspace,
              ]
      \includegraphics[width=\linewidth,height=13cm,keepaspectratio]{\@thecoverpath}
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
                before skip=0cm,
                boxrule=0mm,
                colframe=white,
                colback=white,
                fit to={\paperwidth} and 2.6cm,
                fit basedim=210pt,
                halign=flush left,
                left=1cm,
                valign=top
              ]
      \color{headerscolor}\textbf{\@theauthor} \linebreak
      \color{headerscolor}\textbf{\@theyear}
  \end{tcolorbox}

  \clearpage

  %---------------------------------------------------
  % First page with book license
  %---------------------------------------------------
  \restoregeometry
  \null
  \vfill
  \begin{flushleft}
    \includegraphics[]{img/seal.png}

    Copyright \textcopyright \ \@theauthor \hspace{1pt} (\href{mailto:me@somewhere.com}{rugoli@gmail.com})
    \begin{itemize}
        \item Github: \href{https://github.com/yuki}{https://github.com/yuki}
        \item Twitter: \href{https://twitter.com/rugoli}{https://twitter.com/rugoli}
    \end{itemize}


    \vspace{5mm}
    \textbf{Licencia: } \href{https://creativecommons.org/licenses/by-sa/4.0/}{Creative Commons BY-SA 4.0}


    Este libro se ha relizado teniendo en cuenta la cultura libre. Puedes utilizarlo, modificarlo y compartirlo teniendo en cuenta la licencia \href{https://creativecommons.org/licenses/by-sa/4.0/}{Attribution-ShareAlike} de \textbf{Creative Commons}. Es por eso que:

        \begin{itemize}
            \item \textbf{Atribución}: Debes darme crédito de manera adecuada e incluir un enlace a la licencia e indicar si se han realizado cambios.
            \item \textbf{CompartirIgual}: Si reutilizas, modificas o creas a partir de este material, debes distribuir el trabajo bajo la misma licencia.
        \end{itemize}


    Puedes encontrar la última versión de este libro en la siguiente URL (\href{https://github.com/yuki/my-books}{https://github.com/yuki/my-books}), así como otros libros que he creado. También podrás descargar el código fuente en formato \LaTeX{}.

    \infobox{\textbf{Por favor, ponte en contacto conmigo si encuentras algún fallo, falta de ortografía o quieres mejorar de alguna manera este libro. Gracias.}}
    \vspace{5mm}
  \end{flushleft}

  \clearpage

  %---------------------------------------------------
  % Table of Contents
  %---------------------------------------------------
  \tableofcontents

} % end of \yukibook