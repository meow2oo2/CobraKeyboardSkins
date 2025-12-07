// lib/processors/keyboardBlock.libsonnet

local Imports = import "../imports.libsonnet";
local utils = import "../utils.libsonnet";
local baseStyle = Imports.baseStyle;


local newAlphabeticButton(app, device, orientation, theme, name, params={}, needHint=true, isUppercase=true) = 
  local foregroundStyleLower = if std.objectHas(params, "foregroundStyleLower") then params.foregroundStyleLower else [];
  local mainConfig = std.prune({
    [name]: {
      size: Imports.getSize(device, orientation, "default").size,
      [if app=="cskin" then "animation"]: Imports.animation.setCskinAnimationName, 
      backgroundStyle: baseStyle().alphabeticButtonBackgroundStyleName,
      foregroundStyle: foregroundStyleLower + [
        name + "ForegroundStyle", 
        if std.objectHas(params, "swipeUpAction") then (name + "UpForegroundStyle"),
        if std.objectHas(params, "swipeDownAction") then (name + "DownForegroundStyle")
      ],
      [if std.objectHas(params, "uppercasedStateAction") then "uppercasedStateForegroundStyle"]: foregroundStyleLower + [
        name + "UppercaseStateForegroundStyle",
        if std.objectHas(params, "swipeUpAction") then (name + "UpForegroundStyle"),
        if std.objectHas(params, "swipeDownAction") then (name + "DownForegroundStyle")
      ],
      [if std.objectHas(params, "uppercasedStateAction") then "capsLockedStateForegroundStyle"]: foregroundStyleLower + [
        name + "CapsLockedStateForegroundStyle",
        if std.objectHas(params, "swipeUpAction") then (name + "UpForegroundStyle"),
        if std.objectHas(params, "swipeDownAction") then (name + "DownForegroundStyle")
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
      "swipeUpAction",
      "swipeDownAction",
    ] + (if app=="cskin" then ["animation","notification"] else [])
    ))
  });

  local getForeAnimation = if app=="hskin" then { animation: Imports.animation.setHskinForegroundAnimationName } else {};
  local foregroundStyleConfig = { 
    [if utils.objectHasAtPath(mainConfig, [name, "foregroundStyle"]) then (name + "ForegroundStyle")]: utils.newStyleFactory(
      (if std.objectHas(params, "setForegroundStyle") then params.setForegroundStyle
        else utils.getKeyboardActionText(params, isUppercase=isUppercase))
      + baseStyle(name).newAlphabeticButtonForegroundStyle
    )(app, device, orientation, theme, 
      params = utils.extractAtPaths(params, [[theme, "normalColor"], [theme, "highlightColor"]])) + getForeAnimation,
    [if utils.objectHasAtPath(mainConfig, [name, "uppercasedStateForegroundStyle"]) then (name + "UppercaseStateForegroundStyle")]: utils.newStyleFactory(
      (if std.objectHas(params, "setUppercaseStateForegroundStyle") then params.setUppercaseStateForegroundStyle
        else utils.getKeyboardActionText(params, "uppercasedStateAction"))
      + baseStyle(name).newAlphabeticButtonUppercaseForegroundStyle
    )(app, device, orientation, theme, 
      params = utils.extractAtPaths(params, [[theme, "normalColor"], [theme, "highlightColor"]])) + getForeAnimation,
    [if utils.objectHasAtPath(mainConfig, [name, "capsLockedStateForegroundStyle"]) then (name + "CapsLockedStateForegroundStyle")]: utils.newStyleFactory(
      (if std.objectHas(params, "setCapsLockedStateForegroundStyle") then params.setCapsLockedStateForegroundStyle
        else utils.getKeyboardActionText(params, "uppercasedStateAction"))
      + baseStyle(name).newAlphabeticButtonCapsLockedStateForegroundStyle
    )(app, device, orientation, theme, 
      params = utils.extractAtPaths(params, [[theme, "normalColor"], [theme, "highlightColor"]])) + getForeAnimation,
    [if utils.objectHasAtPath(mainConfig, [name, "swipeUpAction"]) then (name + "UpForegroundStyle")]: utils.newStyleFactory(
      (if std.objectHas(params, "setUpForegroundStyle") then params.setUpForegroundStyle
        else utils.getKeyboardActionText(params, "swipeUpAction"))
      + baseStyle(name).newAlphabeticButtonUpForegroundStyle
    )(app, device, orientation, theme), 
    [if utils.objectHasAtPath(mainConfig, [name, "swipeDownAction"]) then (name + "DownForegroundStyle")]: utils.newStyleFactory(
      (if std.objectHas(params, "setDownForegroundStyle") then params.setDownForegroundStyle
        else utils.getKeyboardActionText(params, "swipeDownAction"))
      + baseStyle(name).newAlphabeticButtonDownForegroundStyle
    )(app, device, orientation, theme),
  };

  local hintForegroundLowerStyle = if std.objectHas(params, "hintForegroundLowerStyle") then params.hintForegroundLowerStyle else [];
  local mainHintConfig = if needHint then std.prune({ 
    [name + "HintStyle"]: {
      [if app=="cskin" then "size"]: Imports.getSize(device, orientation, "hintStyleSize").size,
      backgroundStyle: baseStyle().hintBackgroundStyleName,
      foregroundStyle: [name + "HintForegroundStyle"],
      [if std.objectHas(params, "swipeUpAction") then "swipeUpForegroundStyle"]: 
        hintForegroundLowerStyle + [name + "SwipeUpHintForegroundStyle"] 
        + utils.addActionBadgeStyle(params.swipeUpAction),
      [if app=="hskin" && std.objectHas(params, "swipeDownAction") then "swipeDownForegroundStyle"]: 
        hintForegroundLowerStyle + [name + "SwipeDownHintForegroundStyle"] 
        + utils.addActionBadgeStyle(params.swipeDownAction),
    } + (
    if std.objectHas(params, "hintStyle") then params.hintStyle else {}
    )
  }) else {};

  local hintForegroundStyleConfig = { 
    [if utils.objectHasAtPath(mainHintConfig, [name + "HintStyle", "foregroundStyle"]) then (name + "HintForegroundStyle")]: utils.newStyleFactory(
      utils.getKeyboardActionText(params, isUppercase=true)
      + baseStyle(name).newAlphabeticButtonHintForegroundStyle
    )(app, device, orientation, theme),
    [if utils.objectHasAtPath(mainHintConfig, [name + "HintStyle", "swipeUpForegroundStyle"]) then (name + "SwipeUpHintForegroundStyle")]: utils.newStyleFactory(
      (if std.objectHas(params, "setUpForegroundStyle") then params.setUpForegroundStyle
        else utils.getKeyboardActionText(params, "swipeUpAction"))
      + baseStyle(name).newAlphabeticButtonHintForegroundStyle
    )(app, device, orientation, theme),
    [if app=="hskin" &&  utils.objectHasAtPath(mainHintConfig, [name + "HintStyle", "swipeDownForegroundStyle"]) then (name + "SwipeDownHintForegroundStyle")]: utils.newStyleFactory(
      (if std.objectHas(params, "setDownForegroundStyle") then params.setDownForegroundStyle
        else utils.getKeyboardActionText(params, "swipeDownAction"))
      + baseStyle(name).newAlphabeticButtonHintForegroundStyle
    )(app, device, orientation, theme),
  };

  local hintSymbolsCount = if std.objectHas(params, "selectedIndex") then std.range(0, std.length(params.actions) - 1) else [];
  local mainHintSymbolsConfig = {
    [if utils.objectHasAtPath(mainConfig, [name, "hintSymbolsStyle"]) then (name + "HintSymbolsStyle")]: {
      size: Imports.getSize(device, orientation, "hintSymbolsSize").size,
      insets: Imports.baseParam.inner["长按符号列表内距"],
      backgroundStyle: baseStyle().hintSymbolsBackgroundStyleName,
      selectedBackgroundStyle: baseStyle().hintSymbolsSelectedBackgroundStyleName,
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
        + utils.addActionBadgeStyle(action),
      action: action
    }
    for i in hintSymbolsCount
  };

  local hintSymbolsForegroundStyleConfig = {
    [name + "HintSymbolsForegroundStyle" + (i + 1)]: utils.newStyleFactory(
      utils.getKeyboardActionText(params.actions[i], style="label", isUppercase=true)
      + baseStyle(name).newAlphabeticButtonHintSymbolsForegroundStyle
    )(app, device, orientation, theme),
    for i in hintSymbolsCount
  };

  local mainHoldSymbolsConfig = {
    [if utils.objectHasAtPath(mainConfig, [name, "holdSymbolsStyle"]) then (name + "HintSymbolsStyle")]: {
      insets: Imports.baseParam.inner["长按符号列表内距"],
      backgroundStyle: baseStyle().hintSymbolsBackgroundStyleName,
      selectedStyle: baseStyle().hintSymbolsSelectedBackgroundStyleName,
      selectedIndex: params.selectedIndex,
      symbolWidth: params.symbolWidth,
      actions: params.actions,
      foregroundStyle: [
        name + "HintSymbolsForegroundStyle" + (i + 1)
        for i in hintSymbolsCount
      ],
    } + (
      if std.objectHas(params, "hintSymbols") then params.hintSymbols else {}
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
      backgroundStyle: baseStyle().systemButtonBackgroundStyleName,//sys
      foregroundStyle: foregroundStyleLower + [
        name + "ForegroundStyle", 
        if needSwipeStyle && std.objectHas(params, "swipeUpAction") then (name + "UpForegroundStyle"),
        if needSwipeStyle && std.objectHas(params, "swipeDownAction") then (name + "DownForegroundStyle")
      ],
      [if needUpper then "uppercasedStateForegroundStyle"]: foregroundStyleLower + [
        name + "UppercaseStateForegroundStyle",
        if needSwipeStyle && std.objectHas(params, "swipeUpAction") then (name + "UpForegroundStyle"),
        if needSwipeStyle && std.objectHas(params, "swipeDownAction") then (name + "DownForegroundStyle")
      ],
      [if needUpper then "capsLockedStateForegroundStyle"]: foregroundStyleLower + [
        name + "CapsLockedStateForegroundStyle",
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
  local foregroundStyleConfig = { 
    [if utils.objectHasAtPath(mainConfig, [name, "foregroundStyle"]) then (name + "ForegroundStyle")]: utils.newStyleFactory(
      (if std.objectHas(params, "setForegroundStyle") then params.setForegroundStyle
        else utils.getKeyboardActionText(params))
      + baseStyle(name).newSystemButtonForegroundStyle //sys
    )(app, device, orientation, theme, 
      params = utils.extractAtPaths(params, [[theme, "normalColor"], [theme, "highlightColor"]])) + getForeAnimation,
    [if utils.objectHasAtPath(mainConfig, [name, "uppercasedStateForegroundStyle"]) then (name + "UppercaseStateForegroundStyle")]: utils.newStyleFactory(
      (if std.objectHas(params, "setUppercaseStateForegroundStyle") then params.setUppercaseStateForegroundStyle
        else utils.getKeyboardActionText(params, "uppercasedStateAction"))
      + baseStyle(name).newSystemButtonForegroundStyle //sys
    )(app, device, orientation, theme, 
      params = utils.extractAtPaths(params, [[theme, "normalColor"], [theme, "highlightColor"]])) + getForeAnimation,
    [if utils.objectHasAtPath(mainConfig, [name, "capsLockedStateForegroundStyle"]) then (name + "CapsLockedStateForegroundStyle")]: utils.newStyleFactory(
      (if std.objectHas(params, "setCapsLockedStateForegroundStyle") then params.setCapsLockedStateForegroundStyle
        else utils.getKeyboardActionText(params, "uppercasedStateAction"))
      + baseStyle(name).newSystemButtonForegroundStyle //sys
    )(app, device, orientation, theme, 
      params = utils.extractAtPaths(params, [[theme, "normalColor"], [theme, "highlightColor"]])) + getForeAnimation,
    [if needSwipeStyle && utils.objectHasAtPath(mainConfig, [name, "swipeUpAction"]) then (name + "UpForegroundStyle")]: utils.newStyleFactory(
      (if std.objectHas(params, "setUpForegroundStyle") then params.setUpForegroundStyle
        else utils.getKeyboardActionText(params, "swipeUpAction"))
      + baseStyle(name).newAlphabeticButtonUpForegroundStyle//sys还没
    )(app, device, orientation, theme), 
    [if needSwipeStyle && utils.objectHasAtPath(mainConfig, [name, "swipeDownAction"]) then (name + "DownForegroundStyle")]: utils.newStyleFactory(
      (if std.objectHas(params, "setDownForegroundStyle") then params.setDownForegroundStyle
        else utils.getKeyboardActionText(params, "swipeDownAction"))
      + baseStyle(name).newAlphabeticButtonDownForegroundStyle//sys还没
    )(app, device, orientation, theme), 
  };
  
  local hintForegroundLowerStyle = if std.objectHas(params, "hintForegroundLowerStyle") then params.hintForegroundLowerStyle else [];
  local mainHintConfig = if needHint then std.prune({ 
    [name + "HintStyle"]: {
      [if app=="cskin" then "size"]: Imports.getSize(device, orientation, "hintStyleSize").size,
      [if std.objectHas(params, "swipeUpAction") then "swipeUpForegroundStyle"]: [baseStyle().hintBackgroundStyleName] + hintForegroundLowerStyle + [name + "SwipeUpHintForegroundStyle"], 
      [if app=="hskin" && std.objectHas(params, "swipeDownAction") then "swipeDownForegroundStyle"]: [baseStyle().hintBackgroundStyleName] + hintForegroundLowerStyle + [name + "SwipeDownHintForegroundStyle"]
    } + (
    if std.objectHas(params, "hintStyle") then params.hintStyle else {}
    )
  }) else {};

  local hintForegroundStyleConfig = { 
    [if utils.objectHasAtPath(mainHintConfig, [name + "HintStyle", "swipeUpForegroundStyle"]) then (name + "SwipeUpHintForegroundStyle")]: utils.newStyleFactory(
      (if std.objectHas(params, "setUpForegroundStyle") then params.setUpForegroundStyle
        else utils.getKeyboardActionText(params, "swipeUpAction"))
      + baseStyle(name).newAlphabeticButtonUpForegroundStyle
    )(app, device, orientation, theme),
    [if app=="hskin" &&  utils.objectHasAtPath(mainHintConfig, [name + "HintStyle", "swipeDownForegroundStyle"]) then (name + "SwipeDownHintForegroundStyle")]: utils.newStyleFactory(
      (if std.objectHas(params, "setDownForegroundStyle") then params.setDownForegroundStyle
        else utils.getKeyboardActionText(params, "swipeDownAction"))
      + baseStyle(name).newAlphabeticButtonDownForegroundStyle
    )(app, device, orientation, theme),
  };

  local hintSymbolsCount = if std.objectHas(params, "selectedIndex") then std.range(0, std.length(params.actions) - 1) else [];
  local mainHintSymbolsConfig = {
    [if utils.objectHasAtPath(mainConfig, [name, "hintSymbolsStyle"]) then (name + "HintSymbolsStyle")]: {
      size: Imports.getSize(device, orientation, "hintSymbolsSize").size,
      insets: Imports.baseParam.inner["长按符号列表内距"],
      backgroundStyle: baseStyle().hintSymbolsBackgroundStyleName,
      selectedBackgroundStyle: baseStyle().hintSymbolsSelectedBackgroundStyleName,
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

  local hintSymbolsForegroundStyleConfig = {
    [name + "HintSymbolsForegroundStyle" + (i + 1)]: utils.newStyleFactory(
      utils.getKeyboardActionText(params.actions[i], style="label")
      + baseStyle(name).newAlphabeticButtonHintSymbolsForegroundStyle
    )(app, device, orientation, theme),
    for i in hintSymbolsCount
  };

  local mainHoldSymbolsConfig = {
    [if utils.objectHasAtPath(mainConfig,[name, "holdSymbolsStyle"]) then (name + "HintSymbolsStyle")]: {
      insets: Imports.baseParam.inner["长按符号列表内距"],
      backgroundStyle: baseStyle().hintSymbolsBackgroundStyleName,
      selectedStyle: baseStyle().hintSymbolsSelectedBackgroundStyleName,
      selectedIndex: params.selectedIndex,
      symbolWidth: params.symbolWidth,
      actions: params.actions,
      foregroundStyle: [
        name + "HintSymbolsForegroundStyle" + (i + 1)
        for i in hintSymbolsCount
      ],
    } + (
      if std.objectHas(params, "hintSymbols") then params.hintSymbols else {}
    )
  };

  if app=="cskin" then mainConfig + foregroundStyleConfig + mainHintConfig + hintForegroundStyleConfig + mainHintSymbolsConfig + hintSymbolsSubcalssStyleConfig + hintSymbolsForegroundStyleConfig
  else if app=="hskin" then mainConfig + foregroundStyleConfig + mainHintConfig + hintForegroundStyleConfig + mainHoldSymbolsConfig + hintSymbolsForegroundStyleConfig
  else {};





{ //bj
  newAlphabeticButton: newAlphabeticButton,
  newSystemButton: newSystemButton
}