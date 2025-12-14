// lib/processors/keyboardBlock.libsonnet

local Imports = import "../imports.libsonnet";
local utils = import "../utils.libsonnet";
local buttonStyle = Imports.buttonStyle;


local newAlphabeticButton(app, device, orientation, theme, name, params={}, needHint=true, isUppercase=true) = 
  local foregroundStyleLower = if std.objectHas(params, "foregroundStyleLower") then params.foregroundStyleLower else [];
  local mainConfig = std.prune({
    [name]: {
      size: Imports.getSize(device, orientation, "default").size,
      [if app=="cskin" then "animation"]: Imports.animation.setCskinAnimationName, 
      backgroundStyle: buttonStyle.alphabeticButtonBackgroundStyleName,
      foregroundStyle: foregroundStyleLower + [
        if std.objectHas(params, "foregroundStyleName") then params.foregroundStyleName 
          else (name + "ForegroundStyle"),
        if std.objectHas(params, "swipeUpAction") then (name + "UpForegroundStyle"),
        if std.objectHas(params, "swipeDownAction") then (name + "DownForegroundStyle")
      ],
      [if std.objectHas(params, "uppercasedStateAction") then "uppercasedStateForegroundStyle"]: foregroundStyleLower + [
        if std.objectHas(params, "uppercasedStateForegroundStyleName") then params.uppercasedStateForegroundStyleName else (name + "UppercaseStateForegroundStyle"),
        if std.objectHas(params, "swipeUpAction") then (name + "UpForegroundStyle"),
        if std.objectHas(params, "swipeDownAction") then (name + "DownForegroundStyle")
      ],
      [if std.objectHas(params, "uppercasedStateAction") then "capsLockedStateForegroundStyle"]: foregroundStyleLower + [
        if std.objectHas(params, "capsLockedStateForegroundStyleName") then params.capsLockedStateForegroundStyleName else (name + "CapsLockedStateForegroundStyle"),
        if std.objectHas(params, "swipeUpAction") then (name + "UpForegroundStyle"),
        if std.objectHas(params, "swipeDownAction") then (name + "DownForegroundStyle")
      ],
      [if needHint then "hintStyle"]: name + "HintStyle",
      [if app=="cskin" && std.objectHas(params, "actions") then "hintSymbolsStyle"
        else if app=="hskin" && std.objectHas(params, "actions") then "holdSymbolsStyle" ]: name + "HintSymbolsStyle"
    } 
    + utils.extractProperties(params, std.prune([
      "size",
      "bounds",
      "backgroundStyle",
      "foregroundStyle",
      "uppercasedStateForegroundStyle",
      "capsLockedStateForegroundStyle",
      "action",
      "uppercasedStateAction",
      "preeditStateAction",
      "swipeUpAction",
      "swipeDownAction",
    ] + (if app=="cskin" then ["animation","notification"] else [])
      + (if app=="hskin" then ["swipeLeftAction","swipeRightAction"] else [])
    ))
  });

  local getForeAnimation = if app=="hskin" then { animation: Imports.animation.setHskinForegroundAnimationName } else {};
  local foregroundStyleConfig = std.mergePatch({ 
    [if utils.objectHasAtPath(mainConfig, [name, "foregroundStyle"]) then (name + "ForegroundStyle")]: 
      utils.newAutoStyle(buttonStyle.alphabeticButtonForegroundStyle(name)
      + utils.getKeyboardActionText(params, style="foregroundStyleLabel", isUppercase=isUppercase)
      + utils.getColor(params, theme), app, theme) + getForeAnimation, // getColor有个雷点, 传入图片样式会error, 后续优化

    [if utils.objectHasAtPath(mainConfig, [name, "uppercasedStateForegroundStyle"]) then (name + "UppercaseStateForegroundStyle")]: 
      utils.newAutoStyle(buttonStyle.uppercasedStateForegroundStyle(name) 
      + utils.getKeyboardActionText(params, "uppercasedStateAction", "uppercasedStateForegroundStyleLabel")
      + utils.getColor(params, theme), app, theme) + getForeAnimation,

    [if utils.objectHasAtPath(mainConfig, [name, "capsLockedStateForegroundStyle"]) then (name + "CapsLockedStateForegroundStyle")]: 
      utils.newAutoStyle(buttonStyle.capsLockedStateForegroundStyle(name)
      + utils.getKeyboardActionText(params, "uppercasedStateAction", "capsLockedStateForegroundStyleLabel")
      + utils.getColor(params, theme), app, theme) + getForeAnimation,

    [if utils.objectHasAtPath(mainConfig, [name, "swipeUpAction"]) then (name + "UpForegroundStyle")]: 
      utils.newAutoStyle(buttonStyle.newAlphabeticButtonUpForegroundStyle
      + utils.getKeyboardActionText(params, "swipeUpAction", "swipeUpForegroundStyle"), app, theme ) 
      + getForeAnimation,

    [if utils.objectHasAtPath(mainConfig, [name, "swipeDownAction"]) then (name + "DownForegroundStyle")]: 
      utils.newAutoStyle(buttonStyle.newAlphabeticButtonDownForegroundStyle
      + utils.getKeyboardActionText(params, "swipeDownAction", "swipeDownForegroundStyle"), app, theme )
      + getForeAnimation,
  },
  utils.extractProperties(params, [
    name + "ForegroundStyle",
    name + "UppercaseStateForegroundStyle",
    name + "CapsLockedStateForegroundStyle",
    name + "UpForegroundStyle",
    name + "DownForegroundStyle",
  ])); // params无论有没有白名单的属性, 都会先生成对应的foregroundStyle再合并, 这里先不优化, 下面相似处也是

  local hintForegroundLowerStyle = if std.objectHas(params, "hintForegroundLowerStyle") then params.hintForegroundLowerStyle else [];
  local mainHintConfig = if needHint then std.prune({ 
    [name + "HintStyle"]: {
      [if app=="cskin" then "size"]: Imports.getSize(device, orientation, "hintStyleSize").size,
      backgroundStyle: buttonStyle.hintBackgroundStyleName,
      foregroundStyle: hintForegroundLowerStyle + [name + "HintForegroundStyle"],
      [if std.objectHas(params, "swipeUpAction") then "swipeUpForegroundStyle"]: 
        hintForegroundLowerStyle + [name + "SwipeUpHintForegroundStyle"] 
        + utils.extraSymbolBadgeStyle(params.swipeUpAction),
      [if std.objectHas(params, "swipeDownAction") then "swipeDownForegroundStyle"]: 
        hintForegroundLowerStyle + [name + "SwipeDownHintForegroundStyle"] 
        + utils.extraSymbolBadgeStyle(params.swipeDownAction),
    } + (
    if std.objectHas(params, "hintStyle") then params.hintStyle else {}
    )
  }) else {};

  local hintForegroundStyleConfig = std.mergePatch({ 
    [if utils.objectHasAtPath(mainHintConfig, [name + "HintStyle", "foregroundStyle"]) then (name + "HintForegroundStyle")]: 
      utils.newAutoStyle(buttonStyle.alphabeticButtonHintForegroundStyle(name) 
      + utils.getKeyboardActionText(params, "uppercasedStateAction", "hintForegroundStyle")
      + utils.getColor(params, theme), app, theme),

    [if utils.objectHasAtPath(mainHintConfig, [name + "HintStyle", "swipeUpForegroundStyle"]) then (name + "SwipeUpHintForegroundStyle")]:  
      utils.newAutoStyle(buttonStyle.alphabeticButtonHintForegroundStyle(name) 
      + utils.getKeyboardActionText(params, "swipeUpAction", "swipeUpHintForegroundStyle"), app, theme),

    [if utils.objectHasAtPath(mainHintConfig, [name + "HintStyle", "swipeDownForegroundStyle"]) then (name + "SwipeDownHintForegroundStyle")]:  
      utils.newAutoStyle(buttonStyle.alphabeticButtonHintForegroundStyle(name) 
      + utils.getKeyboardActionText(params, "swipeDownAction", "swipeDownHintForegroundStyle"), app, theme),
  },
  utils.extractProperties(params, [
    name + "HintForegroundStyle",
    name + "SwipeUpHintForegroundStyle",
    name + "SwipeDownHintForegroundStyle",
  ])); // params无论有没有白名单的属性, 都会先生成对应的foregroundStyle再<深度合并>, 后面再看

  local hintSymbolsCount = if std.objectHas(params, "selectedIndex") then std.range(0, std.length(params.actions) - 1) else [];
  local mainHintSymbolsConfig = {
    [if utils.objectHasAtPath(mainConfig, [name, "hintSymbolsStyle"]) then (name + "HintSymbolsStyle")]: {
      size: Imports.getSize(device, orientation, "hintSymbolsSize").size,
      insets: buttonStyle.baseParams("长按符号列表内距"),
      backgroundStyle: buttonStyle.hintSymbolsBackgroundStyleName,
      selectedBackgroundStyle: buttonStyle.hintSymbolsSelectedBackgroundStyleName,
      selectedIndex: params.selectedIndex,
      symbolStyles: [
        name + "HintSymbolsSubclassStyle" + (i + 1)
        for i in hintSymbolsCount
      ],
    } + (
      if std.objectHas(params, "hintSymbols") then params.hintSymbols else {}
    )
  };

  local hintSymbolsForegroundLowerStyle = if std.objectHas(params, "hintSymbolsForegroundLowerStyle") then params.hintSymbolsForegroundLowerStyle else [];
  local hintSymbolsSubcalssStyleConfig = {
    [name + "HintSymbolsSubclassStyle" + (i + 1)]: {
      local action = params.actions[i].action,
      foregroundStyle: 
        hintSymbolsForegroundLowerStyle + [name + "HintSymbolsForegroundStyle" + (i + 1)]
        + utils.extraSymbolBadgeStyle(action),
      action: action
    }
    for i in hintSymbolsCount
  };

  local hintSymbolsForegroundStyleConfig = std.mergePatch({
    [name + "HintSymbolsForegroundStyle" + (i + 1)]: 
      utils.newAutoStyle(buttonStyle.newAlphabeticButtonHintSymbolsForegroundStyle
      + utils.getKeyboardActionText(params.actions[i], style="label"), app, theme),
    for i in hintSymbolsCount
  },
  utils.extractProperties(params, [
    name + "HintSymbolsForegroundStyle" + (i + 1)
    for i in hintSymbolsCount
  ]));

  local mainHoldSymbolsConfig = {
    [if utils.objectHasAtPath(mainConfig, [name, "holdSymbolsStyle"]) then (name + "HintSymbolsStyle")]: {
      insets: buttonStyle.baseParams("长按符号列表内距"),
      backgroundStyle: buttonStyle.hintSymbolsBackgroundStyleName,
      selectedStyle: buttonStyle.hintSymbolsSelectedBackgroundStyleName,
      selectedIndex: params.selectedIndex,
      symbolWidth: params.symbolWidth,
      actions: [i.action for i in params.actions],
      foregroundStyle: [
        name + "HintSymbolsForegroundStyle" + (i + 1)
        for i in hintSymbolsCount
      ],
    } + (
      if std.objectHas(params, "holdSymbols") then params.holdSymbols else {}
    )
  };

  if app=="cskin" then mainConfig + foregroundStyleConfig + mainHintConfig + hintForegroundStyleConfig + mainHintSymbolsConfig + hintSymbolsSubcalssStyleConfig + hintSymbolsForegroundStyleConfig
  else if app=="hskin" then mainConfig + foregroundStyleConfig + mainHintConfig + hintForegroundStyleConfig + mainHoldSymbolsConfig + hintSymbolsForegroundStyleConfig
  else {};



local newSystemButton(app, device, orientation, theme, name, params={}, needHint=false, needUpper=false, needSwipeStyle=false) = 
  local foregroundStyleLower = if std.objectHas(params, "foregroundStyleLower") then params.foregroundStyleLower else [];
  local mainConfig = std.prune({
    [name]: {
      size: Imports.getSize(device, orientation, "default").size,
      [if app=="cskin" then "animation"]: Imports.animation.setCskinAnimationName, 
      backgroundStyle: buttonStyle.systemButtonBackgroundStyleName,//sys
      foregroundStyle: foregroundStyleLower + [
        if std.objectHas(params, "foregroundStyleName") then params.foregroundStyleName 
          else (name + "ForegroundStyle"),
        if needSwipeStyle && std.objectHas(params, "swipeUpAction") then (name + "UpForegroundStyle"),
        if needSwipeStyle && std.objectHas(params, "swipeDownAction") then (name + "DownForegroundStyle")
      ],
      [if needUpper then "uppercasedStateForegroundStyle"]: foregroundStyleLower + [
        if std.objectHas(params, "uppercasedStateForegroundStyleName") then params.uppercasedStateForegroundStyleName else (name + "UppercaseStateForegroundStyle"),
        if needSwipeStyle && std.objectHas(params, "swipeUpAction") then (name + "UpForegroundStyle"),
        if needSwipeStyle && std.objectHas(params, "swipeDownAction") then (name + "DownForegroundStyle")
      ],
      [if needUpper then "capsLockedStateForegroundStyle"]: foregroundStyleLower + [
        if std.objectHas(params, "capsLockedStateForegroundStyleName") then params.capsLockedStateForegroundStyleName else (name + "CapsLockedStateForegroundStyle"),
        if needSwipeStyle && std.objectHas(params, "swipeUpAction") then (name + "UpForegroundStyle"),
        if needSwipeStyle && std.objectHas(params, "swipeDownAction") then (name + "DownForegroundStyle")
      ],
      [if needHint then "hintStyle"]: name + "HintStyle",
      [if app=="cskin" && std.objectHas(params, "actions") then "hintSymbolsStyle"
        else if app=="hskin" && std.objectHas(params, "actions") then "holdSymbolsStyle" ]: name + "HintSymbolsStyle"
    } + utils.extractProperties(params, std.prune([
      "size",
      "bounds",
      "backgroundStyle",
      "foregroundStyle",
      "uppercasedStateForegroundStyle",
      "capsLockedStateForegroundStyle",
      "action",
      "uppercasedStateAction",
      "preeditStateAction",
      "repeatAction",
      "swipeUpAction",
      "swipeDownAction",
    ] + (if app == "cskin" then ["animation", "notification"] else [])
      + (if app=="hskin" then ["swipeLeftAction","swipeRightAction"] else [])
    ))
  });

  local getForeAnimation = if app=="hskin" then { animation: Imports.animation.setHskinForegroundAnimationName } else {};
  local foregroundStyleConfig = std.mergePatch({ 
    [if utils.objectHasAtPath(mainConfig, [name, "foregroundStyle"]) then (name + "ForegroundStyle")]:
      utils.newAutoStyle(
        (if utils.objectHasAtPath(params, ["foregroundStyleLabel", "systemImageName"]) then buttonStyle.newSystemButtonImageForegroundStyle(name)
        else buttonStyle.newSystemButtonTextForegroundStyle(name))
      + utils.getKeyboardActionText(params, style="foregroundStyleLabel")
      + utils.getColor(params, theme), app, theme) + getForeAnimation, // getColor有个雷点, 传入图片样式会error, 后续优化

    [if utils.objectHasAtPath(mainConfig, [name, "uppercasedStateForegroundStyle"]) then (name + "UppercaseStateForegroundStyle")]: 
      utils.newAutoStyle(
        (if utils.objectHasAtPath(params, ["uppercasedStateForegroundStyleLabel", "systemImageName"]) then buttonStyle.newSystemButtonImageForegroundStyle(name)
        else buttonStyle.newSystemButtonTextForegroundStyle(name))
      + utils.getKeyboardActionText(params, "uppercasedStateAction", "uppercasedStateForegroundStyleLabel")
      + utils.getColor(params, theme), app, theme) + getForeAnimation,

    [if utils.objectHasAtPath(mainConfig, [name, "capsLockedStateForegroundStyle"]) then (name + "CapsLockedStateForegroundStyle")]:  
      utils.newAutoStyle(
        (if utils.objectHasAtPath(params, ["capsLockedStateForegroundStyleLabel", "systemImageName"]) then buttonStyle.newSystemButtonImageForegroundStyle(name)
        else buttonStyle.newSystemButtonTextForegroundStyle(name))
      + utils.getKeyboardActionText(params, "uppercasedStateAction", "capsLockedStateForegroundStyleLabel")
      + utils.getColor(params, theme), app, theme) + getForeAnimation,

    [if utils.objectHasAtPath(mainConfig, [name, "swipeUpAction"]) then (name + "UpForegroundStyle")]: 
      utils.newAutoStyle(buttonStyle.newAlphabeticButtonUpForegroundStyle
      + utils.getKeyboardActionText(params, "swipeUpAction", "swipeUpForegroundStyle"), app, theme ) 
      + getForeAnimation,

    [if utils.objectHasAtPath(mainConfig, [name, "swipeDownAction"]) then (name + "DownForegroundStyle")]: 
      utils.newAutoStyle(buttonStyle.newAlphabeticButtonDownForegroundStyle
      + utils.getKeyboardActionText(params, "swipeDownAction", "swipeDownForegroundStyle"), app, theme )
      + getForeAnimation,
  },
  utils.extractProperties(params, [
    name + "ForegroundStyle",
    name + "UppercaseStateForegroundStyle",
    name + "CapsLockedStateForegroundStyle",
    name + "UpForegroundStyle",
    name + "DownForegroundStyle",
  ]));
  
  local hintForegroundLowerStyle = if std.objectHas(params, "hintForegroundLowerStyle") then params.hintForegroundLowerStyle else [];
  local mainHintConfig = if needHint then std.prune({ 
    [name + "HintStyle"]: {
      [if app=="cskin" then "size"]: Imports.getSize(device, orientation, "hintStyleSize").size,
      [if std.objectHas(params, "swipeUpAction") then "swipeUpForegroundStyle"]: [buttonStyle.hintBackgroundStyleName] + hintForegroundLowerStyle + [name + "SwipeUpHintForegroundStyle"], 
      [if std.objectHas(params, "swipeDownAction") then "swipeDownForegroundStyle"]: [buttonStyle.hintBackgroundStyleName] + hintForegroundLowerStyle + [name + "SwipeDownHintForegroundStyle"]
    } + (
    if std.objectHas(params, "hintStyle") then params.hintStyle else {}
    )
  }) else {};

  local hintForegroundStyleConfig = std.mergePatch({ 
    [if utils.objectHasAtPath(mainHintConfig, [name + "HintStyle", "swipeUpForegroundStyle"]) then (name + "SwipeUpHintForegroundStyle")]:  
      utils.newAutoStyle(buttonStyle.alphabeticButtonHintForegroundStyle(name) 
      + utils.getKeyboardActionText(params, "swipeUpAction", "SwipeUpHintForegroundStyle"), app, theme),
    [if utils.objectHasAtPath(mainHintConfig, [name + "HintStyle", "swipeDownForegroundStyle"]) then (name + "SwipeDownHintForegroundStyle")]:   
      utils.newAutoStyle(buttonStyle.alphabeticButtonHintForegroundStyle(name) 
      + utils.getKeyboardActionText(params, "swipeDownAction", "SwipeDownHintForegroundStyle"), app, theme),
  },
  utils.extractProperties(params, [
    name + "SwipeUpHintForegroundStyle",
    name + "SwipeDownHintForegroundStyle",
  ]));

  local hintSymbolsCount = if std.objectHas(params, "selectedIndex") then std.range(0, std.length(params.actions) - 1) else [];
  local mainHintSymbolsConfig = {
    [if utils.objectHasAtPath(mainConfig, [name, "hintSymbolsStyle"]) then (name + "HintSymbolsStyle")]: {
      size: Imports.getSize(device, orientation, "hintSymbolsSize").size,
      insets: buttonStyle.baseParams("长按符号列表内距"),
      backgroundStyle: buttonStyle.hintSymbolsBackgroundStyleName,
      selectedBackgroundStyle: buttonStyle.hintSymbolsSelectedBackgroundStyleName,
      selectedIndex: params.selectedIndex,
      symbolStyles: [
        name + "HintSymbolsSubclassStyle" + (i + 1)
        for i in hintSymbolsCount
      ],
    } + (
      if std.objectHas(params, "hintSymbols") then params.hintSymbols else {}
    )
  };

  local hintSymbolsForegroundLowerStyle = if std.objectHas(params, "hintSymbolsForegroundLowerStyle") then params.hintSymbolsForegroundLowerStyle else [];
  local hintSymbolsSubcalssStyleConfig = {
    [name + "HintSymbolsSubclassStyle" + (i + 1)]: {
      foregroundStyle: hintSymbolsForegroundLowerStyle + [name + "HintSymbolsForegroundStyle" + (i + 1)],
      action: params.actions[i].action
    }
    for i in hintSymbolsCount
  };

  local hintSymbolsForegroundStyleConfig = std.mergePatch({
    [name + "HintSymbolsForegroundStyle" + (i + 1)]: 
      utils.newAutoStyle(buttonStyle.newAlphabeticButtonHintSymbolsForegroundStyle
      + utils.getKeyboardActionText(params.actions[i], style="label"), app, theme),
    for i in hintSymbolsCount
  },
  utils.extractProperties(params, [
    name + "HintSymbolsForegroundStyle" + (i + 1)
    for i in hintSymbolsCount
  ]));

  local mainHoldSymbolsConfig = {
    [if utils.objectHasAtPath(mainConfig,[name, "holdSymbolsStyle"]) then (name + "HintSymbolsStyle")]: {
      insets: buttonStyle.baseParams("长按符号列表内距"),
      backgroundStyle: buttonStyle.hintSymbolsBackgroundStyleName,
      selectedStyle: buttonStyle.hintSymbolsSelectedBackgroundStyleName,
      selectedIndex: params.selectedIndex,
      symbolWidth: params.symbolWidth,
      actions: [i.action for i in params.actions],
      foregroundStyle: [
        name + "HintSymbolsForegroundStyle" + (i + 1)
        for i in hintSymbolsCount
      ],
    } + (
      if std.objectHas(params, "holdSymbols") then params.holdSymbols else {}
    )
  };

  if app=="cskin" then mainConfig + foregroundStyleConfig + mainHintConfig + hintForegroundStyleConfig + mainHintSymbolsConfig + hintSymbolsSubcalssStyleConfig + hintSymbolsForegroundStyleConfig
  else if app=="hskin" then mainConfig + foregroundStyleConfig + mainHintConfig + hintForegroundStyleConfig + mainHoldSymbolsConfig + hintSymbolsForegroundStyleConfig
  else {};





{ //bj
  newAlphabeticButton: newAlphabeticButton,
  newSystemButton: newSystemButton
}