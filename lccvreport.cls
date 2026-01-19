\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lccvreport}[2018/04/11 LCCV Report class]

\LoadClass[11pt, titlepage]{report}


%%%%%%%%%%%%%%%%%%%%%%
%%% PACOTES

\RequirePackage[a4paper,pdftex,left=30mm,right=25mm,top=25mm,bottom=10mm]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[portuguese]{babel}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{xspace}
\RequirePackage{hyperref}

% A sequence of BigBreaks will be treated as one break, so it will only be able to break after ://
%\renewcommand{\UrlBigBreaks}{\do\:\do\/}

% (Less aggressive) Treat both / and - as breakable characters (don't know why this does something different than hyphens in the package declaration, but it does)
\renewcommand{\UrlBreaks}{\do\/\do\-}

% (More aggressive) Any letter and / are treated as breakable characters
% \renewcommand{\UrlBreaks}{\do\/\do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z\do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X\do\Y\do\Z}

\RequirePackage[
backend=biber,
% backend=bibtex,
style=authoryear,
giveninits,
natbib=true,
url=false,
isbn=false,
maxcitenames=2,
maxbibnames=100,
backref=true,
sorting=anyt]{biblatex}

%%% Ajustes do pacote biblatex %%%
\DeclareNameAlias{default}{family-given}

\renewcommand*{\multinamedelim}{\addsemicolon\space}

\renewcommand*{\finalnamedelim}{%
  \ifnumgreater{\value{liststop}}{2}{\finalandcomma}{}%
  \addspace\&\space}

\AtBeginBibliography{%
  \renewcommand*{\finalnamedelim}{%
    \ifnumgreater{\value{liststop}}{2}{\finalandcomma}{}%
    \addspace\addsemicolon\space}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage[final]{graphicx}
\graphicspath{{figuras/}{Figuras/}{./}}


%%%%%%%%%%%%%%%%%%%%%%
%%% SUMÁRIO

%\renewcommand\tableofcontents{
%  \tableofcontents\pdfbookmark[0]{Table of Contents}{toc}
  %\clearpage
%}


%%%%%%%%%%%%%%%%%%%%%%
%%% FORMATAÇÃO

\setlength{\parindent}{0cm}
\renewcommand{\baselinestretch}{1.2}
\parskip=1em

\renewcommand{\familydefault}{\sfdefault}
\renewcommand{\normalsize}{\fontsize{11pt}{11pt}\selectfont}


%%%%%%%%%%%%%%%%%%%%%%
%%% SEÇÕES E SUBSEÇÕES

\renewcommand{\section}{\@startsection
{section}%                   % the name
{1}%                         % the level
{0mm}%                       % the indent
{10.6mm}%                    % the beforeskip
{4.2mm}%                     % the afterskip
{\Large\bfseries\sffamily}}  % the style

\renewcommand{\subsection}{\@startsection
{subsection}%                % the name
{2}%                         % the level
{0mm}%                       % the indent
{6.4mm}%                     % the beforeskip
{1.1mm}%                     % the afterskip
{\large\bfseries\sffamily}}  % the style

\renewcommand{\subsubsection}{\@startsection
{subsubsection}%                  % the name
{3}%                              % the level
{0mm}%                            % the indent
{4.2mm}%                          % the beforeskip
{1.1mm}%                          % the afterskip
{\normalsize\bfseries\sffamily}}  % the style


%%%%%%%%%%%%%%%%%%%%%%
%%% CAPÍTULO

\renewcommand\chapter{
\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{fancyplain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}

\def\@makechapterhead#1{{
    \parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \huge\textsf{\@chapapp\space \thechapter:}
    \fi
    \interlinepenalty\@M
    \huge \bfseries \textsf{#1}\par\nobreak
    \rule{5cm}{0.5pt}
    \vskip 20\p@
  }
}

\def\@makeschapterhead#1{{
    \parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \huge \bfseries  \textsf{#1}\par\nobreak
    \rule{5cm}{0.5pt}
    \vskip 20\p@
  }
}


%%%%%%%%%%%%%%%%%%%%%%
%%% RESUMO

\renewenvironment{abstract}{
  \chapter*{\abstractname}
}


%%%%%%%%%%%%%%%%%%%%%%
%%% COMANDOS

\newcommand{\BibTeX}{$\mathsf{B{\scriptstyle{IB}} \! T\!_{\displaystyle E} \! X}$}

\newcommand{\gettype}{}
\newcommand{\gettitle}{}
\newcommand{\getshorttitle}{}
\newcommand{\getauthor}{}
\newcommand{\getdateperiod}{}
\newcommand{\getprocessnumber}{}
\newcommand{\getptnumber}{}
\newcommand{\getsapnumber}{}
\newcommand{\getlegalnumber}{}
\newcommand{\getcoordinator}{}
\newcommand{\getdate}{}

\newcommand{\type@lccvreport}{}
\newcommand{\title@lccvreport}{}
\newcommand{\shorttitle@lccvreport}{}
\newcommand{\author@lccvreport}{}
\newcommand{\dateperiod@lccvreport}{}
\newcommand{\processnumber@lccvreport}{}
\newcommand{\ptnumber@lccvreport}{}
\newcommand{\sapnumber@lccvreport}{}
\newcommand{\legalnumber@lccvreport}{}
\newcommand{\coordinator@lccvreport}{}
\newcommand{\date@lccvreport}{}

\newcommand{\type}[1]{\renewcommand{\type@lccvreport}{#1}\renewcommand{\gettype}{#1\xspace}}
\renewcommand{\title}[1]{\renewcommand{\title@lccvreport}{#1}\renewcommand{\gettitle}{#1\xspace}}
\newcommand{\shorttitle}[1]{\renewcommand{\shorttitle@lccvreport}{#1}\renewcommand{\getshorttitle}{#1\xspace}}
\renewcommand{\author}[1]{\renewcommand{\author@lccvreport}{#1}\renewcommand{\getauthor}{#1\xspace}}
\newcommand{\dateperiod}[1]{\renewcommand{\dateperiod@lccvreport}{\textbf{Período:} #1\\}\renewcommand{\getdateperiod}{#1\xspace}}
\newcommand{\processnumber}[1]{\renewcommand{\processnumber@lccvreport}{\textbf{Processo:} #1\\}\renewcommand{\getprocessnumber}{#1\xspace}}
\newcommand{\ptnumber}[1]{\renewcommand{\ptnumber@lccvreport}{\textbf{No. PT:} #1\\}\renewcommand{\getptnumber}{#1\xspace}}
\newcommand{\sapnumber}[1]{\renewcommand{\sapnumber@lccvreport}{\textbf{No. SAP:} #1\\}\renewcommand{\getsapnumber}{#1\xspace}}
\newcommand{\legalnumber}[1]{\renewcommand{\legalnumber@lccvreport}{\textbf{No. Jurídico:} #1\\}\renewcommand{\getlegalnumber}{#1\xspace}}
\newcommand{\coordinator}[2][Coordenador]{\renewcommand{\coordinator@lccvreport}{#2 (#1)\\}\renewcommand{\getcoordinator}{#2\xspace}}
\renewcommand{\date}[1]{\renewcommand{\date@lccvreport}{#1}\renewcommand{\getdate}{#1}}

\newcommand{\formatemail}[1]{$<$\texttt{#1}$>$}
\newcommand{\currentrevision@lccvreport}{}
\newcommand{\currentrevision}[1]{\renewcommand{\currentrevision@lccvreport}{\textbf{Rev. #1}\\[0.5em]}}

%%%%%%%%%%%%%%%%%%%%%%
%%% CAPA

\renewcommand{\maketitle}{
  \setcounter{page}{0}
  \begin{center}
    \textsf{\LARGE\type@lccvreport}\\[0.5cm]\rule{2cm}{0.5pt}\\[0.3cm]
    \textbf{\huge\title@lccvreport}\\[0.5cm]\rule{2cm}{0.5pt}\\[0.3cm]
    {
      \large\textbf{Autores:}\\
      \begin{multicols}{2}
      \begin{flushleft}
      \large\coordinator@lccvreport
      \large\author@lccvreport\\[0.3cm]
      \end{flushleft}
      \end{multicols}
    }
    \begin{flushleft}
      \large
      \dateperiod@lccvreport
      \processnumber@lccvreport
      \ptnumber@lccvreport
      \sapnumber@lccvreport
      \legalnumber@lccvreport
      %\coordinator@lccvreport
    \end{flushleft}
    \vfill
    \includegraphics[height=15mm]{LCCV_LogoB}\\
    \textsf{\Large
      Laboratório de Computação Científica e Visualização\\[0.20em]
      Universidade Federal de Alagoas}
    \vfill
    %\date@lccvreport
  \end{center}
  \newgeometry{left=30mm,right=25mm,top=40mm,bottom=25mm,headheight=16mm,headsep=14mm,footskip=12mm}
}


%%%%%%%%%%%%%%%%%%%%%%
%%% CABEÇALHO E RODAPÉ

\pagestyle{fancyplain}
\thispagestyle{empty}

\lhead{\includegraphics[height=16mm]{LCCV_LogoA}}
\rhead{\textbf{\large{\currentrevision@lccvreport}}Pág. \thepage\hspace{0.1em}/\hspace{0.1em}\pageref*{LastPage}}
\lfoot{\small\type@lccvreport}
\rfoot{\small\shorttitle@lccvreport}
\cfoot{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}


%%%%%%%%%%%%%%%%%%%%%%
%%% TABELA DE CONTROLE DE REVISÃO

\newcounter{revcounter}
\setcounter{revcounter}{-1}

\newcommand{\addrevision}[3]{
  \stepcounter{revcounter} \therevcounter & #1 & #2 & #3 \tabularnewline\hline
}

\newenvironment{revision}
{
  \begin{center}
  \footnotesize
  \begin{tabular}{| c | p{10cm} | c | c |}
  \hline
  \textbf{Rev.} & \textbf{Descrição} & \textbf{Data} & \textbf{Emitido por} \\
  \hline
}
{
  \end{tabular}
  \end{center}
}
