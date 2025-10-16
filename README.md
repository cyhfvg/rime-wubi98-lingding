## 开始

该库是 [Rime](https://rime.im/) 输入法一个 98 版至善五笔的输入配置方案，支持多平台（Windows、macOS、Linux、iOS、Android）

此仓库(`灵定-lingding`)是rime输入法的配置仓库，非rime输入法本身。本人在使用五笔时先学习86然后改到98。学习86时使用的是[KyleBing/rime-wubi86-jidian](https://github.com/KyleBing/rime-wubi86-jidian)方案，更改为98后就基于`KyleBing/rime-wubi86-jidian`配置修改做修改，更换词库后形成此配置仓库。

`Rime` 是个输入法内核，在它的基础之上，又出现了涵盖 **Windows**、**macOS**、**Linux**、**iOS**、**Android** 五个常用操作系统的输入法，对应如下：
由于输入内核是相同的，因此多款输入法可以共用一套输入方案配置。

|  操作系统   | 对应的输入法 | github                                                                     |    收费状态     |
|:-------:|:------:|----------------------------------------------------------------------------|:-----------:|
| Windows |  小狼毫 | [weasel](https://github.com/rime/weasel)           |     免费      |
|  macOS  |  鼠须管 | [squirrel](https://github.com/rime/squirrel)       |     免费      |
| Ubuntu  |  中州韵 | [ibus-rime](https://github.com/rime/ibus-rime)     |     免费      |
|   iOS   |  仓输入法 | [Hamster](https://github.com/imfuxiao/Hamster) | 免费(高级功能收费)  |
| Android | 同文输入法 | [trime](https://github.com/osfans/trime)         |     免费      |

## 安装

### Windows ( 小狼毫 / weasel)

Windows 中的配置方法：
1. 右击状态栏中的小狼毫输入法图标，选择 <kbd>用户文件夹</kbd>
2. 把该项目中的文件复制到里面
3. 右击状态栏中的小狼毫输入法图标，选择 <kbd>重新部署</kbd> 即可

### Ubuntu ( 中州韵 / ibus-rime )

执行下面指令安装 `ibus-rime` 输入法

```bash
sudo apt-get install ibus-rime
```

ubuntu 的配置文件目录在
```bash
# ibus
~/.config/ibus/rime/

# fcitx
~/.config/fcitx/rim

# fcitx5
~/.local/share/fcitx5/rime
```

### Android
> 同文安卓输入法 github：[https://github.com/osfans/trime](https://github.com/osfans/trime)  
> 输入法版本 release：[https://github.com/osfans/trime/releases](https://github.com/osfans/trime/releases)

下载安装，将词库添加到对应的文件夹中，再进行部署即可使用

### 其他平台

其他平台安装可查看我参考的[KyleBing/rime-wubi86-jidian](https://github.com/KyleBing/rime-wubi86-jidian)原仓库。

## 词库

本配置词库选用至善词库，分为单字、词语。
针对至善单字词库按GB2312划分，以GB2312的6763字为基本词库，非GB2312的单字词库为额外词库。
本配置使用的词库划分方式，主要使用`wubi98_gb2312`、`wubi98_ci`，提供常用单字、词语输入。
以`wubi_non_gb2312`、`wubi98_extra`作为额外补充词库，可以使用[ 常词/扩词 ]开关进行调整(默认为常词)。

词库引入方式：主方案`wubi98.schema.yaml`中配置使用词库`wubi98`，`wubi98`中引入基础词库`wubi98_gb2312`、`wubi98_ci`、`wubi98_user`。
建立了一个空配置`none.schema`作为额外词库的挂载位置，在`wubi98.schema`中引入。在`none.schema`中引入额外词库`extra_dict`，在`extra_dict`中引入`wubi98_non_gb2312`、`wubi98_extra`

### 个人词库

个人词库使用github私密仓库进行管理，使用软链接+定时任务自动push/pull的方式与手动定时同步方式进行同步。
直接软链接替换`wubi98_user.dict.yaml`即可。

## 使用说明

### 选项菜单
在输入状态时，<kbd>control</kbd> + <kbd>0</kbd> 或者 <kbd>shift</kbd> + <kbd>control</kbd> + <kbd>0</kbd> 弹出菜单

### 菜单内容
弹出的菜单中，处于第一位的是当前使用的输入法方案，其后跟着是该方案中的输入法菜单，有【半角 - 全角】【简 - 繁】等常见功能菜单，特别的提供了【常词 - 扩词】的功能开关，用以开启、关闭额外词库（默认常词）。

### 临时拼音输入
在忘了某字的五笔编码时，<kbd>z</kbd>键可以进入临时拼音输入模式，并且配置了comment可以提示五笔编码。

### 支持大写数字输入：壹贰叁肆伍陆
本库中包含一个可以输入大写数字的方案，名叫 `大写数字`，呼出菜单选择该方案即可。

## 词条权重
词库依据权重排序，数字越大权重越大，权重大的候选字靠前。从至善词库转换词库格式时权重默认更改为`9999`,后续自己添加的词、需要调整权重的词以`10100`及以上更改，gb2312的字权重为`10010`。

## 十、感谢

- [rime官方仓库](https://github.com/rime)
- [KyleBing/rime-wubi86-jidian](https://github.com/KyleBing/rime-wubi86-jidian)
- [98五笔至善词库](https://github.com/omgredfog/98wubi)
- [98五笔字表](https://github.com/yanhuacuo/98wubi-tables)
- [GB2312汉字列表](https://github.com/beifeng600/nlp_storeroom)
