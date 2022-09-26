=================
RST文档
=================


reStructuredText 是扩展名为 .rst 的纯文本文件,
含义为”重新构建的文本”, 也被简称为: RST 或 reST,
是 Python 编程语言的 Docutils 项目的一部分.

reStructuredText 是轻量级标记语言的一种,
被设计为容易阅读和编写的纯文本,
并且可以借助 Docutils 这样的程序进行文档处理,
也可以转换为 HTML 或 PDF 等多种格式,
或由 Sphinx-Doc 这样的程序转换为 LaTex, man 等更多格式.

reStructuredText 相比于 Markdown 具有以下优势:
 1. 使用 sphnix 能够自动生成目录和索引文件, 方便查询和检索;
 2. 有大量漂亮的 HTML 主题模版;
 3. 编写语法更为便利.

本章内容参考了:
 - seayxu: `reStructuredText(rst)快速入门语法说明 <https://www.jianshu.com/p/1885d5570b37>`_
 - 3Vshej: `reStructuredText 语法 <https://3vshej.cn/rstSyntax/index.html>`_
 - 王竹兴: `ReStructuredText 快速教程 <https://rst-tutorial.readthedocs.io/zh/latest/index.html>`_


**修订日志**

==========  ==========  ==============================
时间          版本        修订内容
==========  ==========  ==============================
2022.9.1     初稿        向盼提交了框架
2022.9.12    1.0         向盼提交了初版
==========  ==========  ==============================



一、章节与标题
=================


1. 章节
-----------------

章节是文章的主体结构, 分为 **标题、章、节、小节** 等.
定义章节的方式是在行的下面添加一行符号.
符号的长度不能比标题短, 这对表格也是适用的.

::

  标题
  ======

  章
  ------

  节
  ~~~~~~

  小节
  ######


2. 标题
-----------------

标题的上下都有一行符号.
标题和章节在结构上的作用相同, 但是可能有不同的显示格式.
::

  ======
  标题
  ======

  ------------
  第一章 概述
  ------------


Tips:
 1. 可用的符号: = - ~ ` : ' " ^ _ * _ # < >.
 #. 符号至少和文字行一样长, 更长也行.
 #. 相同级别必须使用统一的符号, 否则会被识别为更小的级别.
 #. 标题最多分六级, 可以自由组合使用.
 #. 一般将标题和章节嵌套使用.

 ::

    ======
    大标题
    ======

    标题
    ======

    章
    ------

    节
    ~~~~~~

    小节
    ######



二、字体样式
=================

标准的 reST 内联标记:

- 斜体(单星号): *text*

::

 *text*

- 粗体(双星号): **text**

::

 **text**

- 引用(反引号): `text`

::

 `text`

- 等宽文本(双反引号): ``text``

::

 ``text``


Tips:
 - 星号及反引号在文本中容易与内联标记符号混淆,
   可使用反斜杠符号转义.
 - 不能相互嵌套.
 - 内容前后不能由空白: 这样写 * text* 是错误的.
 - 如果内容需要特殊字符分隔. 使用反斜杠转义, 如: thisis\ *one*\ word.
 - 等宽文本中的空格可以保留, 但是换行不行.



- 上标: H\ :sup:`+`

::

 H\ :sup:`+`

- 下标: H\ :sub:`2`

::

 H\ :sub:`2`

- 转义: \*.cif

::

 \*.cif


- 居中加粗:

.. centered:: 居中加粗

::

 .. centered:: 居中加粗

- 提示: :abbr:`提示信息, 鼠标放在文字处悬停就可以看到内容 (这里是提示信息)`

::

  提示: :abbr:`提示信息, 鼠标放在文字处悬停就可以看到内容 (这里是提示信息)`


- 文件: :file:`/path/to/your/dir`

::

  文件: :file:`/path/to/your/dir`


三、段落
=================

段落是 reST 文件的基本模块.
段落是由空行分隔的一段文本.
和 Python 一样,
对齐也是 reST 的操作符,
因此同一段落的行都是左对齐,
没有空格，或者有相同多的空格.
缩进的段落被视为引文.
本教程的缩进为一个空格.


这是第一段

这是第二段

这是第三段
还是第三段



::

 这是第一段

 这是第二段

 这是第三段
 还是第三段


四、块
=================

1. 文字块
-----------------

文字块就是一段文字信息,
在需要插入文本块的段落后面加上":: "
文字块不能定顶头写, 要有缩进,
结束标志是取消缩进.

下面是文字块内容：
::

   这是一段文字块
   同样也是文字块
   还是文字块

这是新的一段

::

 下面是文字块内容：
 ::

  这是一段文字块
  同样也是文字块
  还是文字块

 这是新的一段

2. 行块
-----------------
行块是以" | "开头, 每一个行块可以是多段文本.
"|"前后各有一个空格.

下面是行块内容:
 | 这是第一段
 | 这是第二段
 | 这是第三段
  还是第三段

这是新的一段

::

 下面是行块内容:
  | 这是第一段
  | 这是第二段
  | 这是第三段
    还是第三段

 这是新的一段


Tips:
  注意格式, 特别是空格和空行.

3. 块引用
-----------------

块引用需要通过缩进来实现的, 引用块要在前面的段落基础上缩进.
通常引用结尾会加上出处, 出处的文字块开头是 -- --- —, 后面加上出处信息.

块引用可以使用空的注释, 用".."分隔上下的块引用.
在新的块和出处都要添加一个空行.


下面是引用的内容：

"This is a text."

 --- by pan

..

"This is another text."

 --- by you

::

 下面是引用的内容：

  "This is a text."

  --- by pan

 ..

  "This is another text."

  --- by you


4. 文档测试块
-----------------

文档测试块可以表示交互式的Python会话, 以 ">>>" 开始，空行结束.

>>> print("Hello world!")
Hello world!

5. 代码块
-----------------

1. Bash

.. code-block:: console
    :linenos:

    $ whoami
    $ pwd
    $ ls

::

 .. code-block:: console
     :linenos:

     $ whoami
     $ pwd
     $ ls



2. python

.. code-block:: console
    :linenos:
    :emphasize-lines: 1-2,4,6

    def sayHello(username="xiangp"):
      print("Hello world!", username)

    sayHello()
    # out: Hello world! xiangp
    sayHello("yourname")
    # out: Hello world! yourname


::

 .. code-block:: console
     :linenos:

     def sayHello(username="xiangp"):
       print("Hello world!", username)

     sayHello()
     # out: Hello world! xiangp
     sayHello("yourname")
     # out: Hello world! yourname


3. perl

.. code-block:: perl
    :linenos:

    my $a = "xiangp";
    print "Hello World! ".$a.".\n";
    # out: Hello World! xiangp.

::

 .. code-block:: perl
     :linenos:

     my $a = "xiangp";
     print "Hello World! ".$a.".\n";
     # out: Hello World! xiangp.

Tips:
 - ":linenos:": 显示行号.
 - ":emphasize-lines:1-3,6": 高亮第1到3和6行.


五、列表
=================

1. 符号列表
-----------------

符号列表可以使用 - * + 来表示.
不同的符号结尾需要加上空行.
空格缩进表示下级列表.

- 符号列表1
- 符号列表1

  + 二级符号列表1
  + 二级符号列表1
  + 二级符号列表1

  + 二级符号列表1

* 符号列表2

- 符号列表3

::

 - 符号列表1
 - 符号列表1

  + 二级符号列表1
  + 二级符号列表1
  + 二级符号列表1

  + 二级符号列表1

 * 符号列表2

 - 符号列表3

2. 顺序列表
-----------------

顺序列表可以使用不同的枚举序号来表示列表.

::

  阿拉伯数字: 1, 2, 3, …
  大写字母: A-Z
  小写字母: a-z
  大写罗马数字: I, II, III, IV, …
  小写罗马数字: i, ii, iii, iv, …

可以结合 # 自动生成枚举序号.

1. 列表1第一行
#. 列表1第二行
#. 列表1第三行

A. 列表2第一行
#. 列表2第二行
#. 列表2第二行

a. 列表3第二行
#. 列表3第二行
#. 列表3第二行

::

  1. 列表1第一行
  #. 列表1第二行
  #. 列表1第三行

  A. 列表2第一行
  #. 列表2第二行
  #. 列表2第二行

  a. 列表3第二行
  #. 列表3第二行
  #. 列表3第二行

可以为序号添加前缀和后缀.

::

 . 后缀: "1.", "A.", "a.", "I.", "i."
 ) 后缀: "1)", "A)", "a)", "I)", "i)"
 () 包起来: "(1)", "(A)", "(a)", "(I)", "(i)"

3. 定义列表
-----------------
定义列表可以理解为解释列表, 即名词解释.

条目占一行, 解释文本要缩进,
多层可根据缩进实现,

 定义1
   这是定义1的内容
    具体解释

 定义2
   这是定义2的内容

::

 定义1
  这是定义1的内容
   具体解释

 定义2
  这是定义2的内容


4. 字段列表
-----------------

:标题: rst简介

:作者:
 - pan xiang
 - your name

:时间: 2022年9月1日

:概述: 这是一篇关于reStructuredText的语法简介.

 你有任何问题可以随时联系我.


::

 :标题: rst简介

 :作者:
  - pan xiang
  - your name

 :时间: 2022年9月1日

 :概述: 这是一篇关于reStructuredText的语法简介.

  你有任何问题可以随时联系我.

5. 水平列表
-----------------
水平列表将列表项横向显示并减少项目的间距使其较为紧凑.

.. hlist::
 :columns: 6

 * a1
 * a2
 * a3
 * a4
 * a5
 * a3
 * a4
 * a5

::

 .. hlist::
  :columns: 6

  * a1
  * a2
  * a3
  * a4
  * a5
  * a3
  * a4
  * a5

Tips: 选项 columns 定义了展示的列数.


6. 选项列表
-----------------
选项列表是一个类似两列的表格, 左边是参数, 右边是描述信息.
当参数选项过长时, 参数选项和描述信息各占一行.

选项与参数之间有一个空格, 参数选项与描述信息之间至少有两个空格.

-a            command-line option "a"
-b file       options can have arguments
              and long descriptions
--long        options can be long also
--input=file  long options can also have
              arguments
-V            DOS/VMS-style options too

::

  -a            command-line option "a"
  -b file       options can have arguments
                and long descriptions
  --long        options can be long also
  --input=file  long options can also have
                arguments
  -V            DOS/VMS-style options too

7. 嵌套列表
-----------------
嵌套列表的子列需跟父列表使用空行分隔.

* 这是
* 一个列表

  * 嵌套列表
  * 子项

* 父列表继续

::

 * 这是
 * 一个列表

   * 嵌套列表
   * 子项

 * 父列表继续


六、表格
=================

1. 网格表
-----------------

网格表中使用的符号有: - = | +

"-" 用来分隔行

"=" 用来分隔表头和表体行

"|" 用来分隔列

"+" 用来表示行和列相交的节点

+------------+------------+-----------+
| Header 1   | Header 2   | Header 3  |
+============+============+===========+
| body row 1 | column 2   | column 3  |
+------------+------------+-----------+
| body row 2 | Cells may span columns.|
+------------+------------+-----------+
| body row 3 | Cells may  | - Cells   |
+------------+ span rows. | - contain |
| body row 4 |            | - blocks. |
+------------+------------+-----------+

::

 +------------+------------+-----------+
 | Header 1   | Header 2   | Header 3  |
 +============+============+===========+
 | body row 1 | column 2   | column 3  |
 +------------+------------+-----------+
 | body row 2 | Cells may span columns.|
 +------------+------------+-----------+
 | body row 3 | Cells may  | - Cells   |
 +------------+ span rows. | - contain |
 | body row 4 |            | - blocks. |
 +------------+------------+-----------+

2. 简单表
-----------------
相比于网格表, 少了 "|" 和 "+" 两个符号, 只用 "-" 和 "=" 表示.

=====  =====  ======
   Inputs     Output
------------  ------
  A      B    A or B
=====  =====  ======
False  False  False
True   False  True
False  True   True
True   True   True
=====  =====  ======

::

 =====  =====  ======
    Inputs     Output
 ------------  ------
   A      B    A or B
 =====  =====  ======
 False  False  False
 True   False  True
 False  True   True
 True   True   True
 =====  =====  ======




七、分隔符
=================
分隔符由 4 个或者更多的 "-" 组成, 前后有空行.

上面部分

------------

下面部分

::

 上面部分

 ------------

 下面部分

八、超链接
=================

1. 自动超链接
-----------------
reStructuredText会自动将网址生成超链接.

https://github.com/panxiang126/notebook

::

 https://github.com/panxiang126/notebook


2. 外部超链接
-----------------

两行: 链接名称_.

.. _链接名称: https://github.com/panxiang126/notebook

::

 两行: 链接名称_.

 .. _链接名称: https://github.com/panxiang126/notebook

一行: `链接名称 <https://github.com/panxiang126/notebook>`_.

::

 一行: `链接名称 <https://github.com/panxiang126/notebook>`_.

Tips: "_" 不可或缺.

3. 内部超链接
-----------------

内部 超链接_.

点击上面的链接会跳转到下面.

.. _超链接:

超链接的位置.

::

 内部 超链接_.

 点击上面的链接会跳转到下面.

 .. _超链接:

 超链接的位置.


1. 匿名超链接
-----------------

项目主页：`GitHub`__.

.. __: https://github.com/panxiang126/notebook

::

 项目主页：`GitHub`__.

 .. __: https://github.com/panxiang126/notebook

5. 间接超链接
-----------------
这_ 是 `GitHub主页`__.

.. _这: https://github.com/panxiang126/notebook

__ 这_

::

 这_ 是 `GitHub主页`__.

 .. _这: https://github.com/panxiang126/notebook

 __ 这_


6. 隐式超链接
----------------
小节标题, 脚注和引用参考会自动生成超链接地址,
使用小节标题, 脚注或引用参考名称作为超链接名称就可以生成隐式链接.


隐式链接到 `九、注释`_, 即可生成超链接.

::

 隐式链接到 `九、注释`_, 即可生成超链接.

7. 替换引用
------------------
用定义的指令替换对应的文字或图片.


这是一个 Logo |logo|, 我的用户名是: |name|.

.. |logo| image:: ./test_logo.ico
.. |name| replace:: panxiang126


::

 这是一个 Logo |logo|, 我的用户名是: |name|.

 .. |logo| image:: ./test_logo.ico
 .. |name| replace:: panxiang126

8. 脚注引用
------------------
脚注引用，有这几个方式:

有手工序号(标记序号123之类)

自动序号(填入#号会自动填充序号)

自动符号(填入*会自动生成符号)

手工序号可以和#结合使用，会自动延续手工的序号.

"#" 表示的方法可以在后面加上一个名称, 这个名称就会生成一个链接.


脚注引用一 [1]_
脚注引用二 [2]_
脚注引用三 [#]_
脚注引用四 [#链接四]_
脚注引用五 [*]_
脚注引用六 [*]_
脚注引用七 [*]_

.. [1] 脚注内容一
.. [2] 脚注内容二
.. [#] 脚注内容三
.. [#链接四] 脚注内容四
.. [*] 脚注内容五
.. [*] 脚注内容六
.. [*] 脚注内容七


这个链接指向 链接四_




::

 脚注引用一 [1]_
 脚注引用二 [2]_
 脚注引用三 [#]_
 脚注引用四 [#链接四]_
 脚注引用五 [*]_
 脚注引用六 [*]_
 脚注引用七 [*]_

 .. [1] 脚注内容一
 .. [2] 脚注内容二
 .. [#] 脚注内容三
 .. [#链接四] 脚注内容四
 .. [*] 脚注内容五
 .. [*] 脚注内容六
 .. [*] 脚注内容七


 这个链接指向 链接四_

9. 引用参考
------------------
引用参考的内容通常放在页面结尾处, 比如 [One]_, [Two]_

.. [One] 参考引用一

.. [Two] 参考引用二

::

 引用参考的内容通常放在页面结尾处, 比如 [One]_, [Two]_

 .. [One] 参考引用一
 .. [Two] 参考引用二


九、注释
=================
注释以".."开头, 后面接注释内容即可, 可以是多行内容, 同样要求缩进.

以下为注释内容, 你应当看不见.

..
 我是注释内容
 你们看不到我

::

 以下为注释内容, 你应当看不见.

 ..
  我是注释内容
  你们看不到我


十、标记
=================

1. doc
-----------------
链接到其他文档, 需要该文档的路径.

:doc:`../vasp/vasp`

::

 :doc:`../vasp/vasp`

2. ref
-----------------
链接到标记的位置,
在需要连接的标题前面设置:
``.. _topics-linux:``.

:ref:`topics-linux`

:ref:`topics-linux-EOF`

::

 :ref:`topics-linux`

 :ref:`topics-topics-linux-EOF`

3. download
-----------------

:download:`本文档源码 <./rst.rst>`.

::

 :download:`本文档源码 <./rst.rst>`.


4. image
-----------------
 .. image:: ./test_logo.png
  :width: 50px

::

 .. image:: ./test_logo.png
  :width: 50px


5. 替换
-----------------

|release|

|version|

|today|

::

 |release|

 |version|

 |today|

6. 引用一个文件
-----------------
.. literalinclude:: test.py
  :encoding: utf-8
  :language: python
  :emphasize-lines: 1,3-5
  :linenos:
  :lines: 1-5,9-

::

 .. literalinclude:: test.py
   :encoding: utf-8
   :language: python
   :emphasize-lines: 1,3-5
   :linenos:
   :lines: 1-5,9-


7. 对比两个文件
-----------------
.. literalinclude:: test.py
  :diff: test0.py

::

 .. literalinclude:: test.py
   :diff: test0.py

   Numbers
   formula


8. csv表格
-----------------
.. csv-table:: Table Title
   :header: "number", "formula", "result", "label row", "label column"
   :widths: 5, 15, 5,12,12

   one,zero plus one,1,the first row,the third column
   two,one plus two,3,the second row, the third column
   three,two plus three,5,the third row, the third column

::

 .. csv-table:: Table Title
    :header: "number", "formula", "result", "label row", "label column"
    :widths: 5, 15, 5,12,12

    one,zero plus one,1,the first row,the third column
    two,one plus two,3,the second row, the third column
    three,two plus three,5,the third row, the third column

.. csv-table:: Table Title
   :header: "number", "formula", "Description"
   :widths: 5, 15, 5,12,12
   :file: ./test.csv
   :encoding: utf-8
   :align: left

::

 .. csv-table:: Table Title
    :header: "number", "formula", "Description"
    :widths: 5, 15, 5,12,12
    :file: ./test.csv
    :encoding: utf-8
    :align: left


如果引用一个在线的 csv 文件, 在 file 处填 url 即可.


十一、提示
=================

1. note
-----------------
.. note::

   注解型提示。

::

 .. note::

    注解型提示。

2. warning
-----------------
.. warning::

   警告型提示。

::

 .. warning::

    警告型提示。

3. error
-----------------
.. error::

   错误型提示。

::

 .. error::

    错误型提示。


4. caution
-----------------
.. caution::

   小心提示。

::

 .. caution::

   小心提示。

5. tip
-----------------
.. tip::

   普通提示。

::

 .. tip::

    普通提示。


6. 新版本功能
-----------------
.. versionadded:: 1.1
 The *add* parameter.

::

 .. versionadded:: 1.1
  The *add* parameter.

7. 版本中修改
-----------------
.. versionchanged:: 1.2
 The *change* parameter.

::

 .. versionchanged:: 1.2
  The *change* parameter.

8. 版本中移除
-----------------
.. deprecated:: 1.3
 使用 `newFunc` 代替.

::

 .. deprecated:: 1.3
  使用 `newFunc` 代替.



十二、编写环境
=================

我用 VScode 进行代码编写,
托管到 GitHub,
用 Read the Docs 发布本文档.

1. 下载安装
-----------------

 - `VScode 下载页面 <https://code.visualstudio.com/Download>`_,
   默认安装.
 - `Python 下载页面 <https://www.python.org/downloads>`_,
   在安装首页勾选 "Add Python to PATH", 其他默认.
 - `GitHub Desktop 下载页面 <https://desktop.github.com>`_,
   默认安装.

.. note::

  安装 GitHub Desktop 是为了将代码同步到 GitHub, 对新手比较友好.
  如果你熟悉 Git, 配合 VScode 使用起来更加方便, 但此不作详细介绍.

2. 配置
-----------------

 - 在 python 中安装以下库: ``pip install sphinx esbonio docutils doc8 sphinx_rtd_theme``

 - 打开 GitHub Desktop, (注册并)登录到你的 GitHub 账户.
 - 点击 Clone a repository from the Internet..., 选择 URL,
   填写入 ``https://github.com/panxiang126/xiangp_docs``, 
   并记住下方 ``Local Path`` 中文件存放位置.
 - 点击菜单栏的 Repository — Push — Fork this repository — Continue.
 - 在 Current branch 下拉中选择 chinese.
 - 点击 Open in Visual Studio Code, 在弹出的提示框中选择信任.

 - 你可以在 XIANGPAN_DOCS/docs/source/ 下看到本文档的所有源码,
   现在按照你的需求进行相应的修改.

 - 如果你在编写的过程中想要进行预览,
   在 VScode 中安装这两个插件: ``reStructuredText`` 和 ``reStructuredText Syntax highlighting``

 -  安装完成后, 重启 VScode.
    在任意 rst 文档界面按 ``ctrl+shift+r`` 即可显示预览 (编辑过程中记得先保存),
    或者按 ``ctrl+k`` 再按 ``ctrl+r`` 在侧边预览,
    也可以直接在浏览器打开 ``path_to_save/../build/html/html/index.html``


3. 提交 Pull requests
----------------------------
在你完成所有的修改后, 返回到 GitHub Desktop,
点击左下角的 Commit to chinese
然后点击菜单栏的 Repository — Push

点击右侧的 Create Pull Request, 然后跳转到 GitHub 网页版,
描述你的修改的内容, 然后点击 Create Pull Request 提交.

在我同意你的 PR 后, 你更改的内容就会被同步到本文档中了.

.. tip::
  由于网络原因, 使用 GitHub Desktop 的过程中可能会经常失败, 你可以多试几次; 或者参考 科学上网_.



.. _科学上网:

4. 科学上网
----------------------------

.. caution::
  撰写本节的初衷只是便于访问 GitHub, Google Scholar 等学术资源, 切勿用于其他非法途径.

``Ghelper``
~~~~~~~~~~~~~~~~~~~~~~
 - 上网方式: 浏览器插件
   也提供了订阅链接, 可以在手机和电脑安装 Clash 配合使用
 - 浏览器插件: `插件下载页面 <googlehelper.net>`_,
   或者 :download:`点击下载备用版本 <./Ghelper-v2.6.2.crx>`
 - 手机和电脑: 可以在安装浏览器插件后在插件的控制面板-手机代理页面找到
 - 月费: ¥ 15.99 (可以几个人一起购买)
 - 浏览器插件最大同时在线数: 四个
 - 订阅流量: 300G 每月
 - 建议配置以下网站直连: wiley.com acs.org springer.com rsc.org sciencedirect.com nature.com science.org bilibili.com jdftx.org orcid.org webofscience.com webofknowledge.com aps.org vasp.at

其他好用的梯子欢迎在此补充.