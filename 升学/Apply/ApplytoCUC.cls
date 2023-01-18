% 中国传媒大学考研/夏令营/推免/申博材料非官方LaTeX模板
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ApplytoCUC}


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

\RequirePackage{pgfkeys}
\RequirePackage{ifthen}
\pgfkeys{%
    % 文档类别
    Type/.store in          = \CUC@Type,
    % 起始页码编号
    StartPage/.store in     = \CUC@StartPage,
    % 夏令营Title
    Title/.store in         = \CUC@Title,
}

\newcommand{\setup}[1]{
    \pgfkeys{#1}
    % 设置页码
    \setcounter{page}{\CUC@StartPage}
}


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

% Logo
\newcommand{\insertLogo}{
    \begin{figure}[ht]
        \centering
        \includegraphics[width=6.3cm]{cuc}
    \end{figure}
}
% 文件Title 【都是三号粗体、居中，个人陈述为黑体字，科研设想为宋体字】
\newcommand{\insertTitle}{
\begin{center}
    \textbf{
    \zihao{3}{
        \ifcase\CUC@Type
            % Type = 0 % {报考攻读硕士学位研究生个人陈述}
            \heiti{报考攻读硕士学位研究生个人陈述}
            \or
            % Type = 1 % {报考攻读硕士学位研究生科研设想或专业实践计划}
            \songti{报考攻读硕士学位研究生科研设想或专业实践计划}
            \or
            % Type = 2 % {报考攻读博士学位研究生申请信},
            \heiti{报考攻读博士学位研究生申请信}
            \or
            % Type = 3 % {拟攻读博士学位的研究计划书},
            \songti{拟攻读博士学位的研究计划书}
            \or
            % Type = 4, % {20XX年优秀大学生夏令营个人陈述}
            \heiti{\CUC@Title}
            \or
            % Type = 5, % {招收推荐免试攻读硕士学位研究生（含直博生）个人陈述}
            \zihao{-3}{\heiti{招收推荐免试攻读硕士学位研究生（含直博生）个人陈述}}
        \fi
        }
    }
\end{center}
}

% 题干要求 【个人陈述为单倍行距，科研设想为1.3倍行距，且前后有空格】
\newcommand{\insertQuestion}{
\ifcase\CUC@Type

    % Type = 0 % {报考攻读硕士学位研究生个人陈述}
\begin{spacing}{1.1}
\begin{mainbox}
请从以下几方面进行陈述（限5000字以内）：

一、个人简历

二、自我评价：从德智体美劳五个方面，结合本人的长处和弱项进行全面评价。

三、报考原因：说明为什么攻读硕士学位研究生，并选择中国传媒大学？为什么选择你所报考的专业？

四、职业规划：结合自我评价情况，简要说明自己未来的职业规划，包含研究生在读期间的阶段性规划，以及攻读硕士学位研究生对自己的职业发展有何作用。

五、对研究生培养如何落实立德树人有何建议？如何实践立德树人？

六、简要陈述本人的特长或才能，或提供其他能证明自身综合素质和培养潜质的材料。

\end{mainbox}
\end{spacing}
    \or
    % Type = 1 % {报考攻读硕士学位研究生科研设想或专业实践计划}
\begin{mainbox}
    \vspace{1em}
    \begin{spacing}{1.4}
    请阐述你在未来硕士阶段的科研设想或专业实践计划，包括科研或专业实践的选题、意义、已有基础、基本思路、研究或实践方法、预期目标等。（3000字以内）
    \end{spacing}
\end{mainbox}
    \or
    % Type = 2 % {报考攻读博士学位研究生申请信},
\begin{spacing}{1.1}
    \begin{mainbox}
    请从以下几方面进行陈述（限3000字以内）：

    一、个人简历

    二、自我评价：从德智体美劳五个方面，结合本人的长处和弱项进行全面评价。

    三、报考原因：说明为什么攻读博士学位研究生，并选择中国传媒大学？为什么选择你所报考的专业？

    四、职业规划：结合自我评价情况，简要说明自己未来的职业规划，包含研究生在读期间的阶段性规划，以及攻读博士学位研究生对自己的职业发展有何作用。

    五、对研究生培养如何落实立德树人有何建议？如何实践立德树人？

    六、简要陈述本人的特长或才能，或提供其他能证明自身综合素质和培养潜质的材料。
        
    \end{mainbox}
\end{spacing}
    \or
    % Type = 3 % {拟攻读博士学位的研究计划书},
\begin{mainbox}
    \vspace{1em}
    \begin{spacing}{1.4}
        请介绍你在未来博士学习期间拟致力于研究的科学问题、已有基础、基本思路、研究方法以及预期目标等（不少于5000字）。
    \end{spacing}
\end{mainbox}
    \or
    % Type = 4, % {20XX年优秀大学生夏令营个人陈述}
\begin{spacing}{1.1}
    \begin{mainbox}
        请从以下几方面进行陈述（限3000字以内）：

        一、个人简历

        二、自我评价：从德智体美劳五个方面，结合本人的长处和弱项进行全面评价。

        三、报考原因：说明为什么选择中国传媒大学？为什么选择你所报考的专业？

        四、职业规划：结合自我评价情况，简要说明自己未来的职业规划，包含研究生在读期间的阶段性规划，以及攻读硕士学位研究生对自己的职业发展有何作用。

        五、对研究生培养如何落实立德树人有何建议？如何实践立德树人？

        六、简要陈述本人的特长或才能，或提供其他能证明自身综合素质和培养潜质的材料。
        
    \end{mainbox}
\end{spacing}
    \or
    % Type = 5, % {招收推荐免试攻读硕士学位研究生（含直博生）个人陈述}
\begin{spacing}{1.1}
    \begin{mainbox}
        请从以下几方面进行陈述（限3000字以内）：

        一、个人简历

        二、自我评价：从德智体美劳五个方面，结合本人的长处和弱项进行全面评价。

        三、报考原因：说明为什么攻读硕士学位研究生（含直博生），并选择中国传媒大学？为什么选择你所报考的专业？

        四、职业规划：结合自我评价情况，简要说明自己未来的职业规划，包含研究生在读期间的阶段性规划，以及攻读硕士学位研究生（含直博生）对自己的职业发展有何作用。

        五、对研究生培养如何落实立德树人有何建议？如何实践立德树人？

        六、简要陈述本人的特长或才能，或提供其他能证明自身综合素质和培养潜质的材料。

    \end{mainbox}
\end{spacing}
\fi
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