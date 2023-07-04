# 中国传媒大学硕士/博士学位论文（非官方模板）

该模板部分代码借鉴于清华大学学位论文项目代码[tuna/thuthesis](https://github.com/tuna/thuthesis)，在此基础上根据中国传媒大学学位论文（自然科学版）规范进行了简化和修改。

由于LaTeX与Word的差异，二者在排版格式上无法做到完全一致，且学位论文规范文件中也存在前后不一致的情况，建议谨慎使用该模板，并在必要时手动修改样式文档。

⚠️ 本模板制作未经过中国传媒大学官方授权，同学们在使用该模板完成学位论文前一定要自行仔细阅读学位论文规范，并咨询导师意见。最终可能需要向学院提交word版

⚠️ 因使用该模板导致的任何格式审查问题均与本人无关

本模板中默认的参考文献、个人简历部分占位文档使用了清华大学学位论文项目[tuna/thuthesis](https://github.com/tuna/thuthesis)中的原文，如有不妥可联系进行删除更换。

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

* 2023.7.4 第一版