## 使用方法

1. 使用 VS Code 打开仓库
2. VS Code 中安装 Tinymist Typst 插件
3. 修改 `info.json` 文件中的信息为你自己的信息
4. 打开文件 `zju-typst-tplt/0.2.0/template/support/list/fonts.typ`，可以看到字体列表：

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

    [字体包下载链接（使用浙大云盘）](https://pan.zju.edu.cn/share/1ce12e1eb87ed429da2542a14d)

5. 把 `zju-typst-tplt` 放在 Typst 指定的本地模版目录下，（macOS 为 `/Users/ethanpixar/Library/Application Support/typst/packages/local/`）。

    该目录也可以通过命令面板 `Cmd + Shift + P` 输入 `Typst: Create Local Packages` 来找到。

6. 现在就可以在任意目录下新建 `xxx.typ`，都可以使用该模板，在 `xxx.typ` 文件开头输入：

    ```typst
    #import "@local/zju-typst-tplt:0.2.0": *

    #show: BL // 基本样式，务必首先使用
    // 定义文件信息
    #let ymd = "2025-04-8"
    #let course = "Biomedical Image Processing"
    #let proj-name = "Homework 3"

    #show: HW.with( // 可以选择 HomeWork, NoTe, RePort, ArTicle
      proj-name: proj-name,
      course: course,
      english: true,
      ymd: ymd,
    )
    ... // 正文内容
    ```

    使用快捷键 `Cmd + K, V` 进行预览。页面最上方的 `Export PDF` 可以导出 PDF。或者使用命令面板 `Cmd + Shift + P`，输入 `Typst` 查看更多指令。

## 使用示例

参考以下几个仓库：
...等我上传

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
