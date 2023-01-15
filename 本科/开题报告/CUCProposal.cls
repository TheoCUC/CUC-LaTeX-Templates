% 中国传媒大学毕业论文（设计）开题报告表
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CUCProposal}


% pass unknown options to ctexart
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax

\LoadClass[scheme=chinese, a4paper, zihao=-4]{ctexart}

% 数学公式宏包
% \RequirePackage{amsmath}

% 图片宏包
\RequirePackage{graphicx}
\RequirePackage{realboxes}
% 图表编号
\RequirePackage{caption,subcaption}
\captionsetup{labelformat=default,labelsep=space}
%  ********************
%  * 调整文档布局参数 *
%  ********************

% 调整页边距
\RequirePackage[left=2.195cm,right=2.195cm,top=2.195cm,bottom=2.195cm]{geometry}

% 页眉页脚
\pagestyle{plain}

% 设置 1.25 倍行距
\RequirePackage{setspace}
\renewcommand{\baselinestretch}{1.35}

% 英文字体
\RequirePackage{fontspec}
\setmainfont{Times New Roman}

% 设置章节的编号格式
\ctexset{
    section = {
        name={,、},
        number={\chinese{section}},
        format={\bfseries\raggedright\heiti\zihao{-4}},
        aftername={\enspace},
        beforeskip={10bp},
        afterskip={6bp}
    },
    subsection = {
        name={,.},
        number={\arabic{subsection}},
        format={\bfseries\raggedright\heiti\zihao{-4}},
        aftername={\enspace},
        beforeskip={10bp},
        afterskip={6bp}
    },
    subsubsection = {
        name={,.},
        number={\arabic{subsubsection}},
        format={\raggedright\heiti\zihao{-4}},
        aftername={\enspace},
        beforeskip={10bp},
        afterskip={6bp}
    }
}

% 参考文献
% \RequirePackage[backend=biber,style=gb7714-2015,gbpub=false,gbtype=false,gbpunctin=false,url=false,doi=false,isbn=false]{biblatex}
\RequirePackage[backend=biber,hyperref=true,sorting=none,style=gb7714-2015,url=false]{biblatex}

%  ********************
%  * 设置文档输入参数 *
%  ********************

\RequirePackage{pgfkeys}

\pgfkeys{%
    % 学生姓名
    Name/.store in          = \CUC@Name , 
    % 学号
    StudentID/.store in     = \CUC@StudentID,
    % 指导老师
    Advisor/.store in      = \CUC@Advisor,
    % 专业
    Subject/.store in       = \CUC@Subject,
    % 毕设题目
    Title/.store in         = \CUC@Title,
    % 日期
    Date/.store in          = \CUC@Date,
    % 导师签字
    AdvisorSign/.store in   = \CUC@AdvisorSign,
}

\newcommand{\setup}[1]{\pgfkeys{#1}}

% tColorbox

\RequirePackage[most]{tcolorbox}
\usetikzlibrary{calc}

\tcbset{%show bounding box,%
    enhanced, breakable, sharp corners, nobeforeafter,%
    colback=white, coltitle=black, colbacktitle=white, colframe=black,%
    bottomrule=.2pt, after skip=-1.5pt,%bottomrule at break=.5pt,
    before upper={\parindent 2em},%
    overlay middle={%
        \draw[line width=.2pt] (frame.north west)--(frame.north east);
        \draw[line width=.2pt] (frame.south west)--(frame.south east);%
    },%
    overlay last={%
        \draw[line width=.2pt] (frame.north west)--(frame.north east);},%
}

\newtcolorbox{mainbox}{% 
    frame hidden, left=1em,% 文字与左侧边距
    borderline={0.2 pt}{0.2pt}{black},% vlines
    overlay unbroken and first={%
        \draw[line width=.2pt] (frame.south west)--(frame.south east);% bottom hline
    },%
}

% 表格包
\RequirePackage{tabularray}
\RequirePackage{setspace}


% 生成Title
\newcommand{\makeKTtitle}{
\begin{center}
\bfseries{
    \zihao{4}{
    \heiti{中国传媒大学毕业论文（设计）开题报告表}
    }
}
\end{center}
}

% 生成表头
\newcommand{\makehead}{
    \begin{tblr}{
        hline{1,2,3} = {0.2pt},
        vlines = {0.2pt},
        width = \linewidth,
        rows = {2.5em},
        colspec ={Q[c,m,5em]Q[c,m,3.88em]Q[c,m,3.31em]Q[c,m,5.55em]Q[c,m,3.31em]X[c,m]}
        }
        % \hline
        毕设题目 & \SetCell[c=5]{c}{\CUC@Title} \\
        % \hline
        学生姓名 & \CUC@Name & 学号 & \CUC@StudentID & 专业 & \CUC@Subject \\
        % \hline
        指导老师 & \SetCell[c=5]{c}{\CUC@Advisor} \\
    \end{tblr}  
}

% 生成主体
\newcommand{\makebody}[1]{
\begin{mainbox}
    #1
    % 加一点间距
    \vspace*{5pt}
    % 日期和学生签字
    \noindent
    \begin{tblr}{
        width = \linewidth,
        rows = {2.5em},
        colspec ={llX[r,b]X[-1,b]}
        }
        日期：& \CUC@Date & 指导老师签字：& \CUC@AdvisorSign \\
    \end{tblr}
\end{mainbox}
}

% 中期结果
\newcommand{\makeresult}[1]{
\begin{tblr}{
    hline{2} = {0.2pt},
    vlines = {0.2pt},
    width = \linewidth,
    rows = {2.5em},
    colspec ={Q[c,m,5em]X}
    }
    开题结果 & #1 \\
\end{tblr}
}

% 生成导师签字和日期
\newcommand{\makeadvisor}{  
\begin{tblr}{
    hline{3} = {0.2pt},
    vline{1,4} = {0.2pt},
    width = \linewidth,
    rows = {2.5em},
    colspec ={Q[c,m]XX[r]}
    }
    开题评审小组组长（签章）：& \SetCell[r=2]{m}{} &  \\
                &                       & \CUC@Date \\
\end{tblr} 
}


% 生成开题报告表
\newcommand{\makeKTtable}[2]{
    % Title
    \makeKTtitle{}
    % 加一点间隔 跟表格区分开
    \vspace{3pt}
    % 接下来都要居中
    \begin{center}
        \makehead{}
        % 调整间距
        \vskip -2.45pt
        % 开题报告主体
        \makebody{#1}
        % 调整间距
        \vskip 1pt
        % 开题结果
        \makeresult{#2}
        % 调整间距
        \vskip -8pt
        % 导师签字和日期
        \makeadvisor{}
    \end{center}
    % 结束
}