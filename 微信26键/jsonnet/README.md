# 「微信26键」
> 
> ⚠️ **提示**
> 
> 只适配了「元书输入法」的iOS键盘皮肤文件。
>
> PC端编译至少需要配置jsonnet
> 

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


**注：**
<hr>

- PC端执行「`main.jsonnet`」或「`main.py`」编译。
- 比如Windows终端执行: `jsonnet -S -m .\ jsonnet\main.jsonnet`。
- 传参和设计模式有问题, 想法是适配仓和元书的, 但越写越乱, 先凑合用用...
