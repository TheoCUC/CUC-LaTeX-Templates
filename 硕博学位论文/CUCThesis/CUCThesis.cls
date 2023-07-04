\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CUCThesis}[isaac]

% 论文参数设置
\RequirePackage{pgfkeys}
\pgfkeys{
  % 论文类别
  Type/.store in = \CUCThesis@Type,
  % 页眉
  Header/.store in = \CUCThesis@Header,
  % 分类号
  Classification/.store in = \CUCThesis@Classification,
  % 密级
  Security/.store in = \CUCThesis@Security,
  % 学号
  StudentID/.store in = \CUCThesis@StudentID,
  % 中文论文题目（封面）
  TitleinCover/.store in = \CUCThesis@TitleinCover,
  % 英文论文题目（封面）
  TitleinCoverEN/.store in = \CUCThesis@TitleinCoverEN,
  % 中文论文题目（正文）
  TitleinBody/.store in = \CUCThesis@TitleinBody,
  % 英文论文题目（正文）
  TitleinBodyEN/.store in = \CUCThesis@TitleinBodyEN,
  % 申请人姓名
  Author/.store in = \CUCThesis@Author,
  % 指导教师
  Supervisor/.store in = \CUCThesis@Supervisor,
  % 专业名称
  Major/.store in = \CUCThesis@Major,
  % 研究方向
  Research/.store in = \CUCThesis@Research,
  % 所在学院
  College/.store in = \CUCThesis@College,
  % 提交日期
  Date/.store in = \CUCThesis@Date,
  % 中文关键词
  Keywords/.store in = \CUCThesis@Keywords,
  % 英文关键词
  KeywordsEN/.store in = \CUCThesis@KeywordsEN,
}
\newcommand{\setup}[1]{\pgfkeys{#1}}

% =============================== 论文版面设置 ===============================

% 调整为A4纸，小四号字
\LoadClass[a4paper, zihao=-4, openany]{ctexbook}

% 设置英文字体为 Times New Roman
\RequirePackage{fontspec}
\setmainfont{Times New Roman}

% 调整页边距为：左右边距为2.5CM，上下边距为3.5CM
\RequirePackage[left=2.5cm,right=2.5cm,top=3.5cm,bottom=3.5cm]{geometry}

% 页码页眉设置
\RequirePackage{fancyhdr}
\fancypagestyle{thesis}{
    \fancyhf{}
    \fancyhead[L]{\zihao{-5} \CUCThesis@Header}
    \fancyhead[R]{\zihao{-5} \leftmark}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyfoot[C]{\zihao{-5} \thepage}
}
\ctexset{chapter/pagestyle = thesis}
\pagestyle{thesis}

% 目录页样式
\fancypagestyle{frontmatterstyle}{
    \fancyhf{}
    \fancyhead[L]{\zihao{-5} \CUCThesis@Header}
    \fancyhead[R]{\zihao{-5} 目 \quad 录}
    \renewcommand{\headrulewidth}{0.4pt}
}

\fancypagestyle{nofoot}{
    \fancyhf{}
    \fancyhead[L]{\zihao{-5} \CUCThesis@Header}
    \fancyhead[R]{\zihao{-5} \leftmark}
    \renewcommand{\headrulewidth}{0.4pt}
}

% 调整章节编号格式：章大标题为chapter, 格式为三号黑体，阿拉伯数字编号，顶格，编号与标题之间空1个字的间隙, （“章”标题下空小四号字一行）
% TODO:这里的格式并没有跟Word模板完全一致
\ctexset{
    chapter = {
        format = \raggedright \zihao{3} \bfseries \heiti,
        name = {},
        number = \arabic{chapter},
        aftername = \hspace{1em},
        beforeskip = 0pt,
        afterskip = 27bp
    },
    section = {
        format = \raggedright \zihao{-3} \bfseries \heiti,
        number = \thechapter.\arabic{section},
        aftername = \hspace{1em},
        beforeskip = 24bp,
        afterskip = 6bp
    },
    subsection = {
        format = \raggedright \zihao{4} \bfseries \heiti,
        number = \thesection.\arabic{subsection},
        aftername = \hspace{1em},
        beforeskip = 12bp,
        afterskip = 6bp
    },
    subsubsection = {
        format = \raggedright \zihao{-4} \bfseries \heiti,
        number = \thesubsection.\arabic{subsubsection},
        aftername = \hspace{1em},
        beforeskip = 12bp,
        afterskip = 6bp
    }
}

% 调整行间距
\RequirePackage{setspace}
\renewcommand{\baselinestretch}{1.35}

% 插图
\RequirePackage{graphicx}
\RequirePackage{booktabs}
% 插图、公式、表格编号样式
\RequirePackage{caption}
\captionsetup{labelformat=default,labelsep=space, skip=5pt}

% 数学公式宏包
\RequirePackage{amsmath}


\RequirePackage{titlesec}
\titlespacing{\section}{0pt}{17pt}{16.5pt}
\titlespacing{\subsection}{0pt}{13pt}{13pt}
\titlespacing{\subsubsection}{0pt}{13pt}{13pt}

% 列举
\RequirePackage{enumitem}

% 目录
\RequirePackage{tocloft}
\setcounter{tocdepth}{2}

\renewcommand{\contentsname}{\textmd{\heiti\zihao{3}\bfseries\centerline{目 \quad 录}}}
\renewcommand{\cftchapleader}{\cftdotfill{0.6}}
\renewcommand{\cftsecleader}{\cftdotfill{0.6}}
\renewcommand{\cftsubsecleader}{\cftdotfill{0.6}}



% 全部顶格
\cftsetindents{chapter}{0em}{0em}
\cftsetindents{section}{0em}{0em}
\cftsetindents{subsection}{0em}{0em}

% 设置字体
\renewcommand{\cftchapfont}{\bfseries\heiti\zihao{4}}
\renewcommand{\cftsecfont}{\bfseries\heiti\zihao{-4}}
\renewcommand{\cftsubsecfont}{\songti\zihao{-4}}

% chapter的段后留白为10pt
\setlength{\cftaftertoctitleskip}{15pt}
\setlength{\cftbeforesecskip}{2pt}


% 插图清单
\newcommand{\listoffiguresandtables}{
  \def\listfigurename{插图清单}%
  \def\listtablename{附表清单}%

  \let\oldnumberline\numberline
  \renewcommand{\numberline}{图~\oldnumberline}

  % 调整插图清单这几个字的格式
  \renewcommand{\cftloftitlefont}{\hfill\heiti\zihao{3}\bfseries}
  \renewcommand{\cftafterloftitle}{\hfill}

  \renewcommand{\cftfigleader}{\cftdotfill{0.6}}
  \renewcommand{\cfttableader}{\cftdotfill{0.6}}

  \renewcommand{\cftlottitlefont}{\hfill\heiti\zihao{3}\bfseries}
  \renewcommand{\cftafterlottitle}{\hfill}

  \vspace*{-5em}
  \phantomsection     % 超链接
  \markboth{插图清单}{}
  \addcontentsline{toc}{chapter}{插图清单}
  \listoffigures
  \thispagestyle{thesis}
  \clearpage
  \renewcommand{\numberline}{表~\oldnumberline}
  \vspace*{-5em}
  \phantomsection     % 超链接
  \markboth{附表清单}{}
  \addcontentsline{toc}{chapter}{附表清单}
  \listoftables
  \thispagestyle{thesis}
  \let\numberline\oldnumberline
  \clearpage
}


% 内容模板
% 封面
\newcommand{\dunderline}[3][-6pt]{{
  \setbox0=\hbox{#3}
  \ooalign{\copy0\cr\rule[\dimexpr#1-#2\relax]{\wd0}{#2}}
}}

\newcommand{\datebox}[2]{
    \hspace{1.4cm}\songti\zihao{3}\textbf{\selectfont{#1~\dunderline{1pt}{\makebox[6cm][c]{#2}}}}
}


\RequirePackage{xcolor}
\RequirePackage{tabularray}
\RequirePackage[normalem]{ulem}
\renewcommand\ULthickness{1pt} 
\RequirePackage{xparse}

\NewDocumentCommand{\customtitle}{m}{%
  \def\do##1{\uline{\hfill{##1}\hfill}\par}%
  \docsvlist{#1}%
}

\newcommand{\coverpage}{
  \begin{titlepage}

    \vspace*{-1cm}
  
    \noindent
    \begin{tblr}{
      rows = {8mm},
      colspec = {X[1]X[3]X[0.5]X[1]X[2]},
      width = \textwidth
      }
      分类号: & \uline{\hfill \CUCThesis@Classification \hfill} & & 单位代码: & \uline{ \hfill 10033 \hfill} \\
      密 \hspace*{0.5em} 级: & \uline{\hfill \CUCThesis@Security \hfill} & & 学 \hspace*{1.4em} 号: & \uline{\hfill \CUCThesis@StudentID \hfill} \\
    \end{tblr}


    \vspace*{0.6cm}
    \vfill

    % 插入一张图
    \begin{figure}[htbp]
      \centering
      \includegraphics[width=0.48\textwidth]{coverimg/CUCText.png}
    \end{figure}

    \vspace*{-3mm}
    \centering\zihao{-1}\songti{ \CUCThesis@Type }
    
    \vspace{0.6cm}
    \vfill

    \begin{figure}[htbp]
      \centering
      \includegraphics[width=0.18\textwidth]{coverimg/CUCLogo.png}
    \end{figure}

    \vfill

    \noindent
    \zihao{-3}\textbf{
    \begin{tblr}{
      colspec = {cX},
      }
      中文论文题目: & \CUCThesis@TitleinCover \\
      英文论文题目: & \CUCThesis@TitleinCoverEN \\
    \end{tblr}
    }
    
    \vspace{10mm}
    \vfill

    \noindent \centering
    \begin{tblr}{
      colspec = {cX},
      width = 0.65\textwidth,
      }
      申请人姓名: & \uline{\hfill \CUCThesis@Author \hfill} \\
      指导教师: & \uline{\hfill \CUCThesis@Supervisor \hfill} \\
      专业名称: & \uline{\hfill \CUCThesis@Major \hfill} \\
      研究方向: & \uline{\hfill \CUCThesis@Research \hfill} \\
      所在学院: & \uline{\hfill \CUCThesis@College \hfill} \\
    \end{tblr}

    \vspace{8mm}

    \centering
    \datebox{论文提交日期}{\CUCThesis@Date}
  \end{titlepage}
  
  \clearpage
}

% 中国传媒大学研究生学位论文独创性声明
\newcommand\copyrightpage[1][]{%
  \thispagestyle{empty}%
  \begin{center}
    \zihao{-2} 中国传媒大学研究生学位论文独创性声明
  \end{center}

  \vspace{1em}

  本人声明所呈交的学位论文是本人在导师指导下进行的研究工作及取得的研究成果。除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得 \underline{ \heiti \textbf{中国传媒大学 } }或其他教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示谢意。

  \vspace{2em}

  学位论文作者签名：             签字日期：        年    月    日

  \vspace{3em}

  \begin{center}
    \zihao{-2} 学位论文版权使用授权书
  \end{center}

  \vspace{1em}

  本学位论文作者完全了解 \underline{ \heiti \textbf{中国传媒大学 } }有权保留并向国家有关部门或机构送交本论文的复印件和磁盘，允许论文被查阅和借阅。本人授权 \underline{ \heiti \textbf{中国传媒大学 } }可以将学位论文的全部或部分内容编入有关数据库进行检索和传播，可以采用影印、缩印或扫描等复制手段保存、汇编学位论文。

  （保密的学位论文在解密后适用本授权书）

    
  签字日期：      年    月    日           签字日期：      年    月    日

  \clearpage
}

% 中文摘要
\newenvironment{cnabstract}[1][关键词]{
  \clearpage
  \phantomsection     % 超链接
  \markboth{摘 \quad 要}{}
  \addcontentsline{toc}{chapter}{摘 \quad 要}
  % 罗马数字页码
  \pagenumbering{Roman}
  % 居中
  \setup{
  % 中文关键词
  Keywords = #1,
  }

  \begin{center}
    \heiti\zihao{3} \bfseries \CUCThesis@TitleinBody
    
    \vspace{1em}

    \heiti\zihao{-3} \bfseries 摘 \quad 要

    \vspace{1em}
  \end{center}

}{

  \vspace{1em}
  {\heiti\zihao{4} 关键词：}
  \CUCThesis@Keywords
  \clearpage
}

% 英文摘要
\newenvironment{enabstract}[1][Keywords]{
  \clearpage
  \phantomsection     % 超链接
  \markboth{ABSTRACT}{}
  \addcontentsline{toc}{chapter}{ABSTRACT}
  \setup{
  % 英文关键词
  KeywordsEN = #1,
  }

  \begin{center}
    \textit{ \zihao{3} \bfseries \LaTeX{} Template for Doctoral and Master Dissertations of Communication University of China}
    
    \vspace{2em}

    \zihao{4} \bfseries ABSTRACT

    \vspace{1em}
  \end{center}

}{
  \vspace{2em}

  \noindent
  {\zihao{4} \bfseries KEYWORDS:}
  % 斜体
  \textit{\CUCThesis@KeywordsEN}
  \clearpage
}


% 参考文献
\RequirePackage[backend=biber,hyperref=true,sorting=none,style=gb7714-2015,url=false,gbtype=true]{biblatex}
\ExecuteBibliographyOptions{
  gbnamefmt = lowercase,
  gbpub     = false,
  gbalign   = left,
}

\newenvironment{reference}{
  \clearpage
  \phantomsection     % 超链接
  \markboth{参考文献}{}
  \addcontentsline{toc}{chapter}{参考文献}
  % 居中
  \begin{center}
    \heiti\zihao{3} \bfseries 参考文献
  \end{center}

}{}

% 作者简历及在学期间所取得的科研成果
\newenvironment{resume}{
  \clearpage
  \phantomsection     % 超链接
  \markboth{作者简历及在学期间所取得的科研成果}{}
  \addcontentsline{toc}{chapter}{作者简历及在学期间所取得的科研成果}
  % 居中
  \begin{center}
    \heiti\zihao{3} \bfseries 作者简历及在学期间所取得的科研成果
  \end{center}

  \newlist{achievements}{enumerate}{1}
  \setlist[achievements]{
    label      = [\arabic*],
    align      = left,
    leftmargin = 10mm,
    topsep     = 6bp,
    parsep     = 0bp,
    partopsep  = 0bp,
    itemsep    = 6bp,
    labelsep   = !,
    resume     = achievements,
  }
  \ctexset{
    section = {
      format    += \centering,
      numbering = false,
    },
    subsection = {
      format     += \centering,
      numbering  = false,
    },
  }%
}{}
% 致谢
\newenvironment{acknowledgements}{
  \clearpage
  \phantomsection     % 超链接
  \markboth{致 \quad 谢}{}
  \addcontentsline{toc}{chapter}{致 \quad 谢}
  \thispagestyle{nofoot}
  % 居中
  \begin{center}
    \heiti\zihao{3} \bfseries 致 \quad 谢
  \end{center}

}{}