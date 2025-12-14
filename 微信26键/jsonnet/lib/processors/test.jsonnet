// alphabet_main.libsonnet

// jsonnet .\test.jsonnet -o .\alphabet.yaml -J .

local Imports = import '../imports.libsonnet';
local candidatesBlock = import 'candidatesBlock.libsonnet';
local utils = import '../utils.libsonnet';
local baseStyle = Imports.baseStyle;
local app = "cskin";
local device = "iphone";
local orientation = "landscape";
// local orientation = "portrait";
local theme = "light";
local name = "aButton";
// local params = Imports.hintSymbols("cskin").pinyin_26.qButton;
local params = {a:{a:11}};

local mainConfig = std.prune({[name]:{a:{}}});

local useNative = true;


local baseParam = Imports.baseParams;
local fileImage = Imports.fileImage;


Imports.baseParams

// local alphabeticButtonBackgroundStyleName = "alphabeticButtonBackgroundStyle";
// local newAlphabeticButtonBackgroundStyle(app, theme, isNative=useNative) = 
  // local base = baseParam["cskin"];

// local ass = std.mergePatch({
//   ["a"]:{
//   a:1,
//   b:"s"
// }},utils.extractProperties(params, [
//     "a"
// ]));

// ass

// utils.newStyleFactory(
//     if isNative then utils.getInBatch(baseParam, ["字母键背景", "背景色通用参数", "渐变色通用参数"])
//     else utils.getInBatch(fileImage.backgroundStyle, "字母键背景"),
//     alphabeticButtonBackgroundStyleName)(app, theme,
//       {
//     insets: baseParam["键盘按键背景内距"] 
//   });
// newAlphabeticButtonBackgroundStyle(app,theme)
// local normalizePaths(spec) =
//   if std.type(spec) != "array" then
//     error "spec must be an array"
//   else if std.length(spec) == 0 then
//     error "empty path not allowed" 
//   else [
//     if std.type(item) == "string" then [item] 
//     else if std.type(item) == "array" then item 
//     else error "must be a strings or numbers"
//     for item in spec
//   ];
// local checkExists(pathsSpec, overrides) =
//   local normalizedSpec = normalizePaths(pathsSpec);
//   std.length([p for p in normalizedSpec if utils.objectHasAtPath(overrides, p)]) > 0;
// // utils.getIn(base["字母键背景"], theme)
//   local hasAnyBorderColor = checkExists(["normalBorderColor", "highlightBorderColor"], {normalBorderColor:"1"});

// hasAnyBorderColor
// utils.getInBatchPlus(Imports.baseParams(app), 
//     [["themeColor","字母键背景"]],true)
// utils.getInBatchPlus(Imports.baseParams(app), [
//     ["themeColor","字母键背景"],
//     ["extraNativeStyle","背景色通用参数"],
//     ["extraNativeStyle","渐变色通用参数"],
//   ])
// std.get(mainConfig[name],"a",{}) 
// utils.getInBatch(mainConfig,name,{}) 
// assert !std.objectHas({}, "hi"),
// assert std.objectHas({ hi: 3 }, "hi"),
// assert !std.objectHas({ hi:: 3 }, "hi"),

// utils.extractProperties(params[theme], ["normalColor", "highlightColor"])
// utils.getConfigForContext(app,device,orientation,{
//    fontSize: 20,
//    "land.fontSize": 200,
//    // insets: 1,
//    // center: 2,
//    // targetScale: 3
// })
// utils.getConfigForContext(app,device,orientation,{
//    fontSize: 20,
//    "iphone.landscape.fontSize": 200,
//    // insets: 1,
//    // center: 2,
//    // targetScale: 3
// })
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
// utils.newStyleFactory(
//       // utils.getKeyboardActionText(params[0], style="label")
//       utils.newBaseParamsAtFormat({       "buttonStyleType": "fileImage",
//       "contentMode": "scaleAspectFill",
//       insets: {
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
//       } })
//       // + baseStyle().toolbarButtonForegroundStyle()
//     )(app, device, orientation, theme)
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