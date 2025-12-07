//lib/inputs/swipe.libsonnet

local name = import "name.libsonnet";

function(app)
  local getInput(c, h) = if app=="hskin" then h else c;
{

[name.layoutName.pinyin_26]: {
  
  [name.buttonName.qButton]: {
      swipeUpAction: { symbol: "1" } 
  },
  [name.buttonName.wButton]: {
      swipeUpAction: { symbol: "2" } 
  },
  [name.buttonName.eButton]: {
      swipeUpAction: { symbol: "3" } 
  },
  [name.buttonName.rButton]: {
      swipeUpAction: { symbol: "4" } 
  },
  [name.buttonName.tButton]: {
      swipeUpAction: { symbol: "5" } 
  },
  [name.buttonName.yButton]: {
      swipeUpAction: { symbol: "6" } 
  },
  [name.buttonName.uButton]: {
      swipeUpAction: { symbol: "7" } 
  },
  [name.buttonName.iButton]: {
      swipeUpAction: { symbol: "8" } 
  },
  [name.buttonName.oButton]: {
      swipeUpAction: { symbol: "9" } 
  },
  [name.buttonName.pButton]: {
      swipeUpAction: { symbol: "0" } 
  },
  [name.buttonName.aButton]: {
      swipeUpAction: { character: "`" },
      swipeDownAction: { shortcutCommand: "#selectText" },
      setDownForegroundStyle: { systemImageName: "app" },
      setDownHintStyle: { text: "全选" },
  },
  [name.buttonName.sButton]: {
      swipeDownAction: getInput({ shortcut: "#redo" }, { shortcutCommand: "#重做" }),
      setDownForegroundStyle: { systemImageName: "app" },
      setDownHintStyle: { text: "重做" },
  },
  [name.buttonName.dButton]: {
      swipeUpAction: { character: "#" } 
  },
  [name.buttonName.fButton]: {
      swipeUpAction: { character: "*" } 
  },
  [name.buttonName.gButton]: {
      swipeUpAction: { character: "!" } 
  },
  [name.buttonName.hButton]: {
      swipeUpAction: { character: "「" } 
  },
  [name.buttonName.jButton]: {
      swipeUpAction: { character: "」" } 
  },
  [name.buttonName.kButton]: {
      swipeUpAction: { character: "\"" } 
  },
  [name.buttonName.lButton]: {
      swipeUpAction: { character: "\"" } 
  },
  [name.buttonName.zButton]: {
      swipeUpAction: { character: "_" },
      swipeDownAction: getInput({ shortcut: "#undo" },{ shortcutCommand: "#撤销" }),
      setDownForegroundStyle: { systemImageName: "app" },
      setDownHintStyle: { text: "撤销" },
  },
  [name.buttonName.xButton]: {
      swipeUpAction: { character: "-" },
      swipeDownAction: getInput({ shortcut: "#cut" },{ shortcutCommand: "#剪切" }),
      setDownForegroundStyle: { systemImageName: "app" },
      setDownHintStyle: { text: "剪切" },
  },
  [name.buttonName.cButton]: {
      swipeUpAction: { symbol: "/" },
      swipeDownAction: getInput({ shortcut: "#copy" },{ shortcutCommand: "#复制" }),
      setDownForegroundStyle: { systemImageName: "app" },
      setDownHintStyle: { text: "复制" },
  },
  [name.buttonName.vButton]: {
      swipeUpAction: { character: "？" },
      swipeDownAction: getInput({ shortcut: "#paste" },{ shortcutCommand: "#粘贴" }),
      setDownForegroundStyle: { systemImageName: "app" },
      setDownHintStyle: { text: "粘贴" },
  },
  [name.buttonName.bButton]: {
      swipeUpAction: { character: "、" } 
  },
  [name.buttonName.nButton]: {
      swipeUpAction: { character: "：" },
      swipeDownAction: { shortcutCommand: "#行首" },
      setDownForegroundStyle: { systemImageName: "app" },
      setDownHintStyle: { text: "行首" },
  },
  [name.buttonName.mButton]: {
      swipeUpAction: { character: "；" },
      swipeDownAction: { shortcutCommand: "#行尾" },
      setDownForegroundStyle: { systemImageName: "app" },
      setDownHintStyle: { text: "行尾" },
  },
  [name.buttonName.shiftButton]: {
      swipeUpAction: "tab",
      swipeDownAction: { shortcutCommand: "#keyboardPerformance" },
      setUpHintStyle: { text: "Tab" },
      setDownHintStyle: { text: "性能" },
  },
  [name.buttonName.backspaceButton]: {
      swipeUpAction: { shortcutCommand: "#deleteText" },
      swipeDownAction: getInput({ shortcut: "#undo" },{ shortcutCommand: "#撤销" }),
      setUpHintStyle: { text: "清空" },
      setDownHintStyle: { text: "撤销" },
  },
  [name.buttonName.ottButton]: {
      swipeUpAction: { keyboardType: "symbolic" },
      swipeDownAction: { keyboardType: "emoji" },
      setUpHintStyle: { text: "符号" },
      setDownHintStyle: { text: "表情" },
  },
  [name.buttonName.toggle_LButton]: {
      swipeUpAction: { symbol: "。" },
  },
  [name.buttonName.spaceButton]: {
      swipeUpAction: { keyboardType: "numeric" },
      swipeDownAction: "dismissKeyboard",
  },
  [name.buttonName.enterButton]: {
      swipeUpAction: { shortcutCommand: "#换行" },
      setUpHintStyle: { text: "换行" },
  },
},



}