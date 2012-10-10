
%% ============================================================
%%         CSULB thesis LaTeX class
%% ============================================================
%%
%%     version         = "0.84",
%%     date            = "28 December 2004",
%%     author          = "Yamato Matsuoka"
%%     email           = "ymatsuok@csulb.edu"
%%
%%
%%     Required Packages
%%        --->  setspace.sty (to deal with double spaced lines)
%%        --->  ulem.sty     (to replace underline)
%%        --->  remreset.sty (to change equation numbering, and so on)
%%
%%     They're available at CTAN
%%      http://www.ctan.org/
%%
%% ============================================================


%% ============================================================
%%              History
%% ============================================================
%%
%% ver 0.84 (12/28/2004)
%%   - Adjusted the space at the bottom of the title and signature page
%%   - little change in \signaturepage 
%%       (included \pagenumbering, \setcounter)
%% 
%% ver 0.83
%%   - changes in command names
%%         \memfirst --> \firstmember
%%         \memsecond --> \secondmember
%%         \memthird --> \thirdmember
%%         \bacheloryr --> \bacheloryear
%%         added  \gradyear
%%
%%
%%-----------------------------------------------------------



%% ============================================================
%%              Known Problems
%% ============================================================
%%
%%   \arraystrech is set to 0.7
%%      ---> vertical width in tablular environment becomes a little short
%%
%%  \addtocontents{toc}{\protect\contentsline{chapterhead}{\chaptername}{Page}}
%%   has to be *manually* inserted in the body
%%
%%-----------------------------------------------------------




\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{csulb_thesis}[2004/12/28 v0.84 CSULB thesis class]
\LoadClassWithOptions{report}

%% Load Packages
\RequirePackage[nodisplayskipstretch]{setspace}
\RequirePackage[normalem]{ulem} %% the option [normalem] keeps \emph italic
\RequirePackage{remreset} %% to utilize \@removefromreset

% draft/final option
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}

\DeclareOption{letterpaper,12pt}{\PassOptionsToClass{letterpaper,12pt}{report}}


%% Pass all other options to report.cls.
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\ExecuteOptions{final} %% default option
\ProcessOptions\relax


%% page number at the bottom, no header or footer
\pagestyle{plain}

%% Vertical doublespacing globally (except footnote environment)
\doublespacing  % due to setspace.sty


%% Turn off justification: ugly though!
\raggedright
%% but make paragraphs indented
% \parindent=1.5em
\parindent=0.5in % fixed paragraphs in body, but not TOC. 

%%% horizontal double space after each periods (.)
\xspaceskip=0.6em 
%% Overful in font file occur with this command!
%% ==> Resolved because of the change in \@chappos (11/28/2004)

%% -------------------------------------------
%%  Page Layout:  perhaps needs adjustment
%% -------------------------------------------
% lettersize
\setlength{\paperheight}{11.0in}
\setlength{\paperwidth}{8.5in}

% vertical
\setlength{\voffset}{0pt}
% \setlength{\topmargin}{0.77in} % Use with WinEdt(12/12/2004) 0.03in -> 0.05in
%\setlength{\topmargin}{0.02in} % Use with Kile(12/12/2004) 0.03in -> 0.05in
\setlength{\topmargin}{0in}
\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}
\setlength{\topskip}{1sp}
% \setlength{\textheight}{8.52in}
\setlength{\textheight}{8.51in} %bpc
\setlength{\footskip}{0.45in} %%(12/7/2004) 0.4in -> 0.5in (12/12/2004) -> 0.42in


%%  size12.clo
%\setlength\headheight{12\p@}
%\setlength\headsep   {25\p@}
%\setlength\topskip   {12\p@}
%\setlength\footskip{30\p@}

% horizontal
\setlength{\hoffset}{0pt}
% \setlength{\oddsidemargin}{0.52in} %% (12/12/2004) 0.5in -> 0.52in
% \setlength{\oddsidemargin}{0.47in} %% bpc 7/3/11, pdflatex, left margin 1/16" short.
\setlength{\oddsidemargin}{0.52in} %% bpc 
\setlength{\textwidth}{5.96in}  %% (12/12/2004) 5.98in -> 5.96in



% Beginning stuff
%\renewcommand{\title}[1]{\gdef\@title{#1}}
%\renewcommand{\author}[1]{\gdef\@author{#1}}
%\renewcommand{\date}[1]{\gdef\@date{#1}}
\newcommand{\gradmonth}[1]{\gdef\@gradmonth{#1}}
\newcommand{\gradyear}[1]{\gdef\@gradyear{#1}}
\newcommand{\department}[1]{\gdef\@department{#1}}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\bachelor}[1]{\gdef\@bachelor{#1}}
\newcommand{\bacheloryear}[1]{\gdef\@bacheloryear{#1}}
\newcommand{\undergraduniv}[1]{\gdef\@undergraduniv{#1}}



%\renewcommand\today{\ifcase\month\or
%  January\or February\or March\or April\or May\or June\or
%  July\or August\or September\or October\or November\or December\fi \number\year}


% ---------------------------------------------
%       Title Page
% ---------------------------------------------
\renewcommand{\maketitle}{%
 \enlargethispage{0.5in}
 \begin{titlepage}
 \begin{center}
   \MakeUppercase{\@title}
   \vfill
   A THESIS \\
   Presented to the \@department \\
   California State University, Long Beach \\
   \vfill
   In Partial Fulfillment \\
   of the Requirement for the Degree\\
   \@degree \\
   \vfill
   By \@author \\
   \@bachelor, \@bacheloryear, \@undergraduniv \\
   \@gradmonth \ \@gradyear
 \end{center}
 \end{titlepage}
}



%% ---------------------------------------------
%%    Abstract  ... based on report.cls
%% ---------------------------------------------
%\if@titlepage
\renewenvironment{abstract}{%
%%    \titlepage
\null\vskip0.78in%%%  Adjusted (12/12/2004)
\@beginparpenalty\@lowpenalty
\begin{center}%
\abstractname \\%
\MakeUppercase{\@title} \\%
  By \\%
  \@author \\%
  \@gradmonth \ \@gradyear%
  \@endparpenalty\@M
%% remove the extra space  ... I don't know where the space come from
  \vspace{-0.18in}
  \end{center}%
  \@afterheading} %% for indent
%{\null\endtitlepage}
%\else
%  \renewenvironment{abstract}{%
%      \small
%      \begin{center}%
%        \abstractname \\%
%         \MakeUppercase{\@title} \\%
%          By \\%
%         \@author \\%
%         \@gradmonth %
%         \@endparpenalty\@M
%      \end{center}%
%      \quotation}
%\fi


%% ---------------------------------------------
%%        Signature Page
%% ---------------------------------------------
\newcommand{\firstmember}[1]{\gdef\@firstmem{#1}}
\newcommand{\secondmember}[1]{\gdef\@secondmem{#1}}
\newcommand{\thirdmember}[1]{\gdef\@thirdmem{#1}}
\newcommand{\deanname}[1]{\gdef\@deanname{#1}}

\newcommand{\deptfirst}[1]{\gdef\@deptfirst{#1}}
\newcommand{\deptsecond}[1]{\gdef\@deptsecond{#1}}
\newcommand{\deptthird}[1]{\gdef\@deptthird{#1}}
\newcommand{\deandept}[1]{\gdef\@deandept{#1}}

%% ---------------------------------------------
%%  Further adjustment would be needed!
%% ---------------------------------------------
\newlength\@deptwidth
\settowidth\@deptwidth{Computer Science}  %%%%%%%%% ADJUSTABLE %%%%%%%%%%%
%%%       put whatever string here

\newcommand{\signaturepage}{%
  \clearpage
  \enlargethispage{0.5in}
  \thispagestyle{empty}%
  \pagenumbering{roman}
  \setcounter{page}{2}   %%% Adjustment of Page numbering
  \renewcommand{\arraystretch}{0.7} %% To make lines closer to the entries
  \begin{center} %%%  Grouping ... to apply \arraystretch
   WE, THE UNDERSIGNED MEMBERS OF THE COMMITTEE, \\
   HAVE APPROVED THIS THESIS \\
   \vspace{12pt}
   \MakeUppercase{\@title} \\
   \vspace{12pt}
    By \\
    \@author \\
    %  \vspace{12pt}
    \vfill
    COMMITTEE MEMBERS
    \vfill
    \begin{tabular*}{5.8in}{@{\extracolsep{\fill}}l p{\@deptwidth}@{}}
                        &                \\
                        &                \\
                        &                \\ \hline
     \@firstmem         &  \@deptfirst   \\
                        &                \\ 
                        &                \\ 
                        &                \\ \hline
     \@secondmem        &  \@deptsecond  \\
                        &                \\ 
                        &                \\
                        &                \\ \hline
     \@thirdmem         &  \@deptthird  
   \end{tabular*}
   \vfill
   \vspace{15pt}
   ACCEPTED AND APPROVED ON BEHALF OF THE UNIVERSITY
   \begin{tabular*}{5.8in}{@{\extracolsep{\fill}}l p{15em}@{}} 
                  &                \\
                  &                \\
                  &                \\ \hline
      \@deanname  &                \\
   \end{tabular*}
   \end{center}
   \vspace{-14pt} \hspace{3pt} \@deandept \\
   \vspace{12pt}
   \begin{center}
    California State University, Long Beach \\
     \@gradmonth \ \@gradyear
   \end{center}
}


%% ---------------------------------------------
%%        CHAPTER
%% ---------------------------------------------
\def\@chapter[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
      \refstepcounter{chapter}%
      \typeout{\@chapapp\space\thechapter}% 
%%% ここにピリオドを付けてたせいみたいなんだけど、どうなってんだ？
      \addcontentsline{toc}{chapter}%
         {\protect\numberline{\thechapter}\MakeUppercase{#1}}%
    \else
      \addcontentsline{toc}{chapter}{#1}%
    \fi
    \chaptermark{#1}%
    \@makechapterhead{\MakeUppercase{#2}}%
    \@afterheading}


%%%% put period in TOC:  `3 blah-blah' ==> `3. blah-blah'
%% (11/28/2004) \ was added after the period
%% It resolves the overful errors in TOC/LOF/LOT
\def\@chappos{.\ } 
%
\def\@makechapterhead#1{%
        \normalfont
        \null\vskip0.78in  %chapter: lower the heading by 1 inch (12/12/2004) -> 0.78in
        \begin{center}
        \@chapapp\ {\thechapter} \\ % CHAPTER 1 or APPENDIX
        \MakeUppercase{#1}    % TITLE OF CHAPTER
        \hspace{0.1mm}\vspace{-0.17in}
        \end{center}
        \vskip0.0\baselineskip
}


% ---------------------------
%     chapter*  
% ---------------------------
\def\@schapter#1{%
      \@makeschapterhead{#1}%
      \@afterheading}
\def\@makeschapterhead#1{%
        \normalfont
        \null\vskip0.78in %chapter: lower the heading by 1 inch (12/12/2004) -> 0.78in
        \begin{center}
        \MakeUppercase{#1}    % TITLE OF CHAPTER
        \end{center}
        \hspace{0.1mm}\vspace{-0.24in}  %% (12/07/2004) -0.17in -> 0.24
        \vskip0.0\baselineskip
}


%% Thank to Shippo-Aikoka-san in Japanese TeX Q&A BBS
%% for solving the \centering - \underline problem
% ---------------------------------------------
% SECTION: 1st heading
% ---------------------------------------------
\newcommand{\@sechead@underline}[1]{\uline{#1}\@@par}
\renewcommand{\section}{\@startsection{section}{1}%
   {0pt}{0.0ex \@plus 0.2ex \@minus 0.2ex}{1pt}%
   {\centering\normalfont\normalsize\@sechead@underline}}

% ---------------------------------------------
% SUBSECTION: 2nd heading
% ---------------------------------------------
\renewcommand{\subsection}{\@startsection{subsection}{2}%
   {0pt}{0pt}{1pt}%
   {\raggedright\normalfont\normalsize\@sechead@underline}}

% ---------------------------------------------
% SUBSUBSECTION: 3rd heading
% ---------------------------------------------
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}%
   {\parindent}{0pt}{1pt}%
   {\normalfont\normalsize\@sechead@underline}}




% ---------------------------------------------
%     Re-definition of Numberings
% --------------------------------------------- 

% Numbering: Eqauations
\@removefromreset{equation}{chapter}  % due to remreset.sty
\def\theequation{\@arabic\c@equation}


%% +++++++++++++++++++++++++++
%% period is placed after the numbering
%% +++++++++++++++++++++++++++
% Numbering: Figures
\@removefromreset{figure}{chapter}  % due to remreset.sty
\def\thefigure{\@arabic\c@figure}

% Numbering: Tables
\@removefromreset{table}{chapter}  % due to remreset.sty
\def\thetable{\@arabic\c@table}


% ---------------------------------------------
%     Footnotes  (codes from  size12.clo)
% --------------------------------------------- 
%% reset numbering for each chapters
\@addtoreset{footnote}{chapter}

%%%%%%% ADJUSTABLE %%%%%%%%
\setlength\footnotesep{8.4\p@} %% space between footnotes
\setlength{\skip\footins}{15\p@ \@plus 4\p@ \@minus 2\p@} %% space between main and footnote
%% === original settings ===
%%\setlength\footnotesep{8.4\p@}
%%\setlength{\skip\footins}{10.8\p@ \@plus 4\p@ \@minus 2\p@}

\renewcommand\footnotesize{%
%% comment out the next line  --> keep 12pt font in footnote
%   \@setfontsize\footnotesize\@xpt\@xiipt
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 6\p@ \@plus2\p@ \@minus2\p@
               \parsep 3\p@ \@plus2\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}


% ---------------------------------------------
%     Table of Contents (TOC)
% --------------------------------------------- 
\renewcommand{\@pnumwidth}{1.5em}  % set area for page numbers appearing in TOC
\renewcommand{\@tocrmarg}{2.5em}   % set rightside space when an entry takes more than a line 
\renewcommand{\@dotsep}{1.0}   % dots separation
\newcommand{\toclineskip}{\z@ \@plus \z@ \@minus \z@}
\setcounter{tocdepth}{2}   % set to 2: show up to subsection heading
% *secnumdepth* determines the numbering depth
%    0 ...  chapter
%    1 ...  section
%    2 ...  subsection
%    3 ...  subsubsection
\setcounter{secnumdepth}{0}
% So only chapters (1st headings) are numbered now!


%%    TABLE OF CONTENTS

\renewcommand{\tableofcontents}{%
    \chapter*{\contentsname}%
    \begin{singlespace}%%    requires `setspace' package!
    \vspace{-\baselineskip}
    \nobreak\hfill{Page}\par%
%    \noindent\phantom{Table}\hfill{Page}\par%%   before..
   % \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
    \hangindent=1.5em  %% indent if an entry has more than a line  %probably too small, but i don't have any
    \hangafter=1       %% 
    \@starttoc{toc}
    \end{singlespace}}


%% Thank to Tony@FTEX-san in Japanese TeX Q&A BBS
\def\numberline#1{\hb@xt@\@tempdima{#1.\ \hfil}}

%% Just for the  ``CHAPTER'' and ``Page'' in TOC
\newcommand*{\l@chapterhead}[2]{%
    \addpenalty{-\@highpenalty}%
    \addvspace{\baselineskip}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode 
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
    \addvspace{\baselineskip}%
    }


%% I don't know the difference 
%% between \@namedef and \newcommand in the following definition
\@namedef{l@xchapter}#1#2{%
    \ifnum \c@tocdepth >\m@ne%
    \addpenalty{-\@highpenalty}%
    \addvspace{\baselineskip}%
    \@dottedtocline{0}{0pt}{0pt}{#1}{#2}%  % LIST OF FIGURES indent
    \addvspace{\baselineskip}%
    \fi}
\providecommand*{\toclevel@xchapter}{0}%  to get rid of the hyperref warning


\renewcommand{\l@chapter}[2]{%
    \ifnum \c@tocdepth >\m@ne%
    \addpenalty{-\@highpenalty}%
    \addvspace{\baselineskip}%
    % \@dottedtocline{0}{1em}{1.2em}{#1}{#2}%  % Chapter titles indent
    \@dottedtocline{0}{0.25in}{1.2em}{#1}{#2}%  %bpc TOC chapter spacing
    \addvspace{\baselineskip}%
      %% indent, spacing from title number of chapter entry in TOC
    \fi }

% Indent level of each headings in TOC
%% \dottedtocline{<level>}{<indent>}{<lnumwitdh>}
% \renewcommand{\l@section}{\@dottedtocline{1}{3.5em}{2em}}  
% \renewcommand{\l@subsection}{\@dottedtocline{2}{5em}{3em}}
\renewcommand{\l@section}{\@dottedtocline{1}{1.0in}{2em}} %bpc fix TOC section spacing
\renewcommand{\l@subsection}{\@dottedtocline{2}{1.5in}{3em}}

%change _ char
%\catcode`\_=12



% ---------------------------------------------


%% ----------------------------
%%    Acknowledgement
%% ----------------------------
%  
\newenvironment{acknowledgement}{%
  \chapter*{\acknowledgementname}%
  \addcontentsline{toc}{xchapter}{\acknowledgementname}% 
  \vspace{-0.27in}  %% adjustment
  \@afterindenttrue
} 


%% ----------------------------
%%    LIST OF FIGURES (LOF)
%% ----------------------------
%   
\def\listoffigures{%
   \chapter*{\listfigurename}%
   \vspace{-0.27in}  %% adjustment
   FIGURE\nobreak\hfill{Page}\par%
   %\@mkboth{\listfigurename}{\listfigurename}%
   % Add to TOC entry
   % \begin{singlespace}%%    requires `setspace' package! % bpc
   \addcontentsline{toc}{xchapter}{\listfigurename}% bpc random test
   % \end{singlespace} %bpc.  
   \@starttoc{lof}}

\def\l@figure{\@dottedtocline{0}{1em}{1.6em}}  %%%%%%%%%%%%%%% ADJUSTABLE! %%%%%%%%%%%%%%%%%


\def\l@figure#1#2{%
    {
	\begin{singlespace}%%    requires `setspace' package! % bpc
   
	 \leftskip 1em\relax \rightskip \@tocrmarg \parfillskip -\rightskip
    % \parindent 1em\relax\@afterindenttrue
    \parindent 0.25in\relax\@afterindenttrue %bpc indent 1. Figureblah
    \hangindent=2.5em  %% indent if an entry has more than a line  %bpc
    \hangafter=1       %% bpc
     \interlinepenalty\@M
     \leavevmode
     \@tempdima 1.6em\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#1}\nobreak
     \leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}%
     \hfill\nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #2}%
     \par
	\end{singlespace} %bpc.  
		}}



% 
%% ----------------------------
%%    LIST OF TABLES
%% ----------------------------
%   
\def\listoftables{%
   \chapter*{\listtablename}%
   \vspace{-0.27in}  %% adjustment
   TABLE\nobreak\hfill{Page}\par%
   %\@mkboth{\listtablename}{\listtablename}%
   \addcontentsline{toc}{xchapter}{\listtablename}%
   \@starttoc{lot}}
\let\l@table\l@figure


%% ---------------------------------
%%    change titles
%% ---------------------------------
\def\contentsname{TABLE OF CONTENTS}
\def\listfigurename{LIST OF FIGURES}
\def\listtablename{LIST OF TABLES}
\def\chaptername{CHAPTER}
\def\appendixname{APPENDIX}
\def\appendicesname{APPENDICES}
\def\figurename{FIGURE}
\def\tablename{TABLE}
\def\abstractname{ABSTRACT}
% \def\bibname{BIBLIOGRAPHY}
\def\bibname{REFERENCES}
\def\acknowledgementname{ACKNOWLEDGEMENT}



%% ---------------------------------
%%   Captions
%%     in Figure, Table environment
%% ---------------------------------
%%
%%%   The following is almost identical to report.cls
%%%     just replaced :(comma) with .(period)
%%%  (11/28/2004) ===>   periods were taken away
%%%    included the period in \thefigure, \thetable
%%%    such that the period appears in LOF, LOT
%%%  (12/03/2004) ===>   periods were put back
%%%    ** including the period in \thefigure, \thetable
%%%    ** is found to be no good.

%\long\def\@makecaption#1#2{%
%  \vskip\abovecaptionskip
%  \sbox\@tempboxa{#1. #2}%
%  \ifdim \wd\@tempboxa >\hsize
%    #1. #2\par
%  \else
%    \global \@minipagefalse
%    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
%  \fi
%  \vskip\belowcaptionskip}

% The below theoretically fixes a problem with \par in the above.
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1. #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1. #2
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\box\@tempboxa}%
  \fi
  \vskip\belowcaptionskip}


%% ----------------------------
%%   Appendices
%% ----------------------------
\renewcommand{\appendix}{
  %% the title page for appendix
  \newpage
  \addcontentsline{toc}{xchapter}{\appendicesname}% <-- added
  %\@mkboth{\appendicesname}{\appendicesname}%
  \begin{center}\hbox{} \vfill \appendicesname \vfill \end{center}
  \newpage
  %% \appchapter puts a title sheet before each appendix entries
  \renewcommand{\chapter}{\appchapter}%
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}%
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}} 
  %% For Appendices, only chapters appear in TOC

% -------------------------
\def\appchapter{\clearpage
                \thispagestyle{plain}%
                \global\@topnum\z@
                \@afterindentfalse
                \secdef\@appchapter\@schapter}

% -------------------------
\def\@appchapter[#1]#2{%
    \refstepcounter{chapter}%
    \typeout{\@chapapp\space\thechapter}%
    \addcontentsline{toc}{chapter}%
       {\protect\numberline{\thechapter}\MakeUppercase{#1}}%
    \chaptermark{#1}%
    \@makeappendixhead{\MakeUppercase{#2}}%
    \@afterheading}

% -------------------------
\def\@makeappendixhead#1{%
   \normalfont
   \hbox{}
   \vfill
   \begin{center}
      \@chapapp\ {\thechapter} \\ % APPENDIX
      \MakeUppercase{#1}    % TITLE OF APPENDIX
   \end{center}
   \vfill
   \clearpage
   \normalfont
   \null\vskip0.78in  %chapter: lower the heading by 1 inch
   \begin{center}
      \MakeUppercase{#1}    % TITLE OF APPENDIX
      \hspace{0.1mm}\vspace{-0.18in}%
   \end{center}}
%   \vskip.1\baselineskip}



%% ----------------------------
%%    BIBLIOGRAPHY
%% ----------------------------

%% \@biblabel .... determines the number and brackets, like [12] 

\setlength{\labelsep}{.5em}
\setlength{\bibindent}{1.5em}

\renewenvironment{thebibliography}[1]{%
      \newpage
      \addcontentsline{toc}{xchapter}{\bibname}%
      %\@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \begin{center}\hbox{} \vfill \bibname \vfill \end{center}
      \newpage
      \chapter*{\bibname}%
      \singlespacing   %% requires `setspace' package!
      %%%%  If \singlespacing comes befere the \chapter*, 
      %%%%  the spacing above the chapter heading gets little changed.
      \vspace{-0.27in}%%%% Adjustment %%%%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%  
            \setlength{\leftmargin}{\labelwidth} 
            \advance\leftmargin\labelsep            %%%  it works as indentation
            \advance\leftmargin\bibindent           %%%  like \hangindent=\bibindent
            \setlength{\itemindent}{-\bibindent}    %%%  and  \hangafter=1
           % The following command makes the item separations double-spaced
            \setlength\itemsep{1.0\baselineskip \@plus\p@ \@minus\p@}
          % \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}} %biblio numbering
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}


%% LIST environment setting (enumerate, etc)
\def\@listI{
       \leftmargin\leftmargini
       \parsep \z@  \@plus2\p@ \@minus\p@
       \topsep \z@ \@plus2\p@   \@minus\p@
       \itemsep \z@  \@plus2\p@ \@minus\p@
}
