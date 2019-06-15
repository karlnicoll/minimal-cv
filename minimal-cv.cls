\ProvidesClass{minimal-cv}[2019-06-09 Minimal CV Class]
\NeedsTeXFormat{LaTeX2e}

% Base class
% ==========
\LoadClass{article}[a4paper]
\RequirePackage{parskip}

% Don't show links.
\RequirePackage[colorlinks=true,urlcolor=blue]{hyperref}

% Hide page numbers.
\pagenumbering{gobble}

% Colors
% ======
\RequirePackage{color}
\RequirePackage{xcolor}
\definecolor{headerbg}{HTML}{1A1A1A}
\definecolor{headertext}{HTML}{FFFFFF}
\definecolor{sectioncolor}{HTML}{CC5045}
\definecolor{subsectioncolor}{HTML}{444444}
\definecolor{textcolor}{HTML}{222222}

% Fonts
% =====
\RequirePackage{fontspec}
\newfontfamily\emojifont{Symbola}
\newfontfamily\bodyfont[UprightFont=*-Light]{Roboto}
\newfontfamily\firstnamefont[UprightFont=*-Thin]{Roboto}
\newfontfamily\secondnamefont[]{Roboto}
\newfontfamily\headerfont[UprightFont=*-Bold]{Roboto}

\setmainfont[
  Ligatures=TeX,
  UprightFont=*-Light,
  ItalicFont=*-LightItalic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic
]{Roboto}

% Geometry
% ========
\RequirePackage[top=1.5cm,right=2cm,bottom=2cm,left=2cm]{geometry}

% Header Box
% ==========
\RequirePackage{tikz}
\newcommand{\header}[2]{
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=headerbg, anchor=north, minimum height=2cm, text width=\paperwidth, align=right] (box) at (current page.north){
      \fontsize{40pt}{80pt}\textcolor{headertext}{\hfill\firstnamefont{#1}\secondnamefont{#2}\hspace{1cm}}
    };
  \end{tikzpicture}
}

% Section Formatting
% ==================
\RequirePackage{titlesec}
\RequirePackage{textpos}

\titleformat{\section}{\bfseries\Large\color{sectioncolor}}{}{0em}{}[{\titlerule[0.4pt]}]
\titleformat{\subsection}{\bfseries\color{subsectioncolor}}{}{0em}{}

% sectionicon command can be used to add an icon to the right side of the
% section title.
\newcommand{\sectionicon}[1]{
	\begin{textblock*}{\textwidth}(0pt, -28pt)
	{\Large\color{sectioncolor}\hfill#1}
	\end{textblock*}
}

\newcommand{\person} {{\emojifont 🗣️}}
\newcommand{\hammer} {{\emojifont 🔨}}
\newcommand{\laptop} {{\emojifont 💻}}
\newcommand{\mortarboard} {{\emojifont 🎓}}
\newcommand{\info}{{\emojifont ℹ️}}
\newcommand{\phone}{{\emojifont 📞}}

% Compact Lists
% =============
\RequirePackage{enumitem}

\setlist[itemize]{noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt}

% Core Skills
% ===========
\newenvironment{coreskillslist}[2][\textwidth]
{\begin{minipage}[t]{#1}\subsection{#2}\begin{itemize}[leftmargin=12pt]}
{\end{itemize}\end{minipage}}

% Tables
% ======
\RequirePackage{array}
\RequirePackage{tabularx}

% Column types for timelines.
\newcolumntype{f}{>{\hsize=25pt \centering\arraybackslash}X}
\newcolumntype{h}{>{\hsize=10pt \centering\arraybackslash}X}
\newcolumntype{t}{>{\hsize=25pt \centering\arraybackslash}X}
\newcolumntype{v}{>{\raggedright\arraybackslash}X}

% Education
% =========

% tabularx "environments" don't work inside custom environments, so use the
% command form (\tabularx, \endtabularx) which is compatible.
\newenvironment{education}{
  \tabularx{\textwidth}{f h t | v}
}{\endtabularx}

\newcommand{\school}[4]{
  #1 & -- & #2 & {\bfseries\textcolor{subsectioncolor}{#3}}

  #4\newline\\
}

\newcommand{\qualification}[1]{
  \textit{#1}
}

% Employment History
% ==================
\newenvironment{employment}
{\tabularx{\textwidth}{{f h t | v}}}
{\endtabularx}

\newcommand{\job}[4]{#1 & -- & #2 & \textit{#3}#4\\}
