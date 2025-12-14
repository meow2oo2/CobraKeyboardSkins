// lib/processors/toolbar_legacy.libsonnet

local Imports = import "../imports.libsonnet";
local utils = import "../utils.libsonnet";
local buttonStyle = Imports.buttonStyle;

local toolbarBackgroundStyleName = buttonStyle.toolbarBackgroundStyleName;
local horizontalCandidateStyleName = 'horizontalCandidateStyle';
local verticalCandidateStyleName = 'verticalCandidateStyle';
local candidateContextMenuStyleName = buttonStyle.candidateContextMenuStyleName;
local candidateStateButtonStyleName = buttonStyle.candidateStateButtonStyleName;
local toolbarButtonBackgroundStyleName = buttonStyle.toolbarButtonBackgroundStyleName;
local toolbarButtonRealBackgroundStyleName = buttonStyle.toolbarButtonRealBackgroundStyleName;
local candidateStateButtonSeparatorForegroundStyleName = buttonStyle.candidateStateButtonSeparatorForegroundStyleName;
local verticalCandidateButtonBackgroundStyleName = buttonStyle.systemButtonBackgroundStyleName;

function(app, device, orientation, theme, params, overrides={}) 

  local mainToolbar = {
    toolbar: {
      backgroundStyle: toolbarBackgroundStyleName,
      primaryButtonStyle: "toolbarButtonStyle1",
      secondaryButtonStyle: [
        "toolbarButtonStyle"+ (i + 1)
        for i in std.range(1, std.min(std.length(params), 8) - 1)
      ],
      horizontalCandidateStyle: horizontalCandidateStyleName,
      verticalCandidateStyle: verticalCandidateStyleName,
      candidateContextMenu: candidateContextMenuStyleName
    },
    [toolbarBackgroundStyleName]: 
      buttonStyle.newToolbarBackgroundStyle(app, theme)
  };
  
  local toolbarButtonConfig = std.foldl(
    function(acc, i) (
      local currentComponents = {
        ["toolbarButtonStyle" + (i + 1)]: {
          backgroundStyle: toolbarButtonBackgroundStyleName, 
          foregroundStyle: [
            toolbarButtonRealBackgroundStyleName,
            "toolbarButtonForegroundStyle" + (i + 1)
          ],
          action: params[i].action
        },
        ["toolbarButtonForegroundStyle" + (i + 1)]: utils.newAutoStyle(
          (if utils.objectHasAtPath(params[i], ["label", "systemImageName"]) then 
            buttonStyle.toolbarButtonImageForegroundStyle
          else buttonStyle.toolbarButtonTextForegroundStyle)
          + utils.getKeyboardActionText(params[i], style="label"), app, theme)
      };
      acc + currentComponents
    ),
    std.range(0, std.min(std.length(params), 8) - 1),
    {}
  ) + 
  {
    [toolbarButtonBackgroundStyleName]: {type: "original", normalColor: "00000001"},
    [toolbarButtonRealBackgroundStyleName]: utils.newAutoStyle(buttonStyle.toolbarButtonRealBackgroundStyle, app, theme)
  } + overrides;

  local horizontalCandidateStyle = {
    [horizontalCandidateStyleName]: {
      insets: buttonStyle.baseParams("横向候选字区域内距"),
      candidateStateButtonStyle: candidateStateButtonStyleName,
      itemSpacing: buttonStyle.baseParams("纵横候选列表其他参数", "itemSpacing"),
    } + buttonStyle.candidatesStyle(theme),
    [candidateStateButtonStyleName]: {
      backgroundStyle: toolbarButtonBackgroundStyleName,
      foregroundStyle: [
        candidateStateButtonSeparatorForegroundStyleName,
        "candidateStateButtonForegroundStyle"
      ]
    },
    [candidateStateButtonSeparatorForegroundStyleName]: utils.newAutoStyle(
      buttonStyle.candidateStateButtonSeparatorForegroundStyle(theme), app, theme),
    candidateStateButtonForegroundStyle: 
      utils.newAutoStyle(buttonStyle.candidateStateButtonForegroundStyle, app, theme)
  };

  local verticalCandidateStyle = {
    [verticalCandidateStyleName]: {
      insets: buttonStyle.baseParams("纵向候选布局内距"), 
      bottomRowHeight: Imports.getSize(device, orientation, "verticalLastRowStyleSize").size,
      backgroundStyle: "verticalCandidateBackgroundStyle",
      candidateStyle: "verticalCandidateOfCandidateStyle",
      pageUpButtonStyle: "verticalCandidatePageUpButtonStyle",
      pageDownButtonStyle: "verticalCandidatePageDownButtonStyle",
      returnButtonStyle: "verticalCandidateReturnButtonStyle",
      backspaceButtonStyle: "verticalCandidateBackspaceButtonStyle",
    },
    verticalCandidateBackgroundStyle: 
      utils.newAutoStyle(buttonStyle.verticalCandidateBackgroundStyle, app, theme),

    verticalCandidateOfCandidateStyle: {
      insets: buttonStyle.baseParams("纵向候选字区域内距"),
      cornerRadius: buttonStyle.baseParams("纵横候选列表其他参数", "cornerRadius"),
    } 
    + buttonStyle.baseParams("纵向候选区域样式")[theme]
    + buttonStyle.candidatesStyle(theme),

  };

local verticalCandidateButtonStyles = 
  local candidateButtonTypes = ["PageUp", "PageDown", "Return", "Backspace"];
  local candidateButtonMappings = {
    "PageUp": {
      styleKeyNameSuffix: "PageUpButtonStyle",
      foregroundStyleKeyNameSuffix: "PageUpButtonForegroundStyle",
      specificForegroundStyleRef: {systemImageName: "chevron.up"}
    },
    "PageDown": {
      styleKeyNameSuffix: "PageDownButtonStyle",
      foregroundStyleKeyNameSuffix: "PageDownButtonForegroundStyle",
      specificForegroundStyleRef: {systemImageName: "chevron.down"}
    },
    "Return": {
      styleKeyNameSuffix: "ReturnButtonStyle",
      foregroundStyleKeyNameSuffix: "ReturnButtonForegroundStyle",
      specificForegroundStyleRef: {systemImageName: "return"}
    },
    "Backspace": {
      styleKeyNameSuffix: "BackspaceButtonStyle",
      foregroundStyleKeyNameSuffix: "BackspaceButtonForegroundStyle",
      specificForegroundStyleRef: {systemImageName: "delete.left"}
    },
  };

  std.foldl(
    function(acc, i) (
      local buttonType = candidateButtonTypes[i];
      local mapping = candidateButtonMappings[buttonType];

      local styleKeyName = "verticalCandidate" + mapping.styleKeyNameSuffix;
      local foregroundStyleKeyName = "verticalCandidate" + mapping.foregroundStyleKeyNameSuffix;

      local currentStyles = {
        [styleKeyName]: {
          backgroundStyle: verticalCandidateButtonBackgroundStyleName,
          foregroundStyle: [foregroundStyleKeyName],
        },
        [foregroundStyleKeyName]: utils.newAutoStyle(mapping.specificForegroundStyleRef + buttonStyle.verticalForegroundStyle, app, theme)
      };
      acc + currentStyles
    ),
    std.range(0, std.length(candidateButtonTypes) - 1),
    {}
  );

local candidateContextMenuStyle = {
  [candidateContextMenuStyleName]: [
    // { name: "空格", action: "space" },
  ]
};
 
 mainToolbar 
 + toolbarButtonConfig 
 + horizontalCandidateStyle
 + verticalCandidateStyle
 + verticalCandidateButtonStyles
 + candidateContextMenuStyle 
