% 中国传媒大学硕士生开题报告表非官方LaTeX模板
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CUCProposal}


% pass unknown options to ctexart
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax

\LoadClass[scheme=chinese, a4paper, zihao=5]{ctexart}


% 打勾
\RequirePackage{amssymb}
\newcommand{\unchecked}{$\square$}
\newcommand{\checked}{$\checkmark$}
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
\RequirePackage[left=3.18cm,right=3.18cm,top=2.54cm,bottom=2.54cm]{geometry}

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
        format={\bfseries\raggedright\heiti\zihao{5}},
        aftername={\enspace},
        beforeskip={10bp},
        afterskip={6bp}
    },
    subsection = {
        name={,.},
        number={\arabic{subsection}},
        format={\bfseries\raggedright\heiti\zihao{5}},
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
    % 导师
    Advisor/.store in      = \CUC@Advisor,
    % 培养单位
    Department/.store in    = \CUC@Department,
    % 一级学科及代码
    Subject/.store in       = \CUC@Subject,
    % 二级学科及代码
    SubSubject/.store in    = \CUC@SubSubject,
    % 论文题目
    Title/.store in         = \CUC@Title,
    % 日期
    Date/.store in          = \CUC@Date,
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
\newtcolorbox{titleleft}[1]{% 
  frame hidden, left=2.3cm,% 文字与左侧边距
  borderline={.4pt}{0pt}{black},% vlines
  borderline west={.4pt}{2.11cm}{black},% 2nd left vline
  overlay unbroken and first={%
    % \node[anchor=west, text width=2cm] at (frame.west) {\begin{center}#1\end{center}};
    \node[anchor=west, text width=2cm, text centered] at (frame.west) {#1};
    \draw[line width=.2pt] (frame.south west)--(frame.south east);% bottom hline
  },%
}
\newtcolorbox{person}[1]{% 
  frame hidden, left=2.11cm,% 文字与左侧边距
  borderline={0pt}{0pt}{black},% vlines
%   borderline west={0pt}{2.11cm}{black},% 2nd left vline
%   overlay unbroken and first={%
%     % \node[anchor=west, text width=2cm] at (frame.west) {\begin{center}#1\end{center}};
%     % \node[anchor=west, text width=2cm, text centered] at (frame.west) {#1};
%     % \draw[line width=0pt] (frame.south west)--(frame.south east);% bottom hline
%   },%
}

% 生成Title
\newcommand{\makeKTtitle}{
\begin{center}
\bfseries{
    \zihao{-3}{
    \heiti{中国传媒大学专业学位硕士研究生学位论文选题报告申请表}
    }
}
\end{center}
}

% 生成个人信息表头
\RequirePackage{tabularray}
\RequirePackage{setspace}

\newcommand{\maketable}{
\begin{spacing}{0.5}
\begin{flushleft}
    \zihao{5}
    \begin{tblr}{
    rows = {1em},
    colspec = {lXp{5em}X},
    }
    % \hline
    姓 \hspace{1.5em} 名: &\CUC@Name& 学 \hspace{1.5em} 号:   &\CUC@StudentID\\
    % \hline
    责任导师: &\CUC@Advisor  & 培养单位: & \CUC@Department \\
    % \hline
    \SetCell[c=1]{l} 领域及代码:&\CUC@Subject&
    \SetCell[c=1]{l} 研究方向：&\CUC@SubSubject \\
    % \hline
    \end{tblr}
\end{flushleft}
\end{spacing}
}

% 中间的申请人

\newcommand{\makeapplicant}{
\begin{person}{}
    \raggedleft{
        申请人：\CUC@Name \hspace{1em} 申请日期：\CUC@Date
    }
\end{person}
}

% 生成开题报告表
\newcommand{\makeKTtable}[3]{
    % Title
    \makeKTtitle{}
    % 个人信息区
    \maketable{}
    % 加一点间隔 跟表格区分开
    \vspace{0.5em}
    % 字号为5号字
    \zihao{5}
    % 论文题目
    \begin{titleleft}{论文题目}
        \begin{center}
            \CUC@Title
        \end{center}
    \end{titleleft}
    % 文献综述
    \begin{titleleft}{选题\\相关文献\\阅读情况\\（不少于\\800字，\\5号宋体，\\可加页）}
        #1
    \end{titleleft}
    % 清除计数器
    \setcounter{section}{0}
    % 选题报告
    \begin{titleleft}{选题报告\\（不少于\\3000字，\\5号宋体，\\可加页）}
        #2
    \end{titleleft}
    % 申请人及日期
    \makeapplicant{}
    % 导师意见
    \begin{titleleft}{责任导师\\评语\\及建议}
        % 内容
        #3
        % 是否同意
        \begin{flushleft}
            \begin{tblr}{colspec = {ll}}
            是否同意参加选题报告会: & \checked \hspace{5pt} 同意 \\
                                    & \unchecked \hspace{5pt} 不同意 \\
            \end{tblr}
        \end{flushleft}
        % 导师签字
        \hspace{2em} 责任导师：（签字）\makebox[7em]{\CUC@AdvisorSign}
    
        \vspace{1em}
        % 日期
        \raggedleft{\CUC@Date}
    \end{titleleft}
    % 结束
}