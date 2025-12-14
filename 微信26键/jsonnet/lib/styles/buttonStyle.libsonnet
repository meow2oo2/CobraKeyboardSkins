// lib/styles/baseStyle.libsonnet

local Imports = import "../imports.libsonnet";
local utils = import "../utils.libsonnet";
local useNative = true;


local baseParams(nativeStyleName, theme=null) = if theme == null then 
  utils.getIn(Imports.baseParams, nativeStyleName) else utils.getIn(Imports.baseParams[nativeStyleName], theme);
local fileImage(name, imageStyleName=null) = if imageStyleName == null then 
  utils.getIn(Imports.fileImage, name) else utils.getIn(Imports.fileImage[name], imageStyleName);


local keyboardBackgroundStyleName = "keyboardBackgroundStyle";
local newKeyboardBackgroundStyle(app, theme, params={}, isNative=useNative) = utils.newStyleFactory(
  if isNative then baseParams("键盘区背景") else fileImage("键盘区背景"),
  keyboardBackgroundStyleName)(app, theme, params);

local toolbarBackgroundStyleName = "toolbarBackgroundStyle";
local newToolbarBackgroundStyle(app, theme, params={}, isNative=useNative) = utils.newStyleFactory(
  if isNative then baseParams("键盘区背景") else fileImage("工具栏区背景"),
  toolbarBackgroundStyleName)(app, theme, params);

local preeditBackgroundStyleName = "preeditBackgroundStyle";
local newPreeditBackgroundStyle(app, theme, params={}, isNative=useNative) = utils.newStyleFactory(
  if isNative then baseParams("键盘区背景") else fileImage("预编辑区背景"),
  preeditBackgroundStyleName)(app, theme, params);

local alphabeticButtonBackgroundStyleName = "alphabeticButtonBackgroundStyle";
local newAlphabeticButtonBackgroundStyle(app, theme, params={}, isNative=useNative) =
  utils.newStyleFactory(
    (if isNative then (
      baseParams("字母键背景")
      + baseParams("背景色通用参数")
      + baseParams("渐变色通用参数")
    )
    else fileImage("字母键背景"))
    {
    insets: baseParams("键盘按键背景内距"),
    },
    alphabeticButtonBackgroundStyleName
  )(app, theme, params);


local systemButtonBackgroundStyleName = "systemButtonBackgroundStyle";
local newSystemButtonBackgroundStyle(app, theme, params={}, isNative=useNative) =
  utils.newStyleFactory(
    (if isNative then (
      baseParams("功能键背景")
      + baseParams("背景色通用参数")
      + baseParams("渐变色通用参数")
    )
    else fileImage("功能键背景"))
    {
    insets: baseParams("键盘按键背景内距"),
    },
    systemButtonBackgroundStyleName
  )(app, theme, params);


local blueButtonBackgroundStyleName = "blueButtonBackgroundStyle";
local newBlueButtonBackgroundStyle(app, theme, params={}, isNative=useNative) =
  utils.newStyleFactory(
    (if isNative then (
      baseParams("蓝色键背景")
      + baseParams("背景色通用参数")
      + baseParams("渐变色通用参数")
    )
    else fileImage("蓝色键背景"))
    {
    insets: baseParams("键盘按键背景内距"),
    },
    blueButtonBackgroundStyleName
  )(app, theme, params);


local hintBackgroundStyleName = "hintBackgroundStyle";
local newHintBackgroundStyle(app, theme, params={}, isNative=false) = utils.newStyleFactory(
    if isNative then (
      baseParams("提示背景")
      + baseParams("背景色通用参数")
      + baseParams("渐变色通用参数")
    )
    else fileImage("提示背景"),
    hintBackgroundStyleName
  )(app, theme, params);


local hintSymbolsBackgroundStyleName = "hintSymbolsBackgroundStyle";
local newHintSymbolsBackgroundStyle(app, theme, params={}, isNative=useNative) =
  utils.newStyleFactory(
    (if isNative then (
      baseParams("长按背景")
      + baseParams("背景色通用参数")
      + baseParams("渐变色通用参数")
    )
    else fileImage("长按背景"))
    {
    // insets: baseParams("长按背景内距"),
    },
    hintSymbolsBackgroundStyleName
  )(app, theme, params);


local hintSymbolsSelectedBackgroundStyleName = "hintSymbolsSelectedBackgroundStyle";
local newHintSymbolsSelectedBackgroundStyle(app, theme, params={}, isNative=useNative) =
  utils.newStyleFactory(
    (if isNative then (
      baseParams("长按选中背景")
      + baseParams("背景色通用参数")
      + baseParams("渐变色通用参数")
    )
    else fileImage("长按选中背景"))
    {
    insets: baseParams("长按选中背景内距"),
    },
    hintSymbolsSelectedBackgroundStyleName
  )(app, theme, params);



local systemButtonForegroundStyleName = 'systemButtonForegroundStyle';
local blueButtonForegroundStyleName = 'blueButtonForegroundStyle';
local spacePreeditStateForegroundStyleName = 'spacePreeditStateForegroundStyle';

local newSystemButtonImageForegroundStyle(name, imageStyleName="foregroundStyle", isNative=useNative) = 
  if isNative then (baseParams("功能键前景") 
    + {fontSize: baseParams("功能键SF前景字体大小")} ) else fileImage(name, imageStyleName);

local newSystemButtonTextForegroundStyle(name, imageStyleName="foregroundStyle", isNative=useNative) = 
  if isNative then (baseParams("功能键前景") 
    + {fontSize: baseParams("功能键text前景字体大小")} ) else fileImage(name, imageStyleName);

local newBlueButtonImageForegroundStyle(name, imageStyleName="foregroundStyle", isNative=useNative) = 
  if isNative then (baseParams("蓝色键前景") 
    + {fontSize: baseParams("功能键SF前景字体大小")} ) else fileImage(name, imageStyleName);

local newBlueButtonTextForegroundStyle(name, imageStyleName="foregroundStyle", isNative=useNative) = 
  if isNative then (baseParams("蓝色键前景") 
    + {fontSize: baseParams("功能键text前景字体大小")} ) else fileImage(name, imageStyleName);

local alphabeticButtonForegroundStyle(name, isNative=useNative) = 
  if isNative then (baseParams("字母按键前景") 
    + {
      fontSize: baseParams("字母键前景字体大小"),
      center: baseParams("按键text前景偏移")
    } ) else fileImage(name, "foregroundStyle");

local uppercasedStateForegroundStyle(name, isNative=useNative) = 
  if isNative then (baseParams("uppercased前景") 
    + {
      fontSize: baseParams("shift状态字母前景字体大小"),
      center: baseParams("按键text前景偏移")
    } ) else fileImage(name, "uppercasedStateForegroundStyle");

local capsLockedStateForegroundStyle(name, isNative=useNative) = 
  if isNative then (baseParams("capsLocked前景") 
    + {
      fontSize: baseParams("shift状态字母前景字体大小"),
      center: baseParams("按键text前景偏移")
    } ) else fileImage(name, "capsLockedStateForegroundStyle");

local alphabeticButtonHintForegroundStyle(name, isNative=useNative) = 
  if isNative then (baseParams("提示前景") 
    + {
      fontSize: baseParams("气泡前景字体大小"),
      center: baseParams("提示气泡前景偏移")
    } ) else fileImage(name, "hintForegroundStyle");

local newAlphabeticButtonUpForegroundStyle = 
  baseParams("上划前景") + {
    fontSize: baseParams("上划前景字体大小"),
    center: baseParams("上划前景偏移")
  } + baseParams("上划前景偏移");

local newAlphabeticButtonDownForegroundStyle = 
  baseParams("下划前景") + {
    fontSize: baseParams("下划前景字体大小"),
    center: baseParams("下划前景偏移")
  } + baseParams("下划前景偏移");

local newAlphabeticButtonHintSymbolsForegroundStyle = 
  baseParams("长按前景") + {
    fontSize: baseParams("长按前景字体大小"),
    // center: baseParams("长按前景偏移")
  };

// local determineRuleType(styleObj) =
//   if std.objectHas(styleObj, 'systemImageName') || std.objectHas(styleObj, 'assetImageName') then 'SF'
//   else if std.objectHas(styleObj, 'text') then 'text'
//   else 'default';

local toolbarButtonRealBackgroundStyle = {
  systemImageName: "circlebadge.fill",
  fontSize: 45,
  // center: {x: 0.5, y: 0.62}
  } + baseParams("工具栏按钮背景");

local toolbarButtonImageForegroundStyle(isNative=useNative) = 
  if isNative then ( baseParams("工具栏按钮前景") 
    + {fontSize: baseParams("工具栏区按钮SF前景字体大小")} ) else  fileImage("工具栏按钮前景");

local toolbarButtonTextForegroundStyle(isNative=useNative) = 
  if isNative then ( baseParams("工具栏按钮前景") 
    + {
      fontSize: baseParams("工具栏区按钮text前景字体大小"),
      center: { y: 0.49 }
    } ) else  fileImage("工具栏按钮前景");



local candidateContextMenuStyleName = 'candidateContextMenuStyle';
local candidateStateButtonStyleName = 'candidateStateButtonStyle';
local toolbarButtonBackgroundStyleName = "toolbarButtonBackgroundStyle";
local toolbarButtonRealBackgroundStyleName = "toolbarButtonRealBackgroundStyle";

local candidatesStyle(theme) = {
  indexFontSize: baseParams("候选区索引字体大小"),
  textFontSize: baseParams("候选区候选字体大小"),
  commentFontSize: baseParams("候选区注释字体大小"),
  indexFontWeight: "light",
  textFontWeight: "regular",
  commentFontWeight: "light",
  } + baseParams("候选字颜色", theme) ;

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

local candidateStateButtonForegroundStyle(isNative=useNative) = 
  if isNative then (baseParams("横向候选展开按钮前景"){
    systemImageName: "chevron.down",
    fontSize: 18,
    fontWeight: "regular",
    center: { x: "0.5", y: "0.56"}
  }) else fileImage("横向候选展开按钮前景");

local returnPrimaryKeyboardButtonForegroundStyle(isNative=useNative) = 
  if isNative then (baseParams("横向候选展开按钮前景"){
    systemImageName: "chevron.up",
    fontSize: 18,
    fontWeight: "regular",
  }) else fileImage("纵向候选收起按钮前景");

local candidateStateButtonSeparatorForegroundStyleName = "candidateStateButtonSeparatorForegroundStyle"; // 屏蔽分割线, 修改这个常量
local candidateStateButtonSeparatorForegroundStyle(theme) = {
  buttonStyleType: "systemImage",
  systemImageName: "poweron",
  fontSize: 33,
  fontWeight: "ultraLight",
  center: baseParams("横向候选区左侧分隔线前景偏移")
  } + utils.getColor({
    light: {
      normalColor: "57575791",
      highlightColor: "57575791",
    },
    dark: {
      normalColor: "fefefe66",
      highlightColor: "fefefe66",
    }
  }, theme);

// 纵向候选面板背景
local verticalCandidateBackgroundStyle(isNative=useNative) = 
  if isNative then baseParams("键盘区背景") else fileImage("键盘区背景");

// 纵向候选面板底部按钮前景
local verticalForegroundStyle = baseParams("功能键前景");

// 符号角标样式
local fullStyle(theme) = {
  fullStyle: {
    buttonStyleType: "text",
    text: "全",
    fontSize: 10,
    fontWeight: "light",
    center: baseParams("符号角标前景偏移")
  } + utils.getColor({
    light: {
      normalColor: "57575791",
      highlightColor: "feffff",
    },
    dark: {
      normalColor: "fefefe66",
      highlightColor: "feffff",
    }
  }, theme)
};
local halfStyle(theme) = {
  halfStyle: {
    buttonStyleType: "text",
    text: "半",
    fontSize: 10,
    fontWeight: "light",
    center: baseParams("符号角标前景偏移")
  } + utils.getColor({
    light: {
      normalColor: "57575791",
      highlightColor: "feffff",
    },
    dark: {
      normalColor: "fefefe66",
      highlightColor: "feffff",
    }
  }, theme)
};


{
  baseParams: baseParams,
  fileImage: fileImage,
  fullStyle: fullStyle,
  halfStyle: halfStyle,

  candidateStateButtonBackgroundStyle: candidateStateButtonBackgroundStyle,
  candidateContextMenuStyleName: candidateContextMenuStyleName,
  candidateStateButtonStyleName: candidateStateButtonStyleName,
  toolbarButtonBackgroundStyleName: toolbarButtonBackgroundStyleName,
  toolbarButtonRealBackgroundStyleName: toolbarButtonRealBackgroundStyleName,

  verticalForegroundStyle: verticalForegroundStyle,
  candidateStateButtonSeparatorForegroundStyle: candidateStateButtonSeparatorForegroundStyle,
  candidateStateButtonSeparatorForegroundStyleName: candidateStateButtonSeparatorForegroundStyleName,
  verticalCandidateBackgroundStyle: verticalCandidateBackgroundStyle(),
  returnPrimaryKeyboardButtonForegroundStyle: returnPrimaryKeyboardButtonForegroundStyle(),
  candidateStateButtonForegroundStyle: candidateStateButtonForegroundStyle(),
  candidatesStyle: candidatesStyle,
  toolbarButtonImageForegroundStyle: toolbarButtonImageForegroundStyle(),
  toolbarButtonTextForegroundStyle: toolbarButtonTextForegroundStyle(),
  toolbarButtonRealBackgroundStyle: toolbarButtonRealBackgroundStyle,

  newSystemButtonImageForegroundStyle: newSystemButtonImageForegroundStyle,
  newSystemButtonTextForegroundStyle: newSystemButtonTextForegroundStyle,
  newBlueButtonImageForegroundStyle: newBlueButtonImageForegroundStyle,
  newBlueButtonTextForegroundStyle: newBlueButtonTextForegroundStyle,
  alphabeticButtonForegroundStyle: alphabeticButtonForegroundStyle,
  uppercasedStateForegroundStyle: uppercasedStateForegroundStyle,
  capsLockedStateForegroundStyle: capsLockedStateForegroundStyle,
  alphabeticButtonHintForegroundStyle: alphabeticButtonHintForegroundStyle,
  newAlphabeticButtonUpForegroundStyle: newAlphabeticButtonUpForegroundStyle,
  newAlphabeticButtonDownForegroundStyle: newAlphabeticButtonDownForegroundStyle,
  newAlphabeticButtonHintSymbolsForegroundStyle: newAlphabeticButtonHintSymbolsForegroundStyle,

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