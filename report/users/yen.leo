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
<v t="yen.20170429215252.1" a="E"><vh>@clean design_introduction.md</vh>
<v t="yen.20170429215316.1"><vh>introduction</vh></v>
</v>
<v t="leo.20190105165731.1" a="E"><vh>@clean process.md</vh>
<v t="leo.20190105165731.2"><vh>process</vh></v>
</v>
<v t="yen.20170429215416.1" a="E"><vh>@clean issue_and_solution.md</vh>
<v t="yen.20170429215446.2"><vh>design</vh></v>
<v t="yen.20170429215446.3"><vh>v-rep</vh></v>
<v t="yen.20170429215446.4"><vh>report</vh></v>
</v>
<v t="leo.20190105170855.1" a="E"><vh>@clean assignments.md</vh>
<v t="leo.20190105170855.2"><vh>Assignments</vh></v>
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
"design_introduction.md", 
"process.md", 
"issue_and_solution.md", 
"assignments.md", 
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

After grouping,among the eight subjects given by the teacher,we discussed and studied each subject. Finally, we selected the topic of the marble machine system. Because the marble machine system is the suitable for our ability, we decided to design the system by ourselves. After the research in many aspect, decided to build a playground for the marble machine system, and watch the bo~bo~ always rolling. It's soothing that make everyone calm.

</t>
<t tx="leo.20190104152007.1">Onshape
---

Onshape is a computer-aided design (CAD) software system, delivered over the Internet via a Software as a Service (SAAS) model.

Onshape makes extensive use of cloud computing. 

Onshape allows teams to collaborate on a single shared design, the same way multiple writers can work together editing a shared document via cloud services. 

Onshape upgrades are released directly to the web interface, and the software does not require maintenance work from the user.

![Lift][]

![Vortex-rotating-disk][]

[Lift]: images/application-software/Lift.png {#fig:Lift}

[Vortex-rotating-disk]: images/application-software/Vortex-rotating-disk.png {#fig:Vortex-rotating-disk}

</t>
<t tx="leo.20190105165731.1">Process
===

過程

@others
</t>
<t tx="leo.20190105165731.2">Process
---

![Process][]

[Process]: images/process/process.png {#fig:Process}

Topic：Selected the marble machine system among many topics

Reference：Refer to the video on the web

Website：Edit the final project website

Design：Design and coordinate the mechanism 

Simulation：Use V-rep to simulate and move the ball in the track

Report：Make independent study

Reveal：Inform the focus and assignments

Finish：Report completed
</t>
<t tx="leo.20190105170855.1">Assignments
===

工作分配

@others
</t>
<t tx="leo.20190105170855.2">Assignments
---

40623203 蔡宜芳：Onshape Interface and Geometry, Website, PDF

40623206 邱妍蓁：Onshape Drawing

40623207 呂沛蓉：Onshape Sheet Metal

40623244 林俊鎧：Design, Translation, inform

40623248 廖柏誠：Onshape Assembled, Design, V-rep

40623250 湯峻傑：Onshape Constraint and Feature, Design
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

The purpose of this topic is to skillfully use Onshape to draw components and V-rep simulations, promote our own strength and apply the system to the future practical applications. For the reason, we search for the related videos on the web and refer to the topic of the senior sister. However, we refer to most of the data to be single. It makes us want to make more mechanism to coordinate with each other and design our own marble machine system.

</t>
<t tx="yen.20170429214845.1"></t>
<t tx="yen.20170429215041.1">Application Software
===

軟體

@others
</t>
<t tx="yen.20170429215130.1">Inventor
---

Autodesk Inventor is a computer-aided design application for 3D mechanical design, simulation, visualization, and documentation developed.

Inventor allows 2D and 3D data integration in a single environment, creating a virtual representation of the final product that enables users to validate the form, fit, and function of the product before it is ever built. Autodesk Inventor includes powerful parametric, direct edit and freeform modeling tools as well as multi-CAD translation capabilities and in their standard DWG™ drawings. 

![Screw-and-Flywheel][]

![Assembly][]

[Screw-and-Flywheel]: images/application-software/Screw-and-Flywheel.png {#fig:Screw-and-Flywheel}

[Assembly]: images/application-software/Assembly.png {#fig:Assembly}

</t>
<t tx="yen.20170429215205.1">V-rep
---

V-rep provides a unified framework combining many powerful internal and external libraries that are often useful for robotics simulations. This includes dynamic simulation engines, forward/inverse kinematics tools, collision detection libraries, vision sensor simulations, path planning, GUI development tools, and built-in models of many common robots.

![Simulation][]

[Simulation]: images/application-software/bobo.gif {#fig:Simulationl}
</t>
<t tx="yen.20170429215252.1">Design Introduction
===

介紹

@others
</t>
<t tx="yen.20170429215316.1">Introduction
---

 The four mechanism:

    1.Lift: Use the motor to drive the eccentric wheel to make the stairs lifting movement.

    2.Vortex rotating disk: The motor rotates the disk to rise the ball.

    3.Screw: The motor drives the screw to do oblique upward motion.

    4.Flywheel: Use the motor to drive the flywheel to make a rotary motion to raise the ball.

![Simulation][]</t>
<t tx="yen.20170429215416.1">Issue &amp; Solution
===

Q&amp;A

@others
</t>
<t tx="yen.20170429215446.2">Design
---

Q： Putting the mechanism to the V-rep is easy to interfere when simulating. And, the ball is easy to get stuck in one place in the process.

A：Increase the slope or height of the track</t>
<t tx="yen.20170429215446.3">V-rep
---

Q：Components cannot be separated

A：There must be a gap between the part and the part, and put them together to be one part.

Q：Turn on body is respondable, the components cannot operate on the normal track, it will flutter.

A：Because the interval between the solid and the solid cannot be 0, there must be gap.

Q：Turn on body is respondable for the track, the simulation will be very lag.

A：Turn it to collide with the ball.</t>
<t tx="yen.20170429215446.4">Report
---

Q："Pandoc" Path not found

A：Need to set "path2" and start "path2" in "start.bat"

![Start.bat][start-bat]

Q："LaTeX" Modify name can't skip a line

A：Use "for" loop to compile it

![For loop][for-loop]

Q：The teacher's name can't be displayed in pdf

A：In "advisor_zh:", skip a line, add "-" and space to write

![Advisor][advisor]

Q：Can't transfer pdf in "Leo"

![transform-mistake][]

A：Excute to specified path

![transform-correct][]

Q：Unbale to update catalog

A：Modify the catalog name under "button Report pdf"

![modify-chapers][]

Q：Images can't be displayed

A：Path is wrong. Excute under "images"

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

We suffer a lot of setbacks in the process at this time, such as assembly interference. It cause the mechanism not to operate smoothly during the simulation and PDF has been unable to solve the problem. With the help of teacher and seniors, we solved our long-standing problems successfully. There have also been differences in opinions among members. After many intense discussions, make everyone know each otther's ideas, unify everyone's opinion and assign appropriate task to each other so that to complete the final project efficiently.
</t>
</tnodes>
</leo_file>
