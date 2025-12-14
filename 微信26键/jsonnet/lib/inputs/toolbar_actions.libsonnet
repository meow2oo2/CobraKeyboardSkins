//lib/inputs/toolbarAction.libsonnet

local name = import "name.libsonnet";
local fileImage = (import "../imports.libsonnet").fileImage;

{
toolbarButtonCount : 5, // 工具栏按钮显示个数，5+2，完全去除，打开app「工具栏设置」

[name.layoutName.pinyin_26]: [
  { action: { floatKeyboardType: "panel" },  //左1
    label: fileImage["工具栏主按钮前景"].foregroundStyle{buttonStyleType: "fileImage"} 
  },
  { action: "dismissKeyboard",  //右1
    label: { systemImageName: "chevron.down" } 
  },
  { action: { floatKeyboardType: "appURL" }, 
    label: {systemImageName: "link" } 
  },
  { action: { shortcutCommand: "#showPhraseView" }, 
    label: {systemImageName: "cube", highlightSystemImageName: 'cube.fill' } 
  },
  { action: { shortcutCommand: "#showPasteboardView" }, 
    label: { systemImageName: "clipboard" } 
  },
  { action: { shortcutCommand: "#toggleScriptView" }, 
    label: { systemImageName: "function" } 
  },
  { action: { keyboardType: "emojis" }, 
    label: { systemImageName: "pawprint", highlightSystemImageName: 'pawprint.fill'  } 
  },
  { action: { shortcutCommand: "#右手模式" }, 
    label: { systemImageName: "keyboard.onehanded.right" } 
  },
  { action: { shortcutCommand: "#左手模式" }, 
    label: { systemImageName: "keyboard.onehanded.left" } 
  },
  { action: { shortcutCommand: "#RimeSwitcher" }, 
    label: { systemImageName: "switch.2" } 
  },
  { action: { shortcutCommand: "#简繁切换" }, 
    label: {  text: "简" } 
  },
  { action: { shortcutCommand: "#中英切换" }, 
    label: {  text: "中" } 
  },
],



}

