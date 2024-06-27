% 中国传媒大学硕士生开题报告表非官方LaTeX模板
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CUCMidterm}


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
    % 论文类别
    Type/.store in          = \CUC@Type,
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
    % 入学年月
    Enrollment/.store in     = \CUC@Enrollment,
    % 选题报告会时间
    Time/.store in          = \CUC@Time,
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
        \ifcase\CUC@Type
        % Type=0, 学硕
            \heiti{中国传媒大学学术学位硕士研究生学位论文中期考核申请表}
        \or
        % Type=1, 专硕
            \heiti{中国传媒大学专业学位硕士研究生学位论文中期考核申请表}
    }
}
\end{center}
}

% 生成个人信息表头
\RequirePackage{tabularray}
\RequirePackage{setspace}

\newcommand{\maketable}{
\begin{spacing}{0.5}
\ifcase\CUC@Type
% Type=0, 学硕
\begin{flushleft}
    \zihao{5}
    \begin{tblr}{
    rows = {1em},
    colspec = {p{4em}Xp{5em}X},
    }
    
        % \hline
        姓 \hspace{1em} 名: &\CUC@Name& 学 \hspace{1em} 号:   &\CUC@StudentID\\
        % \hline
        导 \hspace{1em} 师: &\CUC@Advisor  & 培养单位: & \CUC@Department \\
        % \hline
        \SetCell[c=2]{l} 一级学科及代码：\CUC@Subject & &
        \SetCell[c=2]{l} 二级学科及代码：\CUC@SubSubject \\
        % \hline
        \SetCell[c=2]{l} 入学年月：\CUC@Enrollment & &
        \SetCell[c=2]{l} 选题报告会时间：\CUC@Time \\
    \end{tblr}
\end{flushleft}
\or
% Type=1, 专硕
\begin{flushleft}
    \zihao{5}
    \begin{tblr}{
    rows = {1em},
    colspec = {p{4em}Xp{5em}X},
    }
        \SetCell[c=2]{l} 姓名:\CUC@Name & &
        \SetCell[c=2]{l} 学 \hspace{1em} 号:：\CUC@StudentID \\
        % \hline
        \SetCell[c=2]{l} 领域（代码）:\CUC@Subject & &
        \SetCell[c=2]{l} 研究方向：\CUC@SubSubject \\
        % \hline
        \SetCell[c=2]{l} 责任导师：\CUC@Advisor & &
        \SetCell[c=2]{l} 培养单位：\CUC@Department \\
        % \hline
        \SetCell[c=2]{l} 入学年月：\CUC@Enrollment & & & & \\
    
    \end{tblr}
\end{flushleft}
\fi
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
\newcommand{\makeZQtable}[5]{
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
    \begin{titleleft}{个人总结\\（不少于\\500字，\\5号宋体，\\可加页）}
        #1
    \end{titleleft}
    % 清除计数器
    \setcounter{section}{0}
    % 选题报告
    \begin{titleleft}{文献综述\\（不少于\\5000字，\\5号宋体，\\可加页）}

        #2

    \end{titleleft}
    % 进展情况
    \setcounter{section}{0}
    \begin{titleleft}{学位论文\\进展情况\\（已完成\\内容\\附在此处）}

        #3

    \end{titleleft}
    % 导师意见
    \begin{titleleft}{
        \ifcase\CUC@Type
        导师评语\\及建议
        \or
        责任导师\\评语\\及\\建议
        \fi
        }
        
        % 内容
        #4
        % 是否同意
        \begin{flushleft}
            \begin{tblr}{colspec = {ll}}
            是否同意参加中期考核: & \checked \hspace{5pt} 同意 \\
                                    & \unchecked \hspace{5pt} 不同意 \\
            \end{tblr}
        \end{flushleft}
        % 导师签字
        \hspace{2em} 导师：（签字）\makebox[7em]{\CUC@AdvisorSign}
    
        \vspace{1em}
        % 日期
        \raggedleft{\CUC@Date}
    \end{titleleft}
    % 培养单位建议
    \begin{titleleft}{培养单位\\建议}
        \vspace{3em}
        #5 
        \newline
        \vspace{2em}
        
        % \end{flushleft}
        \hspace{2em} 主管领导：（签字）\\
        \vspace{1em}
        \hspace{6em} （公章） \\
        \vspace{1em}
        % 日期
        \raggedleft{\CUC@Date}
    \end{titleleft}
    % 结束
}