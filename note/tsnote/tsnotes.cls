% Basic setup
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tsnotes}
\LoadClass[a4paper,10。5pt]{article}

% Packages
\usepackage{times}
\usepackage{a4wide}
\usepackage{booktabs}
\usepackage{graphicx}
\usepackage{enumitem}
\usepackage{url}
\usepackage{fancyhdr}
\usepackage{color}
\usepackage{titlesec}
\usepackage[utf8]{inputenc}
\usepackage[font={small,it}]{caption}
\usepackage{xeCJK}
\usepackage{listings}
\usepackage{color,xcolor}
\definecolor{pup}{HTML}{533CC6} 
\definecolor{apple}{HTML}{5C8B15}
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

% Word Settings
\setCJKmainfont{STSong}


% Program Settings
\lstset{
  frame=trblTRBL,
  frameround=tttt,
  framexleftmargin=5mm,
  framexrightmargin=5mm,
  framerule=1mm,
  linewidth=\textwidth,
  rulecolor=\color{teal},
  rulesep=1mm,
  xleftmargin=9mm,
  xrightmargin=3mm,
  aboveskip=3mm,
  belowskip=3mm,
  showstringspaces=false,
  columns=flexible,
  basicstyle={\small\ttfamily},
  numbers=none,
  numberstyle=\tiny\color{gray},
  keywordstyle=\color{pup},
  commentstyle=\color{gray},
  stringstyle=\color{apple},
  breaklines=true,
  breakatwhitespace=true,
  tabsize=3
  }

% Settings
\usepackage[left=2.0cm, right=2.0cm, top=2.5cm, bottom=2.5cm]{geometry}
\setlength{\parskip}{12pt}
\setlength{\parindent}{0pt}
\setlist{nosep}

% Styling
\definecolor{steelblue}{RGB}{70,130,180}
\definecolor{darksteelblue}{RGB}{49,91,125}
\titleformat*{\section}{\Large\bfseries\sffamily\color{darksteelblue}}
\titleformat*{\subsection}{\large\bfseries\sffamily\color{darksteelblue}}
\titleformat*{\subsubsection}{\normalsize\bfseries\scshape\color{darksteelblue}}
\pagestyle{fancy}

% Commands

\newcommand{\tstitle}[2]{
  \begin{center}
    \null
    \vspace{-1.5cm}
    \Huge
    #1

    \bigskip
    \normalsize

    #2
  \end{center}
  \lhead{\textsc{#1}}
}

\newcommand{\fixme}[1]{
  \noindent
  \begin{minipage}{0.9\textwidth}
    \textbf{FIXME:}
    \it #1
  \end{minipage}
}