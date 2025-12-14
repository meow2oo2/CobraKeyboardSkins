# 「微信26键」

---

## 文件结构


```text
jsonnet/
├── keyboard/                  # 配置层
│   └──      # 键盘配置文件
│
├── lib/
│   ├── basic/                 # 参数层
│   │   └──  # 颜色、大小、偏移等基础参数
│   │
│   ├── inputs/                # 行为层
│   │   └──  # 点击、滑动、长按等输入参数
│   │
│   ├── layouts/               # 布局层
│   │   └──  # 可复用的键盘布局结构
│   │
│   ├── processors/            # 处理层
│   │   └──  # 核心逻辑处理
│   │
│   ├── styles/                # 样式层
│   │   └──  # 背景、前景、动画等样式定义
│   │
│   ├── imports.libsonnet     # 统一入口
│   │
│   └── utils.libsonnet       # 工具库
│
├── main.jsonnet              # 主文件
│
├── main.py                   # 执行脚本
│
└── README.md                 # 说明文档
```

## 使用说明

**英文键盘如何开启联想？**

在`name`文件中`alphabetic_26`填入你的英文方案ID，并重新执行`main.jsonnet`。

**按键划动/长按符号如何更改？**

所有输入行为都在`inputs/`下，其中`swipe`存放划动符号，`hintSymbols`存放长按符号。

**按键颜色、字体大小等如何自定义？**

常用的基础参数都在`basic/`下进行配置，部分不常用的在`styles/buttonStyle`中。

**注：**
<hr>

- PC端执行「`main.jsonnet`」或「`main.py`」编译。
- 比如Windows终端执行: `jsonnet -S -m .\ jsonnet\main.jsonnet`。
