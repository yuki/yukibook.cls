\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{yukibook}[2021/11/24 Free LaTeX text book template]
\LoadClass[11pt,titlepage,twoside,openany,draft]{book}

%--------------------------------------------------------------------------
% Language
%--------------------------------------------------------------------------
\RequirePackage[spanish]{babel}
\RequirePackage[utf8]{inputenc}

%--------------------------------------------------------------------------
% Geometry
%--------------------------------------------------------------------------
\RequirePackage[a4paper,top=2cm,bottom=2cm,left=2cm,right=2cm]{geometry}


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
\RequirePackage{titletoc}
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}


%--------------------------------------------------------------------------
% Color definitions
%--------------------------------------------------------------------------
\RequirePackage{xcolor}
\definecolor{headerscolor}{HTML}{023b80}



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
\RequirePackage{hyperref}
\urlstyle{same}
\hypersetup{
    colorlinks=true,
    allcolors=headerscolor,
    bookmarks=true,
    bookmarksopen=true
}


%--------------------------------------------------------------------------
% Cool dependencies
%--------------------------------------------------------------------------
\RequirePackage{awesomebox}  % https://www.ctan.org/pkg/awesomebox
\RequirePackage{tcolorbox}


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


%--------------------------------------------------------------------------
% for lorem ipsum
\RequirePackage{blindtext}
