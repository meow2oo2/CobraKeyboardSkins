// alphabet_main.libsonnet

// jsonnet .\test.jsonnet -o .\alphabet.yaml -J .

local Imports = import '../imports.libsonnet';
local candidatesBlock = import 'candidatesBlock.libsonnet';
local utils = import '../utils.libsonnet';
local baseStyle = Imports.baseStyle;
local app = "cskin";
local device = "iphone";
local orientation = "portrait";
local theme = "light";
local name = "aButton";
// local params = Imports.hintSymbols("cskin").pinyin_26.qButton;
local params = Imports.toolbarAction.pinyin_26;
// local params = ["0","1","2","3","4","5","6"];
//     local toolbarLayoutCase3 = [
//         {
//           HStack: {
//             subviews: [
//               { Cell: "primaryButton"}
//             ] + [
//               { Cell: "toolbarButton" + (i - 1) },
//               for i in std.range(2, std.min(std.length(params), 7) - 1)
//             ] + [
//               { Cell: "dismissKeyboardButton" }
//             ],
//           },
//         }, 
//     ];
// {as:std.range(2, std.min(std.length(params), 7) - 1)}
utils.newStyleFactory(
      // utils.getKeyboardActionText(params[0], style="label")
      utils.newBaseParamsAtFormat({       "buttonStyleType": "fileImage",
      "contentMode": "scaleAspectFill",
      insets: {
         "bottom": 5,
         "left": 5,
         "right": 5,
         "top": 5
      },
      "normalImage": {
         "file": "test",
         "image": "IMG1"
      },
"highlightImage": {
         "file": "test",
         "image": "IMG1"
      } })
      // + baseStyle().toolbarButtonForegroundStyle()
    )(app, device, orientation, theme)
// utils.newFileImageStyle(app,device,orientation,
//       utils.newBaseParamsAtFormat({       "buttonStyleType": "fileImage",
//       "contentMode": "scaleAspectFill",
//       "insets": {
//          "bottom": 5,
//          "left": 5,
//          "right": 5,
//          "top": 5
//       },
//       "normalImage": {
//          "file": "test",
//          "image": "IMG1"
//       },
// "highlightImage": {
//          "file": "test",
//          "image": "IMG1"
//       } }))

// utils.addActionBadgeStyle({ symbol: "、" })
// baseStyle().newKeyboardBackgroundStyle
//  utils.newStyleFactory(
//     (if std.objectHas(params, "setForegroundStyle") then params.setForegroundStyle
//         else utils.getKeyboardActionText(params))
//       + 
//     baseStyle("enterButton").newSystemButtonForegroundStyle,
//   baseStyle().systemButtonForegroundStyleName)(app, device, orientation, theme)
// utils.newStyleFactory(Imports.baseStyle().newAlphabeticButtonBackgroundStyle())(app, device, orientation, theme) 
// Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
//   Imports.name.buttonName.aButton,
//   Imports.action(app).pinyin_26.aButton
// )
// candidatesBlock(app,device,orientation,theme)
// Imports.action("symbol")
// Imports.action(app).pinyin_26.aButton.setDownForegroundStyle

//  local asd =utils.newStyleFactory(
//       if std.objectHas(params, "setDownForegroundStyle") then params.setDownForegroundStyle
//         else utils.getKeyboardActionText(params, "swipeDownAction")
//       + baseStyle(name).newAlphabeticButtonDownForegroundStyle
//     )(app, device, orientation, theme);
// asd
// Imports.baseStyle("aButton").newAlphabeticButtonDownForegroundStyle

//  utils.badgeModule.create(name, params.actions[0].action, 0, "")
    //   if std.objectHas(params, "setDownForegroundStyle") then params.setDownForegroundStyle
    //     else utils.getKeyboardActionText(params, "swipeDownAction")

    // baseStyle(name).newAlphabeticButtonDownForegroundStyle

// utils.newAutoStyle(app, device, orientation, theme,a)
// utils.newStyleFactory(      (if std.objectHas(params, "setDownForegroundStyle") then params.setDownForegroundStyle
//         else utils.getKeyboardActionText(params, "swipeDownAction"))
//       + baseStyle(name).newAlphabeticButtonDownForegroundStyle)(app, device, orientation, theme)

// baseStyle(name).newAlphabeticButtonDownForegroundStyle