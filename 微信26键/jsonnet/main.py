import os
from pathlib import Path
import subprocess

# 命令模板：(input_file, output_file_template, orientation)
# orientation 可为 None 表示不传
command_templates = [
    ("./config/pinyin_26_portrait.jsonnet", "{theme}/pinyin_26_portrait.yaml", "portrait"),
    ("./config/pinyin_26_portrait.jsonnet", "{theme}/pinyin_26_landscape.yaml",     "landscape"),

    ("./config/alphabetic_26_portrait.jsonnet", "{theme}/alphabetic_26_portrait.yaml",  "portrait"),
    ("./config/alphabetic_26_portrait.jsonnet", "{theme}/alphabetic_26_landscape.yaml", "landscape"),

    ("./config/numeric_9_portrait.jsonnet", "{theme}/numeric_9_portrait.yaml", None),
    ("./config/numeric_9_landscape.jsonnet", "{theme}/numeric_9_landscape.yaml", None),

    ("./config/symbolic_portrait.jsonnet", "{theme}/symbolic_portrait.yaml", None),

    ("./config/emoji_portrait.jsonnet", "{theme}/emoji_portrait.yaml",     None),
    ("./config/emoji_portrait.jsonnet", "{theme}/emoji_landscape.yaml",    None),

    ("./config/panel.jsonnet", "{theme}/panel_portrait.yaml", "portrait"),
    ("./config/panel.jsonnet", "{theme}/panel_landscape.yaml", "landscape"),
]

# 公共基础参数（不含 theme 和 orientation）
base_args = ["jsonnet", "-J", "./lib/"]

# 要处理的主题
themes = ["light", "dark"]
cwd = Path.cwd()

for theme in themes:
    output_dir = cwd / theme
    output_dir.mkdir(exist_ok=True)
    print(f"正在处理目录: {output_dir}", flush=True)

    for input_file, out_template, orientation in command_templates:
        src = str(cwd / input_file)
        dst = str(cwd / out_template.format(theme=theme))

        # 构建完整命令
        cmd = base_args + [src, "-o", dst]

        # 添加 --ext-str theme=...
        cmd += ["--ext-str", f"theme={theme}"]

        # 如果分 orientation，也加上, 否则None
        if orientation is not None:
            cmd += ["--ext-str", f"orientation={orientation}"]

        print(f"正在执行命令: {' '.join(cmd)}", flush=True)
        try:
            result = subprocess.run(cmd, check=True, text=True, capture_output=True)
            print(f"命令执行成功: {' '.join(cmd)}", flush=True)
            print(result.stdout, flush=True)
        except subprocess.CalledProcessError as e:
            print(f"命令执行失败: {' '.join(cmd)}", flush=True)
            print(e.stderr, flush=True)
            exit(e.returncode)

print("所有命令已成功执行", flush=True)