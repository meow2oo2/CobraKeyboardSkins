// lib/inputs/name.libsonnet


local layoutName = {
  pinyin_26: "pinyin_26",
  alphabetic_26: "alphabetic_26",
  numer_26: "numer_26",
  symbol_26: "symbol_26",
  numric: "numeric",
  symbolic: "symbolic"
};

local rimeschemaName = {
    [layoutName.pinyin_26]: "", // "rime_ice"
    [layoutName.alphabetic_26]: "", // 雾凇的英文方案"melt_eng"
    // [layoutName.pinyin_t9]: "", // "t9"
  };

local buttonName = {

  // 标准26键盘按钮 qButton to mButton
  qButton: "qButton",
  wButton: "wButton",
  eButton: "eButton",
  rButton: "rButton",
  tButton: "tButton",
  yButton: "yButton",
  uButton: "uButton",
  iButton: "iButton",
  oButton: "oButton",
  pButton: "pButton",

  aButton: "aButton",
  sButton: "sButton",
  dButton: "dButton",
  fButton: "fButton",
  gButton: "gButton",
  hButton: "hButton",
  jButton: "jButton",
  kButton: "kButton",
  lButton: "lButton",

  zButton: "zButton",
  xButton: "xButton",
  cButton: "cButton",
  vButton: "vButton",
  bButton: "bButton",
  nButton: "nButton",
  mButton: "mButton",

  // 9宫格键盘按钮 oneButton to nineButton
  oneButton: "oneButton",
  twoButton: "twoButton",
  threeButton: "threeButton",
  fourButton: "fourButton",
  fiveButton: "fiveButton",
  sixButton: "sixButton",
  sevenButton: "sevenButton",
  eightButton: "eightButton",
  nineButton: "nineButton",

  // 通用功能键按钮
  shiftButton: "shiftButton",
  backspaceButton: "backspaceButton",
  ottButton: "ottButton",
  spaceButton: "spaceButton",
  enterButton: "enterButton",

  func_LButton: "fun_LButton",
  func_RButton: "fun_RButton",
  toggle_LButton: "toggle_LButton",
  toggle_RButton: "toggle_RButton",
  space_LButton: "space_LButton",
  space_RButton: "space_RButton",

};



{
  layoutName: layoutName,
  buttonName: buttonName,
  rimeschemaName: rimeschemaName
}