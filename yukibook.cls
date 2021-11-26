\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{yukibook}[2021/11/24 Free LaTeX text book template]
\LoadClass[11pt,titlepage,twoside,openany,draft]{book}

% Language
%--------------------------------------------------------------------------
\RequirePackage[english]{babel}
\RequirePackage[utf8]{inputenc}

% Geometry
%--------------------------------------------------------------------------
\RequirePackage[a4paper,top=2cm,bottom=2cm,left=2cm,right=2cm]{geometry}

% Paragraph's style
%--------------------------------------------------------------------------
\setlength{\parindent}{0em} % identation
\setlength{\parskip}{1.2em}
\renewcommand{\baselinestretch}{1.4}




% Fonts
%--------------------------------------------------------------------------
%\RequirePackage{kpfonts}
\RequirePackage[default]{sourcesanspro}
\RequirePackage{sourcecodepro}


% Cool dependencies
%--------------------------------------------------------------------------
\RequirePackage{awesomebox}  % https://www.ctan.org/pkg/awesomebox
\RequirePackage{tcolorbox}

% Color definitions
%--------------------------------------------------------------------------



% Cool creations
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



%% -------------------------
% for lorem ipsum
\RequirePackage{blindtext}
