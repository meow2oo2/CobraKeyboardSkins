// lib/inputs/hintSymbols.libsonnet

// local fileImage = (import "../imports.libsonnet").fileImage; 

local name = import "name.libsonnet";
local defaultSymbolWidth = "1em";

function(app)
  local getInput(c, h) = if app=="hskin" then h else c; //
{

[name.layoutName.pinyin_26]: {
  
  [name.buttonName.qButton]: {
      selectedIndex: 0,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "1" } },
        { action: { symbol: "|" } },
        { action: { symbol: "¦" } },
      ],
  },

  [name.buttonName.wButton]: {
      selectedIndex: 0,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "2" } },
        { action: { symbol: "%" } },
        { action: { symbol: "°C" } },
      ],
  },

  [name.buttonName.eButton]: {
      selectedIndex: 0,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "3" } },
        { action: { symbol: "£" } },
        { action: { symbol: "€" } },
      ],
  },

  [name.buttonName.rButton]: {
      selectedIndex: 0,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "2" } },
        { action: { symbol: "$" } },
        { action: { symbol: "¥" } },
      ],
  },

  [name.buttonName.tButton]: {
      selectedIndex: 0,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "5" } },
        { action: { character: "=" } },
        { action: { symbol: "≠" } },
      ],
  },

  [name.buttonName.yButton]: {
      selectedIndex: 2,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "6" } },
        { action: { symbol: "≈" } },
        { action: { symbol: "≒" } },
      ],
  },

  [name.buttonName.uButton]: {
      selectedIndex: 2,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "7" } },
        { action: { symbol: "《" } },
        { action: { symbol: "<" } },
      ],
  },

  [name.buttonName.iButton]: {
      selectedIndex: 2,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "8" } },
        { action: { symbol: "》" } },
        { action: { symbol: ">" } },
      ],
  },

  [name.buttonName.oButton]: {
      selectedIndex: 2,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "9" } },
        { action: { symbol: "【" } },
        { action: { symbol: "（" } },
      ],
  },

  [name.buttonName.pButton]: {
      selectedIndex: 2,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "0" } },
        { action: { symbol: "】" } },
        { action: { symbol: "）" } },
      ],
  },

  [name.buttonName.aButton]: {
      selectedIndex: 0,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "'" } },
        { action: { symbol: "＇" } },
        { action: { symbol: "ˉ" } },
      ],
  },

  [name.buttonName.sButton]: {
      selectedIndex: 0,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "ˊ" } },
        { action: { symbol: "ˇ" } },
        { action: { symbol: "ˋ" } },
      ],
  },

  [name.buttonName.dButton]: {
      selectedIndex: 0,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "＃" } },
        { action: { symbol: "·" } },
        { action: { symbol: "•" } },
      ],
  },

  [name.buttonName.fButton]: {
      selectedIndex: 0,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "&" } },
        { action: { symbol: "∞" } },
        { action: { symbol: "π" } },
      ],
  },

  [name.buttonName.gButton]: {
      selectedIndex: 0,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "!" } },
        { action: { symbol: "¡" } },
        { action: { symbol: "﹏" } },
      ],
  },

  [name.buttonName.hButton]: {
      selectedIndex: 2,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "{" } },
        { action: { symbol: "[" } },
        { action: { symbol: "(" } },
      ],
  },

  [name.buttonName.jButton]: {
      selectedIndex: 2,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "}" } },
        { action: { symbol: "]" } },
        { action: { symbol: ")" } },
      ],
  },

  [name.buttonName.kButton]: {
      selectedIndex: 2,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "'" } },
        { action: { character: "‘" } },
        { action: { symbol: "\"" } },
      ],
  },

  [name.buttonName.lButton]: {
      selectedIndex: 2,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "'" } },
        { action: { character: "’" } },
        { action: { symbol: "\"" } },
      ],
  },

  [name.buttonName.zButton]: {
      selectedIndex: 0,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "—" } },
        { action: { symbol: "~" } },
        { action: { symbol: "～" } },
      ],
  },

  [name.buttonName.xButton]: {
      selectedIndex: 0,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "^" } },
        { action: { symbol: "×" } },
        { action: { symbol: "+" } },
      ],
  },

  [name.buttonName.cButton]: {
      selectedIndex: 0,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "\\" } },
        { action: { symbol: "÷" } },
        { action: { symbol: "✓" } },
      ],
  },

  [name.buttonName.vButton]: {
      selectedIndex: 0,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "？" } },
        { action: { symbol: "﹖" } },
        { action: { symbol: "¿" } },
      ],
  },

  [name.buttonName.bButton]: {
      selectedIndex: 2,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "丶" } },
        { action: { symbol: "," } },
        { action: { symbol: "，" } },
      ],
  },

  [name.buttonName.nButton]: {
      selectedIndex: 2,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "." } },
        { action: { symbol: "。" } },
        { action: { symbol: ":" } },
      ],
  },

  [name.buttonName.mButton]: {
      selectedIndex: 2,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { symbol: "…" } },
        { action: { symbol: "⋯" } },
        { action: { symbol: ";" } },
      ],
  },

  [name.buttonName.shiftButton]: {
      selectedIndex: 0,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { shortcut: "#RimeSwitcher" } , label: {text: "选单"} },
        { action: { shortcut: "#方案切换" } , label: {text: "方案"} },
        // { action: "nextKeyboard" , label: { systemImageName: "globe.badge.chevron.backward"}},
      ],
  },

  [name.buttonName.ottButton]: {
      selectedIndex: 0,
      symbolWidth: defaultSymbolWidth,
      actions: [
        { action: { keyboardType: "symbolic" } , label: {text: "符号"} },
        { action: { keyboardType: "emojis" }, label: {text: "表情"} },
      ],
  },
},



}