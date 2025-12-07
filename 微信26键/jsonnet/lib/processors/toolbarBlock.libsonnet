// lib/processors/toolbarBlock.libsonnet

local Imports = import "../imports.libsonnet";
local utils = import "../utils.libsonnet";
local baseStyle = (Imports.baseStyle)();
local toolbar_legacy = import "toolbar_legacy.libsonnet";
local candidatesBlock = import "candidatesBlock.libsonnet";

local toolbarBackgroundStyleName = baseStyle.toolbarBackgroundStyleName;
local toolbarButtonRealBackgroundStyleName = baseStyle.toolbarButtonRealBackgroundStyleName;

function(app, device, orientation, theme, params, overrides={}, toolbarCase=true, calCandidateCase=true, toolbarButtonCount=Imports.toolbarAction.toolbarButtonCount) 

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
              { Cell: "horizontalSymbolsCollection"},
              { Cell: "dismissKeyboardButton" },
            ],
          },
        }, 
    ],
    // local toolbarLayoutCase3 = [
    //     {
    //       HStack: {
    //         subviews: [
    //           { Cell: "primaryButton"}
    //         ] + [
    //           { Cell: "toolbarButton" + (i - 1) },
    //           for i in std.range(2, std.min(std.length(params), 7) - 1)
    //         ] + [
    //           { Cell: "dismissKeyboardButton" }
    //         ],
    //       },
    //     }, 
    // ], // 和case1一样,但是可以加动画
    [toolbarBackgroundStyleName]: 
      utils.newStyleFactory(baseStyle.newToolbarBackgroundStyle())(app, device, orientation, theme),
    toolbarLayout: if toolbarCase then toolbarLayoutCase1 else toolbarLayoutCase2,
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
        },
        ["toolbarButtonForegroundStyle" + (i + 1)]: utils.newStyleFactory(
          utils.getKeyboardActionText(params[i], style="label")
          + baseStyle.toolbarButtonForegroundStyle()
        )(app, device, orientation, theme)
      };
      acc + currentComponents
    ),
    std.range(2, std.length(params) - 1),
    {}
  ) +
  {
    [toolbarButtonRealBackgroundStyleName]: utils.newStyleFactory(baseStyle.toolbarButtonRealBackgroundStyle)(app, device, orientation, theme),
    dismissKeyboardButton: {
      size: Imports.getSize(device, orientation, "toolbarButtonSize").size,
      backgroundStyle: toolbarButtonRealBackgroundStyleName, 
      foregroundStyle: [
        "dismissKeyboardButtonForegroundStyle"
      ],
      action: params[1].action,
      animation: Imports.animation.setCskinAnimationName,
    },
    dismissKeyboardButtonForegroundStyle: utils.newStyleFactory(
      utils.getKeyboardActionText(params[1], style="label")
      + baseStyle.toolbarButtonForegroundStyle()
    )(app, device, orientation, theme),
  } + (if toolbarCase then {
    primaryButton: {
      size: Imports.getSize(device, orientation, "toolbarButtonSize").size,
      backgroundStyle: toolbarButtonRealBackgroundStyleName, 
      foregroundStyle: [
        "primaryButtonForegroundStyle"
      ],
      action: params[0].action,
      animation: Imports.animation.setCskinAnimationName,
    },
    horizontalPlaceholderButton: {
      size: { width: "1/8" },
      action: "none"
    },
    primaryButtonForegroundStyle: utils.newStyleFactory(
      utils.getKeyboardActionText(params[0], style="label")
      + baseStyle.toolbarButtonForegroundStyle()
    )(app, device, orientation, theme),
  } else {}) + overrides;


if app=="cskin" then
mainToolbar
+ horizontalSymbolsCollectionStyle
+ toolbarSubclassStyle
+ candidatesBlock(app, device, orientation, theme, calCandidateCase)
else if app=="hskin" then toolbar_legacy(app, device, orientation, theme, params, overrides)
else {}
