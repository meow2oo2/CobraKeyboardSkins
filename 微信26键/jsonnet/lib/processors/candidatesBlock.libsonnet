// lib/processors/candidatesBlock.libsonnet

local Imports = import "../imports.libsonnet";
local utils = import "../utils.libsonnet";
local baseStyle = (Imports.baseStyle)();


local candidateContextMenuStyleName = baseStyle.candidateContextMenuStyleName;
local candidateStateButtonSeparatorForegroundStyleName = baseStyle.candidateStateButtonSeparatorForegroundStyleName;
local verticalCandidateButtonBackgroundStyleName = baseStyle.systemButtonBackgroundStyleName;
local verticalCandidatesCollectionName = 'verticalCandidatesCollection';
local verticalLastColStyleName = 'verticalLastColStyle';
local verticalLastRowStyleName = 'verticalLastRowStyle';
local verticalCandidatePageUpButtonStyleName = 'verticalCandidatePageUpButtonStyle';
local verticalCandidatePageDownButtonStyleName = 'verticalCandidatePageDownButtonStyle';
local verticalCandidateReturnButtonStyleName = 'verticalCandidateReturnButtonStyle';
local verticalCandidateBackspaceButtonStyleName = 'verticalCandidateBackspaceButtonStyle';

function(app, device, orientation, theme, calCandidateCase=true) 

  local horizontalCandidateStyle = {
    horizontalCandidatesStyle: {
      // insets: Imports.baseParam.inner["横向候选布局内距"], // 整个横向候选布局的内距
      backgroundStyle: baseStyle.toolbarBackgroundStyleName
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
      maxColumns: if orientation != "landscape" then Imports.baseParam.color.nativeConfig["纵横候选列表其他参数"]["最大横向候选字显示数量"]
        else 15
      // insets: Imports.baseParam.inner["横向候选列表样式内距"], //候选区域样式内距
      // backgroundStyle: "toolbarButtonBackgroundStyleName" // 屏蔽, 用toolbar背景
    },
    horizontalCandidateCellStyle: {
      insets: Imports.baseParam.inner["横向候选字区域内距"],
    } + baseStyle.candidatesStyle(theme),
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
    candidateStateButtonBackgroundStyle: utils.newStyleFactory(
      baseStyle.candidateStateButtonBackgroundStyle)(app, device, orientation, theme),
    [candidateStateButtonSeparatorForegroundStyleName]: utils.newStyleFactory(
      baseStyle.candidateStateButtonSeparatorForegroundStyle)(app, device, orientation, theme),
    candidateStateButtonForegroundStyle: 
      utils.newStyleFactory(baseStyle.candidateStateButtonForegroundStyle)(app, device, orientation, theme)
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
    verticalCandidatesLayout: if calCandidateCase then verticalCandidatesLayoutCase1
      else verticalCandidatesLayoutCase2,
    verticalCandidateBackgroundStyle: 
      utils.newStyleFactory(baseStyle.verticalCandidateBackgroundStyle())(app, device, orientation, theme),
    [verticalCandidatesCollectionName]: {
      type: "verticalCandidates",
      size: { width: "available" }, 
      insets: Imports.baseParam.inner["纵向候选列表样式内距"],
      maxRows: Imports.baseParam.color.nativeConfig["纵横候选列表其他参数"]["最大纵向候选字列表行数"],
      maxColumns: Imports.baseParam.color.nativeConfig["纵横候选列表其他参数"]["最大纵向候选字列表列数"],
      separatorColor: Imports.baseParam.color.nativeConfig["纵向候选区域样式"][theme].separatorColor,
      candidateStyle: "verticalCandidateCellStyle"
    } + (if calCandidateCase == false then {
      backgroundStyle: verticalCandidatesCollectionName + "BackgroundStyle"
    } else {}),
    verticalCandidateCellStyle: baseStyle.candidatesStyle(theme){
      insets: Imports.baseParam.inner["纵向候选字区域内距"]
    }
  };
  local verticalCandidateSubclassStyle = if calCandidateCase then {
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
      utils.newStyleFactory(baseStyle.returnPrimaryKeyboardButtonForegroundStyle)(app, device, orientation, theme),
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
        insets: Imports.baseParam.inner["纵向候选字区域内距"],
        cornerRadius: Imports.baseParam.color.nativeConfig["纵横候选列表其他参数"].cornerRadius,
        normalColor: Imports.baseParam.color.nativeConfig["纵向候选区域样式"][theme].backgroundColor
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
            action: mapping.action
          },
          [foregroundStyleKeyName]: utils.newStyleFactory(mapping.specificForegroundStyleRef + baseStyle.verticalForegroundStyle)(app, device, orientation, theme),
        };
        acc + currentStyles
      ),
      std.range(0, std.length(candidateButtonTypes) - 1),
      {}
    )
  );

  local candidateContextMenuStyle = {
    [candidateContextMenuStyleName]: [
      // { name: '空格', action: 'space' },
    ]
  };

horizontalCandidateStyle
+ verticalCandidateStyle
+ verticalCandidateSubclassStyle
+ candidateContextMenuStyle