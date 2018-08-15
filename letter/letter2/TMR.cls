%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TMR Class File
% Author: Marina Rose "Mars" Geldard
% http://github.com/TheMartianLife/Resume

% Available for others' use under:
% 

% Last Updated: 19/09/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Class identification & inheritance
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{TMR}[2017/09/19 v1 TheMartianResume Package]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}


% Gain functionality from third party packages
\RequirePackage{geometry}
\RequirePackage{import}
\RequirePackage{fancyhdr}
\RequirePackage{parskip}
\RequirePackage{xcolor}
\RequirePackage{enumitem}
\RequirePackage{fontawesome}
\RequirePackage{pdfpages}


% Set up document to start
\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=2.0cm, footskip=.5cm}
\renewcommand{\labelitemi}{\textendash}
\setlist[itemize]{partopsep=0pt, topsep=0pt, itemsep=-3pt, itemindent=-1em}
\renewcommand{\headrulewidth}{0pt}
\linespread{0.9}
\pagestyle{fancy}
\fancyhf{}


% Get details from author input
\newcommand*{\documenttitle}[1]{\def\@documenttitle{#1}}
\newcommand*{\name}[1]{\def\@name{#1}}
\newcommand*{\address}[1]{\def\@address{#1}}
\newcommand*{\phone}[1]{\def\@phone{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}
\newcommand*{\github}[1]{\def\@github{#1}}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}
\newcommand*{\greeting}[1]{\def\@greeting{#1}}
\newcommand*{\farewell}[1]{\def\@farewell{#1}}
\newcommand*{\attached}[1]{\def\@attached{#1}}
\newcommand*{\recipient}[2]{\def\@recipientname{#1}\def\@recipientaddress{#2}}


% Define styles for text
\newcommand*{\pipe}{~~\textbar~~}
\newcommand*{\buff}{\vspace{4mm}}
\newcommand*{\debuff}{\vspace{-5mm}}
\newcommand*{\normaltext}{\fontsize{11pt}{1em}\color{darkgray}}
\newcommand*{\nametext}[1]{\fontsize{48pt}{1em}\color{black}\textbf{#1}}
\newcommand*{\accenttext}[1]{\fontsize{11pt}{1em}\color{darkgray}\textit{#1}}
\newcommand*{\titletext}[1]{\fontsize{11pt}{1em}\color{black}\textbf{#1}}
\newcommand*{\smalltext}[1]{\fontsize{9pt}{1em}\color{darkgray}\textnormal{#1}}
\newcommand*{\foottext}[1]{\fontsize{9pt}{1em}\color{black}\textsc{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% THE HIGH-LEVEL DOCUMENT ENVIRONMENTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Runs pre- & post-commands for coverletter doc
\newenvironment{coverletter}{
	
	% Construct topmatter
	\tmrheader
	\vspace{-2mm}\noindent\rule{\textwidth}{0.4pt}
	\tmrtitle
	
	% Set text style for letter body
	\normaltext
}{
	% Construct bottom matter
	\tmrclosing
}


% Runs pre- & post-commands for resume doc
\newenvironment{resume}{

	% Construct top & bottom matter
	\tmrheader
	\tmrfooter
}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% THE LOWER-LEVEL TOP & BOTTOM MATTER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Makes page header from details
\newcommand*{\tmrheader}{
	\begin{center}
	
	% Author name
	\nametext{\@name}\\\vspace{1mm}
	
	% Address & phone number
	\accenttext{\faicon{map-marker}
	\@address\quad\faicon{mobile} \@phone}\\
	
	% Social/online accounts
	\smalltext{
		\faicon{envelope} \@email \pipe
		\faicon{home} \@homepage \pipe
		\faicon{github-square} \@github \linebreak
		% \faicon{linkedin-square} \@linkedin \pipe
		% \faicon{twitter-square} \@twitter \linebreak
	}	
	\end{center}
}


% Makes three-column page footer
\newcommand*{\tmrfooter}{

	% Set left field to today's date
	\fancyfoot[L]{
		\foottext{Efforts to Make Everything \ $\heartsuit $}
	}
	
	% Set middle field to name, document type
	\fancyfoot[C]{
		\foottext{\@name~~~·~~~R{\'e}sum{\'e}}
	}	
	
	% Set right field to page number
	\fancyfoot[R]{
		\foottext{\thepage}
	}	

}


% Makes recipient section from details & dates letter
\newcommand*{\tmrtitle}{ 
	
	% Use two-column table to separate letter date
  	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} lr}
    	\titletext{\@recipientname} & \accenttext{\today}
  	\end{tabular*}
  	
  	% Return to normal left-aligned text
	\@recipientaddress \\\\\\\\
	\normaltext\@greeting,
}


% Signs off letter
\newcommand*{\tmrclosing}{
	\vspace{8mm}
	\@farewell, \\\\ \titletext{\@name} \\\\
	\accenttext{Attached: \@attached	}

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% THE LOWER-LEVEL DOCUMENT COMPONENTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Makes section headings for imported files
\newenvironment{tmrsection}[1]{
	\fontsize{16pt}{1em}\textbf{#1}\hrulefill\\
	\par\nobreak
}{}


% Makes an in-section subheading
\newcommand*{\tmrsubsection}[1]{
	\debuff\foottext{#1}\\
}


% Makes a text block
\newcommand*{\tmrtextentry}[1]{
	\debuff\smalltext{#1}\buff
}


% Makes four headers
\newcommand*{\tmrshortentry}[4]{
	\vspace{-3mm}
  	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} lr}
    	\titletext{#1} & \normaltext{#3}\\[0.5ex]
    	\accenttext{#2} & \accenttext{#4}\\[2ex]
  	\end{tabular*}
}


% Makes four headers and a text block
\newcommand*{\tmrdetailentry}[5]{
	\tmrshortentry{#1}{#2}{#3}{#4}
  	\smalltext{#5}\buff
}


% Makes four headers and an itemized list
\newcommand*{\tmrlistentry}[5]{
	\tmrshortentry{#1}{#2}{#3}{#4}\debuff
  	\smalltext{\begin{itemize}#5\end{itemize}}\buff
}


% Makes three columns of short text
\newcommand*{\tmrcolumnentry}[4]{
	\vspace{-8mm}\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} p{0.8cm} p{12.2cm} p{3cm}}
		\smalltext{#1} & \foottext{\textbf{#2}} \smalltext{#3} & \raggedleft\smalltext{\textit{#4}}\\
	\end{tabular*}
}

% Redact information for public consumption
\newif\ifpublicversion
\newcommand{\public}{
	\publicversiontrue
}

\newcommand{\private}[1]{
	\ifpublicversion[redacted]\else#1\fi
}
\newcommand{\reference}[1]{
	\ifpublicversion\else\includepdf{#1}\fi
}
