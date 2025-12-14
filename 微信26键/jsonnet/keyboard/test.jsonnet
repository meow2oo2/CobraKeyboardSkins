// alphabet_main.libsonnet

local Imports = import '../lib/imports.libsonnet';
local utils = import "../lib/utils.libsonnet";
local pinyin = import 'pinyin_26.jsonnet';
local alphabetic_26 = import 'alphabetic_26.jsonnet';
local numer_26 = import 'numer_26.jsonnet';
local symbol_26 = import 'symbol_26.jsonnet';
local layoutName = Imports.name.layoutName.pinyin_26;

local buttonStyle = Imports.buttonStyle;
local baseParams = buttonStyle.baseParams;
local fileImage = buttonStyle.fileImage;

local app = "cskin";
local device = "iphone";
local orientation = "portrait";
local theme = "light";

pinyin(app, device, orientation, theme)
// Imports.getHeight(device, orientation, "notToolbar")

// jsonnet test.jsonnet
// jsonnet .\test.jsonnet -o .\alphabet.yaml -J .


// 3049602946jCxjp@0.6

// utils.getKeyboardActionText(Imports.action(app)[layoutName].zButton, "swipeDownAction", "SwipeDownHintForegroundStyle")
// utils.getKeyboardActionText(Imports.action(app)[layoutName].zButton,  "swipeDownAction", "swipeDownForegroundStyle")
// local uppercasedStateForegroundStyle(name, isNative=true) = 
//   if isNative then (baseParams("uppercased前景") 
//     + baseParams("shift状态字母前景字体大小") ) else fileImage(name, "uppercasedStateForegroundStyle");

//     uppercasedStateForegroundStyle("aButton")
// baseParams("shift状态字母前景字体大小")
// buttonStyle.newAlphabeticButtonBackgroundStyle(app, theme)
// baseParams("背景色通用参数")
// if std.objectHas(Imports.action(app)[layoutName].enterButton, "foregroundStyle") then 
//       Imports.action(app)[layoutName].enterButton.foregroundStyle
//     else utils.getKeyboardActionText(Imports.action(app)[layoutName].enterButton)