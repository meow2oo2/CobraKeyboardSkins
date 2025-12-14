// lib/processors/toolbarBlock.libsonnet

local Imports = import "../imports.libsonnet";
local utils = import "../utils.libsonnet";
local buttonStyle = Imports.buttonStyle;

local toolbar_legacy = import "toolbar_legacy.libsonnet";
local candidatesBlock = import "candidatesBlock.libsonnet";

local toolbarBackgroundStyleName = buttonStyle.toolbarBackgroundStyleName;
local toolbarButtonRealBackgroundStyleName = buttonStyle.toolbarButtonRealBackgroundStyleName;

function(app, device, orientation, theme, params, overrides={}, toolbarCase="case1", candidateCase=true, toolbarButtonCount=Imports.toolbarAction.toolbarButtonCount) 

  local mainToolbar = { 
    toolbarStyle: {
      // insets: std.get(Imports.baseParam.inner,"工具栏区内距", {}),
      backgroundStyle: toolbarBackgroundStyleName
    },
    local toolbarLayoutCase1 = [
        {
          HStack: {
            subviews: [
              { Cell: "primaryButton" },
              { Cell: "horizontalPlaceholderButton"},
              { Cell: "horizontalSymbolsCollection"},
              { Cell: "dismissKeyboardButton" },
            ],
          },
        }, 
    ],
    local toolbarLayoutCase2 = [
        {
          HStack: {
            subviews: [
              { Cell: "primaryButton" },
              { Cell: "horizontalSymbolsCollection"},
              { Cell: "dismissKeyboardButton" },
            ],
          },
        }, 
    ],
    local toolbarLayoutCase3 = [
        {
          HStack: {
            subviews: [
              { Cell: "primaryButton"}
            ] + [
              { Cell: "toolbarButtonStyle" + (i + 1) },
              for i in std.range(2, std.min(std.length(params), 7) - 1)
            ] + [
              { Cell: "dismissKeyboardButton" }
            ],
          },
        }, 
    ], // 和case1一样, 但是可以加动画
    [toolbarBackgroundStyleName]: 
      buttonStyle.newToolbarBackgroundStyle(app, theme),
    toolbarLayout: 
      if toolbarCase == "case1" then toolbarLayoutCase1 
      else if toolbarCase == "case2" then toolbarLayoutCase2
      else if toolbarCase == "case3" then toolbarLayoutCase3
      else error "no such this toolbarCase",
  };
  

  // local toolbarButtonCount = Imports.toolbarAction.toolbarButtonCount; 
  local horizontalSymbolsCollectionStyle = {
    horizontalSymbolsCollection: {
      type: "horizontalSymbols",
      size: { width: "available" },
      maxColumns: toolbarButtonCount,
      contentRightToLeft: if (std.length(params) - 2) < toolbarButtonCount then true else false,
      insets: { left: 1, right: 1 },
      dataSource: "horizontalSymbolsDataSource",
      animation: Imports.animation.setCskinAnimationName,
      // backgroundStyle: "toolbarBackgroundStyle",
      // cellStyle: "collectionCellStyle"
    },
    horizontalSymbolsDataSource: [
      { label: (i + 1), action: params[i].action, styleName: "toolbarButtonStyle"+ (i + 1) }
      for i in std.range(2, std.length(params) - 1)
    ]
  };

  local toolbarSubclassStyle = std.foldl(
    function(acc, i) (
      local currentComponents = {
        ["toolbarButtonStyle" + (i + 1)]: {
          backgroundStyle: toolbarButtonRealBackgroundStyleName, 
          foregroundStyle: [
            "toolbarButtonForegroundStyle" + (i + 1)
          ]
        } + (if toolbarCase == "case3" then {
          animation: Imports.animation.setCskinAnimationName,
          action: params[i].action
        } else {}) ,
        ["toolbarButtonForegroundStyle" + (i + 1)]: utils.newAutoStyle(
          (if utils.objectHasAtPath(params[i], ["label", "systemImageName"]) then 
            buttonStyle.toolbarButtonImageForegroundStyle
          else buttonStyle.toolbarButtonTextForegroundStyle)
          + utils.getKeyboardActionText(params[i], style="label"), app, theme)
      };
      acc + currentComponents
    ),
    std.range(2, std.length(params) - 1),
    {}
  ) +
  {
    [toolbarButtonRealBackgroundStyleName]: utils.newAutoStyle(buttonStyle.toolbarButtonRealBackgroundStyle, app, theme),
    dismissKeyboardButton: {
      size: Imports.getSize(device, orientation, "toolbarButtonSize").size,
      backgroundStyle: toolbarButtonRealBackgroundStyleName, 
      foregroundStyle: [
        "dismissKeyboardButtonForegroundStyle"
      ],
      action: params[1].action,
      animation: Imports.animation.setCskinAnimationName,
    },
    dismissKeyboardButtonForegroundStyle: utils.newAutoStyle(
          (if utils.objectHasAtPath(params[1], ["label", "systemImageName"]) then 
            buttonStyle.toolbarButtonImageForegroundStyle
          else buttonStyle.toolbarButtonTextForegroundStyle)
          + utils.getKeyboardActionText(params[1], style="label"), app, theme),
    primaryButton: {
      size: Imports.getSize(device, orientation, "toolbarButtonSize").size,
      backgroundStyle: toolbarButtonRealBackgroundStyleName, 
      foregroundStyle: [
        "primaryButtonForegroundStyle"
      ],
      action: params[0].action,
      animation: Imports.animation.setCskinAnimationName,
    },
    primaryButtonForegroundStyle: utils.newAutoStyle(
          (if utils.objectHasAtPath(params[0], ["label", "systemImageName"]) then 
            buttonStyle.toolbarButtonImageForegroundStyle
          else buttonStyle.toolbarButtonTextForegroundStyle)
          + utils.getKeyboardActionText(params[0], style="label"), app, theme)
  } + (if toolbarCase == "case1" then {
    horizontalPlaceholderButton: {
      size: { width: "1/8" },
      action: "none"
    }} else {} ) + overrides;


if app=="cskin" then
mainToolbar
+ ( if toolbarCase != "case3" then horizontalSymbolsCollectionStyle else {} )
+ toolbarSubclassStyle
+ candidatesBlock(app, device, orientation, theme, candidateCase)
else if app=="hskin" then toolbar_legacy(app, device, orientation, theme, params, overrides)
else {}
