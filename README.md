## 使用方法

1. 使用 VS Code 打开仓库
2. VS Code 中安装 Tinymist Typst 插件
3. 打开目录 `tplt/0.2.0/template/support/list/fonts.typ`，可以看到字体列表：

    ```typst
    #let ensans = "SF Pro Display" // 英文无衬线体
    #let ensans-h = "SF Pro Display" // 英文无衬线体（标题）
    #let enserif = "New Computer Modern" // 英文衬线体
    #let enserif-h = "EB Garamond" // 英文衬线体（标题）
    #let enserif-c = "Charter" // 英文衬线体（Charter）
    #let hei = "FZHei-B01" // 方正黑体
    #let dh = "FZDaHei-B02" // 方正大黑体 （标题）
    #let song = "FZShuSong-Z01" // 方正宋体
    #let fangsong = "FZFangSong-Z02S" // 方正仿宋体
    #let xbs = "FZXiaoBiaoSong-B05" // 方正小标宋体
    #let kai = "FZKai-Z03" // 方正楷体
    ...
    #let sans-nt = (ensans, "PingFang SC")// note 模版专用字体组
    ...
    #let mono = ("SF Mono", "PingFang SC")// 等宽字体
    ```

    为保证字体效果相同，需安装我提供的字体包`fontsForTypst.zip`，或者修改为你系统中已有的字体。

## 小贴士

1. 可以使用

    ```typst
    #codex(read("code/xxx.py"), lang: "python")
    ```

    来插入代码块
2. 可以使用

    ```typst
    #figure(image("pic/xxx.png/jpeg/svg", width: ?%), caption: [图片标题])
    ```

    来插入图片
