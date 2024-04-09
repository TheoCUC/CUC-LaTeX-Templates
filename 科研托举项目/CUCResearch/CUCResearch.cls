% 中国传媒大学考研/夏令营/推免/申博材料非官方LaTeX模板
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CUCResearch}


% pass unknown options to ctexart
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax

\LoadClass[scheme=chinese, a4paper, zihao=-4,AutoFakeBold]{ctexart}

% 数学公式宏包
% \RequirePackage{amsmath}

% 图片宏包
\RequirePackage{graphicx}
\RequirePackage{realboxes}
% 表格宏包
\RequirePackage{tabularray}
\RequirePackage{setspace}
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

% 设置行距
\RequirePackage{setspace}
% \renewcommand{\baselinestretch}{1.35}

% 英文字体
\RequirePackage{fontspec}
\setmainfont{Times New Roman}

% 设置章节的编号格式
\ctexset{
    section = {
        name={,、},
        number={\chinese{section}},
        format={\bfseries\raggedright\fangsong\zihao{-4}},
        aftername={\enspace},
        beforeskip={10bp},
        afterskip={6bp}
    },
    subsection = {
        name={,.},
        number={\arabic{subsection}},
        format={\bfseries\raggedright\fangsong\zihao{-4}},
        aftername={\enspace},
        beforeskip={10bp},
        afterskip={6bp}
    },
    subsubsection = {
        name={,.},
        number={\arabic{subsubsection}},
        format={\raggedright\fangsong\zihao{-4}},
        aftername={\enspace},
        beforeskip={10bp},
        afterskip={6bp}
    }
}

% 参考文献

\RequirePackage[backend=biber,style=gb7714-2015,url=false]{biblatex}
%  ********************
%  * 设置文档输入参数 *
%  ********************

% tColorbox

\RequirePackage[most]{tcolorbox}
\usetikzlibrary{calc}

\tcbset{%show bounding box,%
  enhanced, breakable, sharp corners, nobeforeafter,%
  colback=white, coltitle=black, colbacktitle=white, colframe=black,%
  bottomrule=.5pt, after skip=-1.5pt,%bottomrule at break=.5pt,
  before upper={\parindent 2em},%
  overlay middle={%
    \draw[line width=.5pt] (frame.north west)--(frame.north east);
    \draw[line width=.5pt] (frame.south west)--(frame.south east);%
  },%
  overlay last={%
    \draw[line width=.5pt] (frame.north west)--(frame.north east);},%
}

\newtcolorbox{mainbox}[0]{% 
    colback=white, colframe=black, boxrule=0.5pt,
    boxsep = 0pt, left = 0.6em, right = 0.6em, top = 1em, bottom = 1em,
    overlay unbroken and first={%
    \draw[line width=.5pt] (frame.south west)--(frame.south east);% bottom hline
  },%
}


\newcommand{\ContentBox}[3]{
% 小三号宋体加粗
{\noindent \zihao{3}\bfseries #1}
\vspace{0.5em}
\begin{mainbox}
\noindent #2

    #3
\end{mainbox}
\vspace{0.8em}
}

\newcommand{\ApplyCUC}[1]{
% 中间放上CUC Logo
\insertLogo{}
\vskip -0.4cm
% 根据输入类型，选择不同的标题
\insertTitle{}
\vspace{1em}
% 字体为仿宋
\fangsong
% 根据输入类型，选择不同的内容
\insertQuestion{}
% 填写的主要内容
\begin{mainbox}
    #1
\end{mainbox}
}