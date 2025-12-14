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
      swipeDownForegroundStyle: { systemImageName: "checklist" },
      swipeDownHintForegroundStyle: { text: "全选" },
  },
  [name.buttonName.sButton]: {
      swipeUpAction: { character: "@" },
      swipeDownAction: getInput({ shortcut: "#redo" }, { shortcutCommand: "#重做" }),
      swipeDownForegroundStyle: { systemImageName: "arrow.turn.up.right" },
      swipeDownHintForegroundStyle: { text: "重做" },
  },
  [name.buttonName.dButton]: {
      swipeUpAction: { character: "#" } 
  },
  [name.buttonName.fButton]: {
      swipeUpAction: { character: "*" } 
  },
  [name.buttonName.gButton]: {
      swipeUpAction: { character: "！" } 
  },
  [name.buttonName.hButton]: {
      swipeUpAction: { character: "「" } 
  },
  [name.buttonName.jButton]: {
      swipeUpAction: { character: "」" } ,
      swipeUpForegroundStyle: { text: "」", center: { x: 0.8, y: 0.23 } },
      swipeUpHintForegroundStyle: { text: "」", center: {x: 0.55, y: 0.16 } },
  },
  [name.buttonName.kButton]: {
      swipeUpAction: { character: '“' } 
  },
  [name.buttonName.lButton]: {
      swipeUpAction: { character: '”' } 
  },
  [name.buttonName.zButton]: {
      swipeUpAction: { symbol: "_" },
      swipeDownAction: getInput({ shortcut: "#undo" },{ shortcutCommand: "#撤销" }),
      swipeUpForegroundStyle: { text: "_", center: { x: 0.78, y: 0.23 } },
      swipeUpHintForegroundStyle: { text: "_", center: { y: 0.18 } },
      swipeDownForegroundStyle: { systemImageName: "arrow.turn.up.left" },
      swipeDownHintForegroundStyle: { text: "撤销" },
  },
  [name.buttonName.xButton]: {
      swipeUpAction: { character: "-" },
      swipeDownAction: getInput({ shortcut: "#cut" },{ shortcutCommand: "#剪切" }),
      swipeDownForegroundStyle: { systemImageName: "scissors" },
      swipeDownHintForegroundStyle: { text: "剪切" },
  },
  [name.buttonName.cButton]: {
      swipeUpAction: { character: "/" },
      swipeDownAction: getInput({ shortcut: "#copy" },{ shortcutCommand: "#复制" }),
      swipeDownForegroundStyle: { systemImageName: "square.on.square.dashed" },
      swipeDownHintForegroundStyle: { text: "复制" },
  },
  [name.buttonName.vButton]: {
      swipeUpAction: { character: "？" },
      swipeDownAction: getInput({ shortcut: "#paste" },{ shortcutCommand: "#粘贴" }),
      swipeDownForegroundStyle: { systemImageName: "doc.on.doc" },
      swipeDownHintForegroundStyle: { text: "粘贴" },
  },
  [name.buttonName.bButton]: {
      swipeUpAction: { character: "、" } ,
      swipeUpForegroundStyle: { text: "、", center: { x: 0.78, y: 0.23 } },
      swipeUpHintForegroundStyle: { text: "、", center: {x: 0.6, y: 0.18 } },
  },
  [name.buttonName.nButton]: {
      swipeUpAction: { character: "：" },
      swipeDownAction: { shortcutCommand: "#行首" },
      swipeDownForegroundStyle: { systemImageName: "arrow.left.to.line" },
      swipeDownHintForegroundStyle: { text: "行首" },
  },
  [name.buttonName.mButton]: {
      swipeUpAction: { character: "；" },
      swipeDownAction: { shortcutCommand: "#行尾" },
      swipeDownForegroundStyle: { systemImageName: "arrow.right.to.line" },
      swipeDownHintForegroundStyle: { text: "行尾" },
  },
  [name.buttonName.shiftButton]: {
      swipeUpAction: "tab",
      swipeDownAction: { shortcutCommand: "#keyboardPerformance" },
      swipeUpHintForegroundStyle: { text: "Tab" },
      swipeDownHintForegroundStyle: { text: "性能" },
  },
  [name.buttonName.backspaceButton]: {
      swipeUpAction: { shortcutCommand: "#deleteText" },
      swipeDownAction: getInput({ shortcut: "#undo" },{ shortcutCommand: "#撤销" }),
      swipeUpHintForegroundStyle: { text: "清空" },
      swipeDownHintForegroundStyle: { text: "撤销" },
  },
  [name.buttonName.ottButton]: {
      swipeUpAction: { keyboardType: "symbolic" },
      swipeDownAction: { keyboardType: "emoji" },
      swipeUpHintForegroundStyle: { text: "符号" },
      swipeDownHintForegroundStyle: { text: "表情" },
  },
  [name.buttonName.toggle_LButton]: {
      swipeUpAction: { character: "。" },
      swipeUpHintForegroundStyle: { text: "。", center: { x: 0.6, y: 0.16 } },
  },
  [name.buttonName.spaceButton]: {
      swipeUpAction: { keyboardType: "numeric" },
      swipeDownAction: "dismissKeyboard",
  },
  [name.buttonName.enterButton]: {
      swipeUpAction: { shortcutCommand: "#换行" },
      swipeUpHintForegroundStyle: { text: "换行" },
  },
},



}