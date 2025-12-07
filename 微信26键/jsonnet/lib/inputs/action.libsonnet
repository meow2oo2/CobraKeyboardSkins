// lib/inputs/action.libsonnet

local getAction = (import "../utils.libsonnet").getProcessedActionData;

local name = import "name.libsonnet";
local swipe = import "swipe.libsonnet";
local hintSymbols = import "hintSymbols.libsonnet";

function(app, mode="raw")

local action = {

[name.layoutName.pinyin_26]: {
  
  [name.buttonName.qButton]: {
      action: { character: 'q' },
      uppercasedStateAction: { character: 'Q' },
  },
  [name.buttonName.wButton]: {
      action: { character: 'w' },
      uppercasedStateAction: { character: 'W' },
  },
  [name.buttonName.eButton]: {
      action: { character: 'e' },
      uppercasedStateAction: { character: 'E' },
  },
  [name.buttonName.rButton]: {
      action: { character: 'r' },
      uppercasedStateAction: { character: 'R' },
  },
  [name.buttonName.tButton]: {
      action: { character: 't' },
      uppercasedStateAction: { character: 'T' },
  },
  [name.buttonName.yButton]: {
      action: { character: 'y' },
      uppercasedStateAction: { character: 'Y' },
  },
  [name.buttonName.uButton]: {
      action: { character: 'u' },
      uppercasedStateAction: { character: 'U' },
  },
  [name.buttonName.iButton]: {
      action: { character: 'i' },
      uppercasedStateAction: { character: 'I' },
  },
  [name.buttonName.oButton]: {
      action: { character: 'o' },
      uppercasedStateAction: { character: 'O' },
  },
  [name.buttonName.pButton]: {
      action: { character: 'p' },
      uppercasedStateAction: { character: 'P' },
  },
  [name.buttonName.aButton]: {
      action: { character: 'a' },
      uppercasedStateAction: { character: 'A' },
  },
  [name.buttonName.sButton]: {
      action: { character: 's' },
      uppercasedStateAction: { character: 'S' },
  },
  [name.buttonName.dButton]: {
      action: { character: 'd' },
      uppercasedStateAction: { character: 'D' },
  },
  [name.buttonName.fButton]: {
      action: { character: 'f' },
      uppercasedStateAction: { character: 'F' },
  },
  [name.buttonName.gButton]: {
      action: { character: 'g' },
      uppercasedStateAction: { character: 'G' },
  },
  [name.buttonName.hButton]: {
      action: { character: 'h' },
      uppercasedStateAction: { character: 'H' },
  },
  [name.buttonName.jButton]: {
      action: { character: 'j' },
      uppercasedStateAction: { character: 'J' },
  },
  [name.buttonName.kButton]: {
      action: { character: 'k' },
      uppercasedStateAction: { character: 'K' },
  },
  [name.buttonName.lButton]: {
      action: { character: 'l' },
      uppercasedStateAction: { character: 'L' },
  },
  [name.buttonName.zButton]: {
      action: { character: 'z' },
      uppercasedStateAction: { character: 'Z' },
  },
  [name.buttonName.xButton]: {
      action: { character: 'x' },
      uppercasedStateAction: { character: 'X' },
  },
  [name.buttonName.cButton]: {
      action: { character: 'c' },
      uppercasedStateAction: { character: 'C' },
  },
  [name.buttonName.vButton]: {
      action: { character: 'v' },
      uppercasedStateAction: { character: 'V' },
  },
  [name.buttonName.bButton]: {
      action: { character: 'b' },
      uppercasedStateAction: { character: 'B' },
  },
  [name.buttonName.nButton]: {
      action: { character: 'n' },
      uppercasedStateAction: { character: 'N' },
  },
  [name.buttonName.mButton]: {
      action: { character: 'm' },
      uppercasedStateAction: { character: 'M' },
  },
  [name.buttonName.shiftButton]: {
      action: "shift", 
      setForegroundStyle: { systemImageName: "shift"},
      setUppercaseStateForegroundStyle: { systemImageName: "shift.fill" },
      setCapsLockedStateForegroundStyle: { systemImageName: "capslock.fill" },
  },
  [name.buttonName.backspaceButton]: {
      action: "backspace",
      repeatAction: "backspace",
      // preeditStateAction: "backspace",
      setForegroundStyle: { systemImageName: "delete.left", highlightSystemImageName: 'delete.left.fill' },
  },
  [name.buttonName.ottButton]: {
      action: { keyboardType: "numeric_26" },
      setForegroundStyle: { systemImageName: "textformat.123" }
  },
  [name.buttonName.toggle_LButton]: {
      action: { character: '，' },
  },
  [name.buttonName.spaceButton]: {
      action: "space",
      setForegroundStyle: { text: " " } 
  },
  [name.buttonName.toggle_RButton]: {
      action: { keyboardType: "alphabetic" },
      setForegroundStyle: { assetImageName: "chineseState" }
  },
  [name.buttonName.enterButton]: { 
      action: "enter" ,
      setForegroundStyle: { text: "$returnKeyType" } 
  },
},


// [name.layoutName.numer_26]: {
  
//   [name.buttonName.qButton]: {
//       action: { symbol: '1' },
//   },
//   [name.buttonName.wButton]: {
//       action: { symbol: '2' },
//   },
//   [name.buttonName.eButton]: {
//       action: { symbol: '3' },
//   },
//   [name.buttonName.rButton]: {
//       action: { symbol: '4' },
//   },
//   [name.buttonName.tButton]: {
//       action: { symbol: '5' },
//   },
//   [name.buttonName.yButton]: {
//       action: { symbol: '6' },
//   },
//   [name.buttonName.uButton]: {
//       action: { symbol: '7' },
//   },
//   [name.buttonName.iButton]: {
//       action: { symbol: '8' },
//   },
//   [name.buttonName.oButton]: {
//       action: { symbol: '9' },
//   },
//   [name.buttonName.pButton]: {
//       action: { symbol: '0' },
//   },
//   [name.buttonName.aButton]: {
//       action: { symbol: '-' },
//   },
//   [name.buttonName.sButton]: {
//       action: { symbol: '/' },
//   },
//   [name.buttonName.dButton]: {
//       action: { symbol: '：' },
//   },
//   [name.buttonName.fButton]: {
//       action: { symbol: '～' },
//   },
//   [name.buttonName.gButton]: {
//       action: { symbol: '（' },
//   },
//   [name.buttonName.hButton]: {
//       action: { symbol: '）' },
//   },
//   [name.buttonName.jButton]: {
//       action: { symbol: '…' },
//   },
//   [name.buttonName.kButton]: {
//       action: { symbol: '@' },
//   },
//   [name.buttonName.lButton]: {
//       action: { symbol: '“' },
//   },
//   [name.buttonName.zButton]: {
//       action: { symbol: '”' },
//   },
//   [name.buttonName.xButton]: {
//       action: { symbol: '。' },
//   },
//   [name.buttonName.cButton]: {
//       action: { symbol: '，' },
//   },
//   [name.buttonName.vButton]: {
//       action: { symbol: '、' },
//   },
//   [name.buttonName.bButton]: {
//       action: { symbol: '？' },
//   },
//   [name.buttonName.nButton]: {
//       action: { symbol: '！' },
//   },
//   [name.buttonName.mButton]: {
//       action: { symbol: '.' },
//   },
//   [name.buttonName.shiftButton]: {
//       action: { keyboardType: "symbol_26" }, 
//       setForegroundStyle: { text: "符号" }
//   },
//   [name.buttonName.ottButton]: {
//       action: "returnPrimaryKeyboard",
//       setForegroundStyle: { systemImageName: "arrow.left" }
//   },
//   [name.buttonName.toggle_LButton]: {
//       action: { keyboardType: "emojis" },
//       setForegroundStyle: { systemImageName: "smiley", highlightSystemImageName: 'smiley.fill' }
//   },
//   [name.buttonName.toggle_RButton]: {
//       action: { shortcut: "#换行" },
//       setForegroundStyle: { text: "换行" }
//   },
// },

// [name.layoutName.symbol_26]: {
  
//   [name.buttonName.qButton]: {
//       action: { symbol: '_' },
//   },
//   [name.buttonName.wButton]: {
//       action: { symbol: '—' },
//   },
//   [name.buttonName.eButton]: {
//       action: { symbol: '；' },
//   },
//   [name.buttonName.rButton]: {
//       action: { symbol: '|' },
//   },
//   [name.buttonName.tButton]: {
//       action: { symbol: '%' },
//   },
//   [name.buttonName.yButton]: {
//       action: { symbol: '+' },
//   },
//   [name.buttonName.uButton]: {
//       action: { symbol: '-' },
//   },
//   [name.buttonName.iButton]: {
//       action: { symbol: '×' },
//   },
//   [name.buttonName.oButton]: {
//       action: { symbol: '÷' },
//   },
//   [name.buttonName.pButton]: {
//       action: { symbol: '=' },
//   },
//   [name.buttonName.aButton]: {
//       action: { symbol: '【' },
//   },
//   [name.buttonName.sButton]: {
//       action: { symbol: '】' },
//   },
//   [name.buttonName.dButton]: {
//       action: { symbol: '｛' },
//   },
//   [name.buttonName.fButton]: {
//       action: { symbol: '｝' },
//   },
//   [name.buttonName.gButton]: {
//       action: { symbol: '《' },
//   },
//   [name.buttonName.hButton]: {
//       action: { symbol: '》' },
//   },
//   [name.buttonName.jButton]: {
//       action: { symbol: '#' },
//   },
//   [name.buttonName.kButton]: {
//       action: { symbol: '$' },
//   },
//   [name.buttonName.lButton]: {
//       action: { symbol: '&' },
//   },
//   [name.buttonName.zButton]: {
//       action: { symbol: '·' },
//   },
//   [name.buttonName.xButton]: {
//       action: { symbol: '「' },
//   },
//   [name.buttonName.cButton]: {
//       action: { symbol: '」' },
//   },
//   [name.buttonName.vButton]: {
//       action: { symbol: '<' },
//   },
//   [name.buttonName.bButton]: {
//       action: { symbol: '>' },
//   },
//   [name.buttonName.nButton]: {
//       action: { symbol: '^' },
//   },
//   [name.buttonName.mButton]: {
//       action: { symbol: '*' },
//   },
//   [name.buttonName.shiftButton]: {
//       action: { keyboardType: "numeric_26" }, 
//       setForegroundStyle: {  "systemImageName": "textformat.123"  }
//   },
//   [name.buttonName.ottButton]: {
//       action: "returnPrimaryKeyboard",
//       setForegroundStyle: { systemImageName: "arrow.left" }
//   },

// },


};



std.mergePatch(
    getAction(action, mode), 
    std.mergePatch(swipe(app), hintSymbols(app))
)
