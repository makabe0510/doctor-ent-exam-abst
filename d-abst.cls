\DeclareOption*{\PassOptionsToClass{\CurrentOption}{jarticle}}
\ifx\re@size\@undefined\def\re@size{jresize}\fi
\ProcessOptions
\LoadClass{jarticle}
\ProvidesClass{d-abst}
              [2018/08/08 v0.1 written by Shun HASEGAWA, Standard pLaTeX document class for doctor entrance exam abst]

% for Ubuntu platex
\ifx\sec@font\@undefined\def\sec@font{\Large}\fi
\ifx\ssec@font\@undefined\def\ssec@font{\large}\fi
\ifx\sssec@font\@undefined\def\sssec@font{\large}\fi

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                     {1.1ex \@plus .2ex \@minus .2ex}%
                                     {1.9ex \@plus .2ex}%
                                     {\normalfont\sec@font}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                       {0ex \@plus .2ex \@minus .2ex}%
                                       {0.5ex \@plus .2ex}%
                                       {\normalfont\ssec@font\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                          {0ex \@plus .2ex \@minus .2ex}%
                                          {0.5ex \@plus .2ex}%
                                          {\normalfont\sssec@font\bfseries}}

\def\keywords#1{\long\def\@keywords{#1}}
\def\@keywords{}
\def\@maketitle{%
  \newpage
  \begin{center}%
  \let \footnote \thanks
    {\Large \@title \par}%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author \\
        \@keywords
      \end{tabular}\par}%
  \end{center}%
  \par
  \vskip 12pt}

\renewenvironment{thebibliography}[1]
     {{\vspace{3mm}\hspace{-1.1zw}\Large\refname
        \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}\vspace{2mm}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

%% set size
\setlength{\headheight}{0mm}
\setlength{\headsep}{0mm}
\setlength{\textheight}{25.5cm}
\setlength{\textwidth}{176mm}
\setlength{\oddsidemargin}{-10mm}
\setlength{\evensidemargin}{-10mm}
\setlength{\topmargin}{-5mm}
\setlength{\columnsep}{10.0mm}
\setlength{\topsep}{1pt}
\setlength{\partopsep}{1pt}
\setlength{\parsep}{1pt}
\setlength{\itemsep}{0pt}

\setcounter{topnumber}{5}
\setcounter{bottomnumber}{5}
\setcounter{totalnumber}{5}
\setcounter{dbltopnumber}{5}
\renewcommand{\topfraction}{.9}
\renewcommand{\bottomfraction}{.9}
\renewcommand{\textfraction}{.1}
\renewcommand{\floatpagefraction}{.9}
\renewcommand{\dbltopfraction}{.9}
\renewcommand{\dblfloatpagefraction}{.9}

\let\LARGE=\Large
\let\Large=\large
\let\large=\normalsize
\let\normalsize=\small
\let\small=\footnotesize
\let\footnotesize=\scriptsize

\renewcommand\figurename{Fig.}
\renewcommand\tablename{Table}
\newcommand{\figref}[1]{Fig.\ref{figure:#1}}
\newcommand{\tabref}[1]{Table \ref{table:#1}}
\newcommand{\secref}[1]{第\ref{section:#1}節}

