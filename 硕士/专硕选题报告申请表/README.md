# 中国传媒大学专业学位硕士研究生学位论文选题报告申请表（非官方模板）

该模板部分代码借鉴于[孙永科/西南林业大学Latex模板](https://gitee.com/sunyongke/swfu-latex)。

该模板格式依托[Word版本](word/1-1中国传媒大学专业学位硕士研究生学位论文选题报告申请表.docx)提取，可以此为依据对比。

[example.tex](example.tex)提供了该模板的使用实例，根据注释填写内容即可。

## 超链接

`tex` 文件的导言区提供了三种超链接的设置，可以选择：
* 默认配置，超链接上会有一个彩色方块，好多期刊论文都是这样
* 简化样式，使用彩色标识不同超链接
* 极简样式，可以超链接，但都是黑色的
* 什么都不要

## 参考文献

默认使用 `BibLaTeX` ，后端默认为 `biber`。因此，带有参考文献的编译链为：`xelatex -> biber -> xelatex*2`。使用VS Code时，相关配置如下：

```json
"latex-workshop.latex.tools": [
        {
            "name": "xelatex",
            "command": "xelatex",
            "args": [
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "%DOC%"
            ]
        },
        {
            "name": "biber",
            "command": "biber",
            "args": [
                "%DOCFILE%"
            ]
        },
    ],
    "latex-workshop.latex.recipes": [
        {
            "name": "xelatex",
            "tools": [
                "xelatex"
            ]
        },
        {
            "name": "biber",
            "tools": [
                "biber"
            ]
        },
        {
            "name": "xelatex->biber->xelatex->xelatex",
            "tools": [
                "xelatex",
                "biber",
                "xelatex",
                "xelatex",
            ]
        },
    ],
```

## 更新日志

* 2023.1.15 第一版