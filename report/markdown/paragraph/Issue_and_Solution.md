Issue & Solution
===

Q&A

Design
---

Q：丟到 v-rep 模擬時很容易有干涉，在模擬過程中，鋼球很容易卡住

A：增加軌道斜度或高度

V-rep
---

Q：零件無法拆開

A：零件跟零件間要有空隙，合在一起會被當成一個零件

Q：開了實體碰撞，零件無法在正常的軌道上運作，會一直抖動

A：因為實體跟實體的間隔不可能為0，所以零件跟零件間要有空隙

Q：軌道開了實體碰撞，模擬就會非常 lag

A：將軌道的實體碰撞開至只與球進行碰撞

Report
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


