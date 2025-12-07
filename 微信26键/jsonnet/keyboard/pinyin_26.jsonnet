local Imports = import '../lib/imports.libsonnet';
local utils = import "../lib/utils.libsonnet";


function(app, device, orientation, theme)

local _ = utils.makeParamValidator(app, device, orientation, theme);

local layoutName = Imports.name.layoutName.pinyin_26;
local baseStyle = Imports.baseStyle;


Imports.getHeight(device, orientation, "default")
+ Imports.getLayout(device, orientation, layoutName)
+ Imports.preedit(app, device, orientation, theme)
+ Imports.toolbar(app, device, orientation, theme, Imports.toolbarAction[layoutName])
+ Imports.animation.getAnimation(app)
+ {
    keyboardStyle: {
      backgroundStyle: baseStyle().keyboardBackgroundStyleName
    } 
  }
+ utils.newStyleFactory(baseStyle().newKeyboardBackgroundStyle(),
  baseStyle().keyboardBackgroundStyleName)(app, device, orientation, theme)

+ utils.newStyleFactory(baseStyle().newAlphabeticButtonBackgroundStyle(),
  baseStyle().alphabeticButtonBackgroundStyleName)(app, device, orientation, theme) 

+ utils.newStyleFactory(baseStyle().newSystemButtonBackgroundStyle(),
  baseStyle().systemButtonBackgroundStyleName)(app, device, orientation, theme)  

+ utils.newStyleFactory(baseStyle().newBlueButtonBackgroundStyle(),
  baseStyle().blueButtonBackgroundStyleName)(app, device, orientation, theme)  

+ utils.newStyleFactory(baseStyle().newHintBackgroundStyle(),
  baseStyle().hintBackgroundStyleName)(app, device, orientation, theme) 

+ utils.newStyleFactory(baseStyle().newHintSymbolsBackgroundStyle(),
  baseStyle().hintSymbolsBackgroundStyleName)(app, device, orientation, theme) 

+ utils.newStyleFactory(baseStyle().newHintSymbolsSelectedBackgroundStyle(),
  baseStyle().hintSymbolsSelectedBackgroundStyleName)(app, device, orientation, theme)  


// 1
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.qButton,
  Imports.action(app)[layoutName].qButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.wButton,
  Imports.action(app)[layoutName].wButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.eButton,
  Imports.action(app)[layoutName].eButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.rButton,
  Imports.action(app)[layoutName].rButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.tButton,
  Imports.action(app)[layoutName].tButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.yButton,
  Imports.action(app)[layoutName].yButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.uButton,
  Imports.action(app)[layoutName].uButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.iButton,
  Imports.action(app)[layoutName].iButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.oButton,
  Imports.action(app)[layoutName].oButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.pButton,
  Imports.action(app)[layoutName].pButton
)

// 2
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.aButton,
  Imports.action(app)[layoutName].aButton 
  +  Imports.getSize(device, orientation, "aButton")
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.sButton,
  Imports.action(app)[layoutName].sButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.dButton,
  Imports.action(app)[layoutName].dButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.fButton,
  Imports.action(app)[layoutName].fButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.gButton,
  Imports.action(app)[layoutName].gButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.hButton,
  Imports.action(app)[layoutName].hButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.jButton,
  Imports.action(app)[layoutName].jButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.kButton,
  Imports.action(app)[layoutName].kButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.lButton,
  Imports.action(app)[layoutName].lButton
  +  Imports.getSize(device, orientation, "lButton")
)

// 3
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.zButton,
  Imports.action(app)[layoutName].zButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.xButton,
  Imports.action(app)[layoutName].xButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.cButton,
  Imports.action(app)[layoutName].cButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.vButton,
  Imports.action(app)[layoutName].vButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.bButton,
  Imports.action(app)[layoutName].bButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.nButton,
  Imports.action(app)[layoutName].nButton
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.mButton,
  Imports.action(app)[layoutName].mButton
)

// 4
+ Imports.keyboard.newSystemButton(app, device, orientation, theme,
  Imports.name.buttonName.shiftButton,
  Imports.action(app)[layoutName].shiftButton
  +  Imports.getSize(device, orientation, "shiftButton"),
  needUpper=true
)
+ Imports.keyboard.newSystemButton(app, device, orientation, theme,
  Imports.name.buttonName.backspaceButton,
  Imports.action(app)[layoutName].backspaceButton
  +  Imports.getSize(device, orientation, "backspaceButton")
)
+ Imports.keyboard.newSystemButton(app, device, orientation, theme,
  Imports.name.buttonName.ottButton,
  Imports.action(app)[layoutName].ottButton
  +  Imports.getSize(device, orientation, "ottButton")
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.toggle_LButton,
  Imports.action(app)[layoutName].toggle_LButton
  +  Imports.getSize(device, orientation, "toggle_LButton"),
  needHint=false
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.spaceButton,
  Imports.action(app)[layoutName].spaceButton
  +  Imports.getSize(device, orientation, "spaceButton")
  {
    notification: ["spacePreeditStateStyleNotification"]
  },
  needHint=false
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.toggle_RButton,
  Imports.action(app)[layoutName].toggle_RButton
  +  Imports.getSize(device, orientation, "toggle_RButton"),
  needHint=false
)
+ Imports.keyboard.newSystemButton(app, device, orientation, theme,
  Imports.name.buttonName.enterButton,
  Imports.action(app)[layoutName].enterButton
  +  Imports.getSize(device, orientation, "enterButton")
  {
    backgroundStyle: Imports.conditionStyle.enterButtonBackgroundStyle,
    foregroundStyle: Imports.conditionStyle.enterButtonForegroundStyle,
    notification: ["enterPreeditStateStyleNotification"]
  }
)
+ ( if app=="cskin" then Imports.notification.enterPreeditStateStyleNotification + Imports.notification.enterPreeditStateStyleNotification else {})

+ utils.newStyleFactory(
    (if std.objectHas(Imports.action(app)[layoutName].enterButton, "setForegroundStyle") then 
      Imports.action(app)[layoutName].enterButton.setForegroundStyle
    else utils.getKeyboardActionText(Imports.action(app)[layoutName].enterButton))
    + baseStyle("enterButton").newSystemButtonForegroundStyle,
  baseStyle().systemButtonForegroundStyleName)(app, device, orientation, theme)

+ utils.newStyleFactory(
    (if std.objectHas(Imports.action(app)[layoutName].enterButton, "setForegroundStyle") then 
      Imports.action(app)[layoutName].enterButton.setForegroundStyle
    else utils.getKeyboardActionText(Imports.action(app)[layoutName].enterButton))
    + baseStyle("enterButton").newBlueButtonForegroundStyle,
  baseStyle().blueButtonForegroundStyleName)(app, device, orientation, theme)
