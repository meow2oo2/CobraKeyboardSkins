//lib/inputs/toolbarAction.libsonnet

local name = import "name.libsonnet";

{
toolbarButtonCount : 5, // 工具栏按钮显示个数，5+2，完全去除，打开app「工具栏设置」

[name.layoutName.pinyin_26]: [
  { action: { floatKeyboardType: "panel" }, label: { systemImageName: "app" } }, //左1
  { action: "dismissKeyboard", label: { systemImageName: "chevron.down" } }, //右1
  { action: { floatKeyboardType: "appURL" }, label: {systemImageName: "link" } },
  { action: { shortcut: "#showPhraseView" }, label: {systemImageName: "cube", highlightSystemImageName: 'cube.fill' } },
  { action: { shortcut: "#showPasteboardView" }, label: { systemImageName: "clipboard" } },
  { action: { shortcut: "#toggleScriptView" }, label: { systemImageName: "function" } },
  { action: { keyboardType: "emojis" }, label: { systemImageName: "pawprint", highlightSystemImageName: 'pawprint.fill'  } },
  { action: { shortcut: "#右手模式" }, label: { systemImageName: "keyboard.onehanded.right" } },
  { action: { shortcut: "#左手模式" }, label: { systemImageName: "keyboard.onehanded.left" } },
  { action: { shortcut: "#RimeSwitcher" }, label: { systemImageName: "switch.2" } },
  { action: { shortcut: "#简繁切换" }, label: {  text: "简" } },
  { action: { shortcut: "#中英切换" }, label: {  text: "中" } },
],



}

