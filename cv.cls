\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2013/05/09 CV]

\LoadClass{article}

\RequirePackage[left=6.5cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}

%====================
% COMMANDS DEFINITION
%====================
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{multirow}
\RequirePackage{array}

\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

\newcommand{\about}[1]{
	\section{about}\\
	\vspace{1mm}
	\begin{tabular}{p{4cm}}
	#1 \\
	\end{tabular}
}

%\newcommand{\address}[2]{
%	\begin{tabular}{r C{1cm}}
%		~ & ~ \\
%		#1 & \multirow{2}{*}{\large\color{textcolor}\faHome} \\
%		#2 & \\
%	\end{tabular}
%}

\newcommand{\address}[2]{
	\section{address}\\
	#1 \\
	#2
}

%\newcommand{\email}[1]{
%	\begin{tabular}{r C{1cm}}
%		~ & ~ \\
%		\href{mailto:#1}{#1} &  \small\color{textcolor}\faEnvelopeAlt \\
%	\end{tabular}
%}

\newcommand{\email}[1]{
	\section{email}\\
	\href{mailto:#1}{#1}
}

%\newcommand{\phone}[1]{
%	\begin{tabular}{r C{1cm}}
%		~ & ~ \\
%		#1 & \large\color{textcolor}\faMobilePhone \\
%	\end{tabular}
%}

\newcommand{\phone}[1]{
	\section{phone}\\
	#1
}

\newcommand{\webpage}[1]{
	\section{web}\\
	\href{https://#1}{#1}
}

\newcommand{\linkedIn}[1]{
	\href{#1}{\huge\color{textcolor}\faLinkedinSquare}
}

\newcommand{\github}[1]{
	\href{#1}{\huge\color{textcolor}\faGithubSquare}
}

\newcommand{\twitter}[1]{
	\href{#1}{\huge\color{textcolor}\faTwitterSquare}
}

\newcommand{\facebook}[1]{
	\href{#1}{\huge\color{textcolor}\faFacebookSquare}
}

%====================
% COLORS
%====================
\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{green}{HTML}{AFCA56}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{CC66FF}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{yellow}{HTML}{FFDB4D}

\colorlet{fillheadercolor}{gray}
\colorlet{headercolor}{white}
\colorlet{textcolor}{gray}

%====================
% FONTS
%====================
\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}
\RequirePackage{fontawesome}

\newfontfamily\bodyfont[]{Helvetica Neue LT Std}
\newfontfamily\thinfont[]{Helvetica Neue LT Std 25 Ultra Light}
\newfontfamily\headingfont[]{Helvetica Neue LT Std 77 Bold Condensed}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Helvetica Neue LT Std 45 Light}

%====================
% HEADER
%====================
\RequirePackage{tikz}

\newcommand{\header}[3]{
	\begin{tikzpicture}[remember picture,overlay]
		\node [rectangle, fill=fillheadercolor, anchor=north, minimum width=\paperwidth, minimum height=3.2cm] (box) at (current page.north){};

		\node [anchor=center] (name) at (box) {
			\fontsize{35pt}{68pt}\color{headercolor}
			{\thinfont #1}{\bodyfont #2}
		};
		\node [anchor=north] at (name.south) {
			\fontsize{12pt}{20pt}\color{headercolor}
			{\thinfont #3}
		};

  \end{tikzpicture}
  \vspace{1.8cm}
  \vspace{-2\parskip}
}

%====================
% FOOTER
%====================
\newcommand{\footer}[3]{
	\begin{tikzpicture}[remember picture,overlay]
		\node [rectangle, fill=fillheadercolor, anchor=south, minimum width=\paperwidth, minimum height=1.5cm] (box) at (current page.south){};
		\node [anchor=center] (name) at (box) {
			\includegraphics[scale=0.15]{logo.png}
		};
	\end{tikzpicture}
}

%====================
% STRUCTURE
%====================
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{
  {
    \color{
      \ifcase\value{colorCounter}
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\or%
		yellow\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \Large\headingfont\color{textcolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{textcolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}

%====================
% LIST ENVIRONMENT
%====================
\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{textcolor}}
\newcommand{\entry}[3]{%
  \parbox[t]{12.5cm}{%
    \textbf{#1}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #2}\\%
    #3\vspace{\parsep}%
  }\\}

%====================
% SIDE BLOCK
%====================
\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

\newenvironment{aside}{
	\let\oldsection\section
	\renewcommand{\section}[1]{
		\par\vspace{\baselineskip}{\Large\headingfont\color{textcolor} ##1}
	}
	\begin{textblock}{4}(1.5, 4)
		\begin{flushright}
			\obeycr
}{
		\restorecr
		\end{flushright}
	\end{textblock}
	\let\section\oldsection
}
