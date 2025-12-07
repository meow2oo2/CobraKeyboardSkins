// lib/styles/baseStyle.libsonnet

local Imports = import "../imports.libsonnet";
local utils = import "../utils.libsonnet";
local setNative = true;

function(name="")
local baseParam = Imports.baseParam;
local nativeConfig = Imports.baseParam.color.nativeConfig;
local fileImage = Imports.fileImage;

local keyboardBackgroundStyleName = "keyboardBackgroundStyle";
local toolbarBackgroundStyleName = "toolbarBackgroundStyle";
local preeditBackgroundStyleName = "preeditBackgroundStyle";
local alphabeticButtonBackgroundStyleName = "alphabeticButtonBackgroundStyle";
local systemButtonBackgroundStyleName = "systemButtonBackgroundStyle";
local blueButtonBackgroundStyleName = "blueButtonBackgroundStyle";
local hintBackgroundStyleName = "hintBackgroundStyle";
local hintSymbolsBackgroundStyleName = "hintSymbolsBackgroundStyle";
local hintSymbolsSelectedBackgroundStyleName = "hintSymbolsSelectedBackgroundStyle";
local systemButtonForegroundStyleName = 'systemButtonForegroundStyle';
local blueButtonForegroundStyleName = 'blueButtonForegroundStyle';
local spacePreeditStateForegroundStyleName = 'spacePreeditStateForegroundStyle';

local newKeyboardBackgroundStyle(params={}, isNative=setNative) = (
  if isNative then baseParam.color.themeColor["键盘区背景"]
  else fileImage.backgroundStyle["键盘区背景"]) + utils.newBaseParamsAtFormat(params);

local newToolbarBackgroundStyle(params={}, isNative=setNative) = (
  if isNative then baseParam.color.themeColor["键盘区背景"]
  else fileImage.backgroundStyle["工具栏区背景"]) + utils.newBaseParamsAtFormat(params);

local newPreeditBackgroundStyle(params={}, isNative=setNative) = (
  if isNative then baseParam.color.themeColor["键盘区背景"]
  else fileImage.backgroundStyle["预编辑区背景"]) + utils.newBaseParamsAtFormat(params);

local newAlphabeticButtonBackgroundStyle(params={}, isNative=setNative) = (
  (if isNative then baseParam.color.themeColor["字母键背景"] + nativeConfig["渐变色通用参数"] + nativeConfig["背景色通用参数"]
  else fileImage.backgroundStyle["字母键背景"]) ) + utils.newBaseParamsAtFormat(
    {insets:baseParam.inner["键盘按键背景内距"]} + params
);

local newSystemButtonBackgroundStyle(params={}, isNative=setNative) = (
  (if isNative then baseParam.color.themeColor["功能键背景"] + nativeConfig["渐变色通用参数"] + nativeConfig["背景色通用参数"]
  else fileImage.backgroundStyle["功能键背景"]) ) + utils.newBaseParamsAtFormat(
    {insets:baseParam.inner["键盘按键背景内距"]} + params
);

local newBlueButtonBackgroundStyle(params={}, isNative=setNative) = (
  (if isNative then baseParam.color.themeColor["蓝色键背景"] + nativeConfig["渐变色通用参数"] + nativeConfig["背景色通用参数"]
  else fileImage.backgroundStyle["蓝色键背景"]) ) + utils.newBaseParamsAtFormat(
    {insets:baseParam.inner["键盘按键背景内距"]} + params
);

local newHintBackgroundStyle(params={}, isNative=false) = (
  (if isNative then baseParam.color.themeColor["提示背景"] + nativeConfig["渐变色通用参数"] + nativeConfig["背景色通用参数"]
  else fileImage.backgroundStyle["提示背景"]) ) + utils.newBaseParamsAtFormat(params);

local newHintSymbolsBackgroundStyle(params={}, isNative=setNative) = (
  (if isNative then baseParam.color.themeColor["长按背景"] + nativeConfig["渐变色通用参数"] + nativeConfig["背景色通用参数"]
  else fileImage.backgroundStyle["长按背景"]) ) + utils.newBaseParamsAtFormat(params);

local newHintSymbolsSelectedBackgroundStyle(params={}, isNative=setNative) = (
  (if isNative then baseParam.color.themeColor["长按选中背景"] + nativeConfig["渐变色通用参数"] + nativeConfig["背景色通用参数"]
  else fileImage.backgroundStyle["长按选中背景"]) ) + utils.newBaseParamsAtFormat(params);



local newAlphabeticButtonForegroundStyle(name, params={}, isNative=setNative) = (
  (if isNative then baseParam.color.themeColor["字母按键前景"]
  else fileImage.foregroundStyle[name].foregroundStyle)) + utils.newBaseParamsAtFormat(params);

local newAlphabeticButtonUppercaseForegroundStyle(name, params={}, isNative=setNative) = (
  (if isNative then baseParam.color.themeColor["uppercased前景"]
  else fileImage.foregroundStyle[name].uppercasedStateForegroundStyle) ) + utils.newBaseParamsAtFormat(params);

local newAlphabeticButtonCapsLockedStateForegroundStyle(name, params={}, isNative=setNative) = (
  (if isNative then baseParam.color.themeColor["capsLocked前景"]
  else fileImage.foregroundStyle[name].capsLockedStateForegroundStyle) )+ utils.newBaseParamsAtFormat(params);

local newAlphabeticButtonHintForegroundStyle(name, params={}, isNative=setNative) = (
  (if isNative then baseParam.color.themeColor["提示前景"]
  else fileImage.foregroundStyle[name].hintForegroundStyle) )+ utils.newBaseParamsAtFormat({
    contentMode: "scaleAspectFill"
  }+params);

local newAlphabeticButtonUpForegroundStyle(params={}) = 
  baseParam.color.themeColor["上划前景"] + utils.newBaseParamsAtFormat(params);

local newAlphabeticButtonDownForegroundStyle(params={}) = 
  baseParam.color.themeColor["下划前景"] + utils.newBaseParamsAtFormat(params);

local newAlphabeticButtonHintSymbolsForegroundStyle(params={}) = 
  baseParam.color.themeColor["长按前景"] + utils.newBaseParamsAtFormat(params);

local newBlueButtonForegroundStyle(name, params={}, isNative=setNative) = (
  (if isNative then baseParam.color.themeColor["蓝色键前景"]
  else fileImage.foregroundStyle[name].foregroundStyle)) + utils.newBaseParamsAtFormat(
    {insets:baseParam.inner["键盘按键背景内距"]} + params
);

local newSystemButtonForegroundStyle(name, params={}, isNative=setNative) = (
  (if isNative then baseParam.color.themeColor["功能键前景"]
  else fileImage.foregroundStyle[name].foregroundStyle) ) + utils.newBaseParamsAtFormat(
    {insets:baseParam.inner["键盘按键背景内距"]} + params
);



local toolbarButtonRealBackgroundStyle = utils.newBaseParamsAtFormat({
  systemImageName: "circlebadge.fill",
  fontSize: 45,
  // center: {x: 0.5, y: 0.62}
  } + baseParam.color.themeColor["工具栏按钮背景"]
);

local toolbarButtonForegroundStyle(isNative=setNative) = (
  if isNative then baseParam.color.themeColor["工具栏按钮前景"]
  else  fileImage.imageConfig["工具栏按钮前景"]) 
  + utils.newBaseParamsAtFormat({
    fontSize: 16,
    // center: {x: "0.5", y: "0.6"}
});




local candidateContextMenuStyleName = 'candidateContextMenuStyle';
local candidateStateButtonStyleName = 'candidateStateButtonStyle';
local toolbarButtonBackgroundStyleName = "toolbarButtonBackgroundStyle";
local toolbarButtonRealBackgroundStyleName = "toolbarButtonRealBackgroundStyle";

local candidatesStyle(theme) = {
  indexFontSize: baseParam.font["候选区索引字体大小"],
  textFontSize: baseParam.font["候选区候选字体大小"],
  commentFontSize: baseParam.font["候选区注释字体大小"],
  indexFontWeight: "light",
  textFontWeight: "regular",
  commentFontWeight: "light",
  } + baseParam.color.themeColor["候选字颜色"][theme];

// 展开按钮
local candidateStateButtonBackgroundStyle = {
  light: {
    normalColor: "57575701",
    highlightColor: "00103412",
  },
  dark: {
    normalColor: "fefefe01",
    highlightColor: "d1d1d165",
  }
};
local candidateStateButtonForegroundStyle(isNative=setNative) = (
  if isNative then baseParam.color.nativeConfig["横向候选展开按钮前景"]
  else fileImage.imageConfig["横向候选展开按钮前景"])
  + utils.newBaseParamsAtFormat({
    systemImageName: "chevron.down",
    fontSize: 18,
    fontWeight: "regular",
    // center: { x: "0.5", y: "0.56"}
});
local returnPrimaryKeyboardButtonForegroundStyle(isNative=setNative) = (
  if isNative then baseParam.color.nativeConfig["横向候选展开按钮前景"]
  else fileImage.imageConfig["纵向候选收起按钮前景"])
  + utils.newBaseParamsAtFormat({
    systemImageName: "chevron.up",
    fontSize: 18,
    fontWeight: "regular",
    // center: { x: "0.5", y: "0.56"}
});
local candidateStateButtonSeparatorForegroundStyleName = "candidateStateButtonSeparatorForegroundStyle"; // 屏蔽分割线, 修改这个常量
local candidateStateButtonSeparatorForegroundStyle = utils.newBaseParamsAtFormat({
  systemImageName: "poweron",
  fontSize: 33,
  fontWeight: "ultraLight",
  center: { x: -0.01, y: 0.5},
  light: {
    normalColor: "57575791",
    highlightColor: "57575791",
  },
  dark: {
    normalColor: "fefefe66",
    highlightColor: "fefefe66",
  }
});

// 纵向候选面板背景
local verticalCandidateBackgroundStyle(params={}, isNative=setNative) = (
  if isNative then baseParam.color.themeColor["键盘区背景"]
  else fileImage.backgroundStyle["键盘区背景"]) + utils.newBaseParamsAtFormat(params);

// 纵向候选面板底部按钮前景
local verticalForegroundStyle = 
  baseParam.color.themeColor["功能键前景"]
  + utils.newBaseParamsAtFormat({

});




{
  candidateStateButtonBackgroundStyle: candidateStateButtonBackgroundStyle,
  candidateContextMenuStyleName: candidateContextMenuStyleName,
  candidateStateButtonStyleName: candidateStateButtonStyleName,
  toolbarButtonBackgroundStyleName: toolbarButtonBackgroundStyleName,
  toolbarButtonRealBackgroundStyleName: toolbarButtonRealBackgroundStyleName,

  verticalForegroundStyle: verticalForegroundStyle,
  candidateStateButtonSeparatorForegroundStyle: candidateStateButtonSeparatorForegroundStyle,
  candidateStateButtonSeparatorForegroundStyleName: candidateStateButtonSeparatorForegroundStyleName,
  verticalCandidateBackgroundStyle: verticalCandidateBackgroundStyle,
  returnPrimaryKeyboardButtonForegroundStyle: returnPrimaryKeyboardButtonForegroundStyle(),
  candidateStateButtonForegroundStyle: candidateStateButtonForegroundStyle(),
  toolbarButtonForegroundStyle: toolbarButtonForegroundStyle,
  toolbarButtonRealBackgroundStyle: toolbarButtonRealBackgroundStyle,
  candidatesStyle: candidatesStyle,

  newAlphabeticButtonUpForegroundStyle: newAlphabeticButtonUpForegroundStyle(),
  newAlphabeticButtonDownForegroundStyle: newAlphabeticButtonDownForegroundStyle(),
  newBlueButtonForegroundStyle: newBlueButtonForegroundStyle(name),
  newSystemButtonForegroundStyle: newSystemButtonForegroundStyle(name),
  newAlphabeticButtonHintSymbolsForegroundStyle: newAlphabeticButtonHintSymbolsForegroundStyle(),
  newAlphabeticButtonHintForegroundStyle: newAlphabeticButtonHintForegroundStyle(name),
  newAlphabeticButtonCapsLockedStateForegroundStyle: newAlphabeticButtonCapsLockedStateForegroundStyle(name),
  newAlphabeticButtonUppercaseForegroundStyle: newAlphabeticButtonUppercaseForegroundStyle(name),
  newAlphabeticButtonForegroundStyle:newAlphabeticButtonForegroundStyle(name),

  newKeyboardBackgroundStyle: newKeyboardBackgroundStyle,
  newToolbarBackgroundStyle: newToolbarBackgroundStyle,
  newPreeditBackgroundStyle: newPreeditBackgroundStyle,
  newAlphabeticButtonBackgroundStyle: newAlphabeticButtonBackgroundStyle,
  newSystemButtonBackgroundStyle: newSystemButtonBackgroundStyle,
  newBlueButtonBackgroundStyle: newBlueButtonBackgroundStyle,
  newHintBackgroundStyle: newHintBackgroundStyle,
  newHintSymbolsBackgroundStyle: newHintSymbolsBackgroundStyle,
  newHintSymbolsSelectedBackgroundStyle: newHintSymbolsSelectedBackgroundStyle,

  keyboardBackgroundStyleName: keyboardBackgroundStyleName,
  toolbarBackgroundStyleName: toolbarBackgroundStyleName,
  preeditBackgroundStyleName: preeditBackgroundStyleName,
  alphabeticButtonBackgroundStyleName: alphabeticButtonBackgroundStyleName,
  systemButtonBackgroundStyleName: systemButtonBackgroundStyleName,
  blueButtonBackgroundStyleName: blueButtonBackgroundStyleName,
  hintBackgroundStyleName: hintBackgroundStyleName,
  hintSymbolsBackgroundStyleName: hintSymbolsBackgroundStyleName,
  hintSymbolsSelectedBackgroundStyleName: hintSymbolsSelectedBackgroundStyleName,

  systemButtonForegroundStyleName: systemButtonForegroundStyleName,
  blueButtonForegroundStyleName: blueButtonForegroundStyleName,
  spacePreeditStateForegroundStyleName: spacePreeditStateForegroundStyleName,

}