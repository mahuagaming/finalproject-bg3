<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ahshoe.20161120121808.1" a="E"><vh>@settings</vh>
<v t="ahshoe.20170315212615.1"><vh>@data qt-gui-plugin-style-sheet</vh></v>
<v t="ahshoe.20170315212626.1"><vh>@string initial_split_orientation = horizontal</vh></v>
</v>
<v t="yen.20170429110328.1" a="E"><vh>Installation</vh>
<v t="yen.20170429110336.1"><vh>Ubuntu 14.04</vh></v>
<v t="leo.20171119233721.1"><vh>Windows</vh></v>
<v t="leo.20171119233845.1"><vh>fontspec error</vh></v>
</v>
<v t="40323230.20170123213451.1"><vh>@button Report pdf</vh></v>
<v t="yen.20170429132400.1"><vh>協同著作規劃</vh></v>
<v t="yen.20170429103742.1" a="E"><vh>@path ./../</vh>
<v t="ahshoe.20170129120932.1" a="E"><vh>Readme</vh>
<v t="yen.20170429103940.1" a="E"><vh>@path markdown</vh>
<v t="40323230.20170130135731.1"><vh>@edit template.tex</vh></v>
<v t="ahshoe.20170322182713.1"><vh>@edit reference.md</vh></v>
<v t="ahshoe.20170322181453.1"><vh>@edit refer.bib</vh></v>
<v t="leo.20171119234752.1" a="E"><vh>封面以及摘要</vh>
<v t="ahshoe.20161120122151.1" a="E"><vh>@clean cover_and_abstract.md</vh>
<v t="ahshoe.20170317115820.1"><vh>abstract</vh></v>
</v>
</v>
<v t="leo.20171119234822.1" a="E"><vh>各章節內容</vh>
<v t="yen.20170429214845.1" a="E"><vh>@path paragraph</vh>
<v t="yen.20170429214838.1" a="E"><vh>@clean preface.md</vh>
<v t="leo.20190104143311.1"><vh>motivation</vh></v>
<v t="yen.20170429214838.3"><vh>purpose</vh></v>
</v>
<v t="yen.20170429215041.1" a="E"><vh>@clean application_software.md</vh>
<v t="leo.20190104152007.1"><vh>Onshape</vh></v>
<v t="yen.20170429215130.1"><vh>Inventor</vh></v>
<v t="yen.20170429215205.1"><vh>V-rep</vh></v>
</v>
<v t="yen.20170429215252.1" a="E"><vh>@clean design_process_and_introduction.md</vh>
<v t="yen.20170429215308.1"><vh>process</vh></v>
<v t="yen.20170429215316.1"><vh>introduction</vh></v>
</v>
<v t="yen.20170429215416.1" a="E"><vh>@clean issue_and_solution.md</vh>
<v t="yen.20170429215446.2"><vh>design</vh></v>
<v t="yen.20170429215446.3"><vh>v-rep</vh></v>
<v t="yen.20170429215446.4"><vh>report</vh></v>
</v>
<v t="yen.20170429215617.1" a="E"><vh>@clean conclusion.md</vh>
<v t="yen.20170429215851.1"><vh>Conclusion</vh></v>
</v>
</v>
</v>
</v>
<v t="ahshoe.20170129120858.1"><vh>@edit README.md</vh></v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="40323230.20170123213451.1">@language python
filename = "report"
import os, platform
import chapter
# 更換目錄到 markdown 
os.chdir("./../markdown")

# 若在 Linux 環境則使用 ukai.ttc 系統字形
if platform.system().lower()=="linux": font = "ukai.ttc"
# 在 windows 環境使用 SimSun 字形
elif platform.system().lower()=="windows": font = "SimSun"
else: font = "Arial"
fontsize = "12"
margin = "1in"
# --pdf-engine 使用 xelatex
# lang 請參照 https://tools.ietf.org/html/bcp47, 這裡的 zh-cmn 為 Mandarin Chinese 國語
# -V lang=zh-cmn 為一組 key=value 對應的 Variable 設定
# -N 表示 Number section headings in LaTeX, ConTeXt, HTML, or EPUB output. By default, sections are not numbered.
settingFlag = "--pdf-engine=xelatex -V lang=zh-cmn -N --toc --highlight-style kate -V documentclass=report  --filter pandoc-fignos --filter pandoc-tablenos --template=template.tex -V \"CJKmainfont:{0}\" -V fontsize={1}pt -V geometry:margin={2} --bibliography=refer.bib --csl=ieee.csl".format(font, fontsize, margin)
print("---Pandoc---")

# 選擇所要納入的 Markdown 檔案, 不納入的檔案名稱前方加上  # 即可
chapter_list = " ".join("./paragraph/" + i for i in [
"preface.md",
"application_software.md", 
"design_process_and_introduction.md", 
"issue_and_solution.md", 
"conclusion.md", 
#"references.md", 
#"github.md", 
#"fossil.md", 
#"onshape.md", 
#"cmsimfly.md", 
#"pygrouf.md", 
#"pyslvs.md", 
#"pylinkage.md", 
#"pyduino.md", 
])

# 若系統並未正確轉檔, 可以將 os.system 改為 g.es 表示要使用 Leo Editor 的 global 物件中的 echo string 將指令印在 log 區
# 然後複製指令, 然後在命令列視窗中的 markdown 目錄中執行, 就可以得到錯誤訊息
# 或許可以再從 https://stackoverflow.com/questions/26005583/return-value-of-x-os-system 中的建議改進此一指令
os.system("pandoc cover_and_abstract.md " + chapter_list + " reference.md -o ../pdf/report.pdf {}".format(settingFlag))
g.es("PDF 轉換完畢")
print('-'*12)</t>
<t tx="ahshoe.20161120121808.1"></t>
<t tx="ahshoe.20161120122151.1">---
university_zh: 'National Formosa University'
institute_zh: 'Mechanical Design Engineering'
category_zh: 'Computer-Aided Design Internship bg3 Final Report'
title_zh: '鋼球運動系統'
title_en: 'Marble Machine System'
author:
- 機械設計工程系二乙 40623203 蔡宜芳
- 機械設計工程系二乙 40623206 邱妍蓁
- 機械設計工程系二乙 40623207 呂沛蓉
- 機械設計工程系二乙 40623244 林俊鎧
- 機械設計工程系二乙 40623248 廖柏誠
- 機械設計工程系二乙 40623250 湯峻傑
advisor_zh: '嚴家銘'
date: '2019.01.07'
---

@others

</t>
<t tx="ahshoe.20170129120932.1"></t>
<t tx="ahshoe.20170315212615.1">QTreeWidget {
    /* These apply to the selected item, but not to editing items.*/
    background-color: #ffffec; /* Leo's traditional tree color */
    selection-color: black; /* was white */
    selection-background-color: lightgrey;
    /* font-family: SansSerif; */
    /*font-family: DejaVu Sans Mono;*/
    font-family:YaHei Mono;
    /* 標題字型大小設定 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
 }

/* Headline edit widgets */
QTreeWidget QLineEdit {
    background-color: cornsilk;
    selection-color: white;
    selection-background-color: blue;
    /*font-family: DejaVu Sans Mono;*/    
    font-family:YaHei Mono;
    /* 沒有特別對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The log panes */
QTextEdit {
    background-color: #f2fdff;
    selection-color: red;
    selection-background-color: blue;
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* log font 大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The body pane */
QTextEdit#richTextEdit {
    background-color: #fdf5f5; /* A kind of pink. */
    selection-color: white;
    selection-background-color: red;
    /*font-family: DejaVu Sans Mono;*/
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* 內文字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

QLabel {
    font-family:YaHei Mono;'CherryPy', 'pytz', 'mako', 'beautifulsoup4', 'pymysql', 'peewee'
    /* 下方的 Minibuffer 標題字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

/* Editor labels */
QLineEdit#editorLabel {
    background-color: #ffffec;
    font-family:YaHei Mono;
    /* 沒有直接對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
    border: 2px;
    margin: 2px;
}</t>
<t tx="ahshoe.20170315212626.1">horizontal: body pane to the left
vertical: body pane on the botton</t>
<t tx="ahshoe.20170317115820.1">---
abstract: |
    This study designed a marble machine system by drawing components.

    After the group discussion, the resolution was to design four different mechanisms. The group members used Inventor and Onshape to draw the lift, vortex rotating disk, screw and flywheel to locate and cooperate with the track to design a circular marble machine system. Through the V-rep simulation, check the mechanism for interference.

    The four mechanism:

    1.Lift: Use the motor to drive the eccentric wheel to make the stairs lifting movement.

    2.Vortex rotating disk: The motor rotates the disk to rise the ball.

    3.Screw: The motor drives the screw to do oblique upward motion.

    4.Flywheel: Use the motor to drive the flywheel to make a rotary motion to raise the ball.
    
---


</t>
<t tx="leo.20171119233721.1">1. 下載可攜pandoc-2.0.2與 miktex_portable

2. 安裝 pandoc-fignos, pandoc-tablenos filters

python -m pip install pandoc-fignos pandoc-tablenos

3. 若需要安裝 package, 需要用 administrator 身分啟動

c:\users\cadlab\desktop\mde\python2017fall_36\data\miktex_portable\miktex-portable.cmd</t>
<t tx="leo.20171119233845.1">https://sourceforge.net/p/miktex/discussion/33790/thread/fcf98fa1/</t>
<t tx="leo.20171119234752.1"></t>
<t tx="leo.20171119234822.1"></t>
<t tx="leo.20190104143311.1">Design Motivation
---

分組後，在老師給的八個題目中，討論並研究每個題目，最後選擇了鋼球運動系統這個專題，因為鋼球運動系統是最為符合我們的能力，所以決定自己設計，經過多方研究，決定要做一座給鋼球運動的遊樂場，而且看著球球一直滾~滾~滾~滾~，非常的療癒，讓心情不好的大家能夠紓壓。

</t>
<t tx="leo.20190104152007.1">Onshape
---



</t>
<t tx="yen.20170429103742.1"></t>
<t tx="yen.20170429103940.1"></t>
<t tx="yen.20170429110328.1"></t>
<t tx="yen.20170429110336.1">1. 下載並安裝 Pandoc：

https://github.com/jgm/pandoc/releases/

2. 安裝 texlive (安裝 texlive-lang-cjk 而非 16.04 的 texlive-lang-chinese)

sudo apt install texlive texlive-xetex texlive-lang-cjk etoolbox

3. 安裝 pandoc-fignos, pandoc-tablenos filters

sudo pip3 install pandoc-fignos pandoc-tablenos

4. 安裝 ukai.ttc 字型

sudo apt-get install fonts-arphic-ukai</t>
<t tx="yen.20170429132400.1">每一位協同人員各在 users 目錄中建立一個 .leo 檔案

除非必要否則不更動 markdown 目錄下的 template.tex 檔案</t>
<t tx="yen.20170429214838.1">Preface
===

前言

@others
</t>
<t tx="yen.20170429214838.3">Design Purpose
---

此專題的目的在於熟練的使用Onshape繪製零組件及V – rep的模擬，增進自己的實力並將這個系統套用在未來的實務應用上，為此我們從網路上搜尋有關的影片和參考學長姐做的專題。然而我們參考的資料大部分做得太過單一，使我們想要做出較多機構互相配合的系統，設計出屬於自己的鋼球模擬系統。

</t>
<t tx="yen.20170429214845.1"></t>
<t tx="yen.20170429215041.1">Application Software
===

軟體

@others
</t>
<t tx="yen.20170429215130.1">Inventor
---

Windows 的內容

有一張圖片：

![Kmol][]

稱為圖 {@fig:駱駝}。

各 md 檔案可以在 images 目錄下自訂與 md 檔案名稱相同的子目錄存放影像檔案

</t>
<t tx="yen.20170429215205.1">V-rep
---

Ubuntu 的內容

有一張圖片：

![Kmol][]

稱為圖 {@fig:駱駝}。

各 md 檔案可以在 images 目錄下自訂與 md 檔案名稱相同的子目錄存放影像檔案

[Kmol]: ./images/operating_system/kmol.png {#fig:駱駝}


</t>
<t tx="yen.20170429215252.1">Design Process and Introduction
===

過程與介紹

@others
</t>
<t tx="yen.20170429215308.1">Process
---

IPv4 的內容

有一張圖片：

![Kmol][]

稱為圖 {@fig:駱駝}。

各 md 檔案可以在 images 目錄下自訂與 md 檔案名稱相同的子目錄存放影像檔案

[Kmol]: ./images/computer_network/kmol.png {#fig:駱駝}

</t>
<t tx="yen.20170429215316.1">Introduction
---


</t>
<t tx="yen.20170429215416.1">Issue &amp; Solution
===

Q&amp;A

@others
</t>
<t tx="yen.20170429215446.2">Design
---

Q：

A：

Q：

A：

</t>
<t tx="yen.20170429215446.3">V-rep
---

Q：零件無法拆開

A：零件跟零件間要有空隙，合在一起會被當成一個零件

Q：開了實體碰撞，零件無法在正常的軌道上運作，會一直抖動

A：因為實體跟實體的間隔不可能為0，所以零件跟零件間要有空隙，

Q：軌道開了實體碰撞，模擬就會非常 lag

A：將軌道的實體碰撞開至只與球進行碰撞

</t>
<t tx="yen.20170429215446.4">Report
---

Q：Pandoc 找不到路徑

A：需在 start.bat 設置 path2 及啟動 path2

![Start.bat][start-bat]

Q：LaTeX 修改名字無法跳行

A：利用 for 迴圈編譯他

![For loop][for-loop]

Q：老師的名字無法顯示在 pdf

A：在 advisor_zh: 跳行加 - 空格再書寫

![Advisor][advisor]

Q：無法在 leo 轉 pdf

![transform-mistake][]

A：到指定路徑下執行

![transform-correct][]

Q：無法更新目錄

A：在 button Report pdf 下修改目錄名稱

![modify-chapers][]

Q：圖片無法顯示

A：路徑錯誤，要在 images 底下執行

![image][]

[start-bat]: images/issue-and-solution/start.bat.png {#fig:start-bat}

[for-loop]: images/issue-and-solution/for.png {#fig:for-loop}

[advisor]: images/issue-and-solution/advisor-zh.png {#fig:advisor}

[transform-mistake]: images/issue-and-solution/transform-mistake.png {#fig:transform-mistake}

[transform-correct]: images/issue-and-solution/transform-correct.png {#fig:transform-correct}

[modify-chapers]: images/issue-and-solution/modify-chapers.png {#fig:modify-chapers}

[image]: images/issue-and-solution/image.png {#fig:image}


</t>
<t tx="yen.20170429215617.1">Conclusion
===

結論

@others
</t>
<t tx="yen.20170429215851.1">Conclusion
---

自動控制 的內容

其中包含一個表格：

Table: Python 網際框架比較 {#tbl:網際框架}

| Framework | Started | Py2 | Py3 | ORM | Template Engine | Auth Moudule | Database Admin | Project Scale |
|:---------:|:-------:|:---:|:---:|:---:|:---------------:|:------------:|:--------------:|:-------------:|
| Pyramid | 2005 | V | V |  |  | V |  | large |
| Django | 2006 | V | V | V | V | V | V | large |
| Flask | 2010 | V |  |  |  |  |  | small |

稱為表 {@tbl:網際框架}。

Table: 價目表 {#tbl:價目表}

| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |

稱為表 {@tbl:價目表}。

關於表格生成可以參考這裡：[http://www.tablesgenerator.com/markdown_tables]

[http://www.tablesgenerator.com/markdown_tables]: http://www.tablesgenerator.com/markdown_tables


</t>
</tnodes>
</leo_file>
