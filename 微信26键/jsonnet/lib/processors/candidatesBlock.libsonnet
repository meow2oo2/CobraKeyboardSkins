// lib/processors/candidatesBlock.libsonnet

local Imports = import "../imports.libsonnet";
local utils = import "../utils.libsonnet";
local buttonStyle = Imports.buttonStyle;


local candidateContextMenuStyleName = buttonStyle.candidateContextMenuStyleName;
local candidateStateButtonSeparatorForegroundStyleName = buttonStyle.candidateStateButtonSeparatorForegroundStyleName;
local verticalCandidateButtonBackgroundStyleName = buttonStyle.systemButtonBackgroundStyleName;
local verticalCandidatesCollectionName = 'verticalCandidatesCollection';
local verticalLastColStyleName = 'verticalLastColStyle';
local verticalLastRowStyleName = 'verticalLastRowStyle';
local verticalCandidatePageUpButtonStyleName = 'verticalCandidatePageUpButtonStyle';
local verticalCandidatePageDownButtonStyleName = 'verticalCandidatePageDownButtonStyle';
local verticalCandidateReturnButtonStyleName = 'verticalCandidateReturnButtonStyle';
local verticalCandidateBackspaceButtonStyleName = 'verticalCandidateBackspaceButtonStyle';

function(app, device, orientation, theme, candidateCase=true) 

  local horizontalCandidateStyle = {
    horizontalCandidatesStyle: {
      // insets: buttonStyle.baseParams("横向候选布局内距"), // 整个横向候选布局的内距
      backgroundStyle: buttonStyle.toolbarBackgroundStyleName
    },
    horizontalCandidatesLayout: [
      {
        HStack: {
          subviews: [
            {Cell: "horizontalCandidatesCollection"},
            {Cell: "candidateStateButton"},
          ],
        },
      }, // 
    ],
    horizontalCandidatesCollection: {
      type: 'horizontalCandidates',
      candidateStyle: "horizontalCandidateCellStyle",
      size: { width: "available" }, // horizontalCandidatesSize
      maxColumns: if orientation != "landscape" then buttonStyle.baseParams("纵横候选列表其他参数", "最大横向候选字显示数量")
        else 15,
      insets: buttonStyle.baseParams("横向候选列表样式内距"), //候选区域样式内距
      // backgroundStyle: "toolbarButtonBackgroundStyleName" // 屏蔽, 用toolbar背景
    },
    horizontalCandidateCellStyle: {
      // insets: buttonStyle.baseParams("横向候选字区域内距"),
    } + buttonStyle.candidatesStyle(theme),
    candidateStateButton: {
      size: Imports.getSize(device, orientation, "candidateStateButtonSize").size,
      action: { shortcut: '#candidatesBarStateToggle' },
      animation: Imports.animation.setCskinAnimationName,
      backgroundStyle: "candidateStateButtonBackgroundStyle",
      foregroundStyle: [
        candidateStateButtonSeparatorForegroundStyleName,
        "candidateStateButtonForegroundStyle"
      ]
    },
    candidateStateButtonBackgroundStyle: utils.newAutoStyle(
      buttonStyle.candidateStateButtonBackgroundStyle, app, theme),
    [candidateStateButtonSeparatorForegroundStyleName]: utils.newAutoStyle(
      buttonStyle.candidateStateButtonSeparatorForegroundStyle(theme), app, theme),
    candidateStateButtonForegroundStyle: 
      utils.newAutoStyle(buttonStyle.candidateStateButtonForegroundStyle, app, theme)
  };

  local verticalCandidateStyle = {
    verticalCandidatesStyle: {
      // insets: Imports.baseParam.inner["纵向候选布局内距"], // 整个纵向候选布局的内距 
      backgroundStyle: "verticalCandidateBackgroundStyle" 
    },
    local verticalCandidatesLayoutCase1 = [
      {
        VStack: {
          subviews: [
            { Cell: verticalCandidatesCollectionName },
          ],
        },
      },
      {
        VStack: {
          style: verticalLastColStyleName,
          subviews: [
            { Cell: "returnPrimaryKeyboardButton" },
            { Cell: "verticalPlaceholderButton" }, 
          ],
        },
      }
    ],
    local verticalCandidatesLayoutCase2 = [
      {
        HStack: {
          subviews: [
            {
              Cell: verticalCandidatesCollectionName,
            },
          ],
        },
      },
      {
        HStack: {
          style: verticalLastRowStyleName,
          subviews: [
            { Cell: verticalCandidatePageUpButtonStyleName },
            { Cell: verticalCandidatePageDownButtonStyleName },
            { Cell: verticalCandidateReturnButtonStyleName },
            { Cell: verticalCandidateBackspaceButtonStyleName },
          ],
        },
      },
    ],
    verticalCandidatesLayout: if candidateCase then verticalCandidatesLayoutCase1
      else verticalCandidatesLayoutCase2,
    verticalCandidateBackgroundStyle: 
      utils.newAutoStyle(buttonStyle.verticalCandidateBackgroundStyle, app, theme),
    [verticalCandidatesCollectionName]: {
      type: "verticalCandidates",
      size: { width: "available" }, 
      insets: buttonStyle.baseParams("纵向候选列表样式内距"),
      maxRows: 5,
      maxColumns: buttonStyle.baseParams("纵横候选列表其他参数", "最大纵向候选字列表列数"),
      separatorColor: buttonStyle.baseParams("纵向候选区域样式", theme).separatorColor,
      candidateStyle: "verticalCandidateCellStyle"
    } + (if candidateCase == false then {
      backgroundStyle: verticalCandidatesCollectionName + "BackgroundStyle"
    } else {}),
    verticalCandidateCellStyle: buttonStyle.candidatesStyle(theme){
      insets: { left: 2, right: 2 } 
          + buttonStyle.baseParams("纵向候选字区域内距")
    }
  };
  local verticalCandidateSubclassStyle = if candidateCase then {
    [verticalLastColStyleName]: {
      size: Imports.getSize(device, orientation, "candidateStateButtonSize").size
    },
    returnPrimaryKeyboardButton: {
      size: { height: Imports.getSize(device, orientation, "candidateStateButtonSize").size.width },
      action: { shortcut: '#candidatesBarStateToggle' },
      animation: Imports.animation.setCskinAnimationName,
      backgroundStyle: "candidateStateButtonBackgroundStyle",
      foregroundStyle: [
        "returnPrimaryKeyboardButtonForegroundStyle"
      ],
    },
    returnPrimaryKeyboardButtonForegroundStyle: 
      utils.newAutoStyle(buttonStyle.returnPrimaryKeyboardButtonForegroundStyle, app, theme),
    verticalPlaceholderButton: {
      size: { height: "available" },
      action: "none"
    }
  } else (
    local candidateButtonTypes = ["PageUp", "PageDown", "Return", "Backspace"];
    local candidateButtonMappings = {
      "PageUp": {
        styleKeyNameSuffix: "PageUpButtonStyle",
        foregroundStyleKeyNameSuffix: "PageUpButtonForegroundStyle",
        specificForegroundStyleRef: { systemImageName: "chevron.up" },
        action: { shortcut: '#verticalCandidatesPageUp' },
      },
      "PageDown": {
        styleKeyNameSuffix: "PageDownButtonStyle",
        foregroundStyleKeyNameSuffix: "PageDownButtonForegroundStyle",
        specificForegroundStyleRef: { systemImageName: "chevron.down" },
        action: { shortcut: '#verticalCandidatesPageDown' },
      },
      "Return": {
        styleKeyNameSuffix: "ReturnButtonStyle",
        foregroundStyleKeyNameSuffix: "ReturnButtonForegroundStyle",
        specificForegroundStyleRef: { systemImageName: "return" },
        action: { shortcut: '#candidatesBarStateToggle' },
      },
      "Backspace": {
        styleKeyNameSuffix: "BackspaceButtonStyle",
        foregroundStyleKeyNameSuffix: "BackspaceButtonForegroundStyle",
        specificForegroundStyleRef: { systemImageName: "delete.left" },
        action: 'backspace'
      },
    };
    {
      [verticalCandidatesCollectionName + "BackgroundStyle"]: {
        buttonStyleType: "geometry",
        insets: { top: 0, bottom: -2, left: 3, right: 3 } 
          + buttonStyle.baseParams("纵向候选字区域内距"),
        cornerRadius: buttonStyle.baseParams("纵横候选列表其他参数", "cornerRadius"),
        normalColor: buttonStyle.baseParams("纵向候选区域样式", theme).backgroundColor
      },
      [verticalLastRowStyleName]: Imports.getSize(device, orientation, "verticalLastRowStyleSize"),
    } +
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
            animation: Imports.animation.setCskinAnimationName,
            action: mapping.action
          },
          [foregroundStyleKeyName]: utils.newAutoStyle(mapping.specificForegroundStyleRef + buttonStyle.verticalForegroundStyle, app, theme)
        };
        acc + currentStyles
      ),
      std.range(0, std.length(candidateButtonTypes) - 1),
      {}
    )
  );

  local candidateContextMenuStyle = {
    [candidateContextMenuStyleName]: [
      // { name: "空格", action: "space" },
    ]
  };

horizontalCandidateStyle
+ verticalCandidateStyle
+ verticalCandidateSubclassStyle
+ candidateContextMenuStyle