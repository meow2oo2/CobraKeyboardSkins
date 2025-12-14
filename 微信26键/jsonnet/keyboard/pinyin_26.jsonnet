local Imports = import '../lib/imports.libsonnet';
local utils = import "../lib/utils.libsonnet";


function(app, device, orientation, theme)

local _ = utils.makeParamValidator(app, device, orientation, theme);

local layoutName = Imports.name.layoutName.pinyin_26;
local buttonStyle = Imports.buttonStyle;


Imports.getHeight(device, orientation, "default")
+ Imports.getLayout(device, orientation, layoutName)
+ Imports.preedit(app, orientation, theme)
+ Imports.toolbar(app, device, orientation, theme, Imports.toolbarAction[layoutName])
+ Imports.animation.getAnimation(app)
+ {
    keyboardStyle: {
      backgroundStyle: buttonStyle.keyboardBackgroundStyleName
    } 
  }
+ buttonStyle.newKeyboardBackgroundStyle(app, theme)

+ buttonStyle.newAlphabeticButtonBackgroundStyle(app, theme)

+ buttonStyle.newSystemButtonBackgroundStyle(app, theme)  

+ buttonStyle.newBlueButtonBackgroundStyle(app, theme)  

+ buttonStyle.newHintBackgroundStyle(app, theme) 

+ buttonStyle.newHintSymbolsBackgroundStyle(app, theme) 

+ buttonStyle.newHintSymbolsSelectedBackgroundStyle(app, theme)  

+ buttonStyle.fullStyle(theme)

+ buttonStyle.halfStyle(theme)


// 1
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.qButton,
  Imports.action(app)[layoutName].qButton
  + { hintStyle: { size: { width: 42, height: 42 } } }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.wButton,
  Imports.action(app)[layoutName].wButton
  + { hintStyle: { size: { width: 42, height: 42 } } }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.eButton,
  Imports.action(app)[layoutName].eButton
  + { hintStyle: { size: { width: 42, height: 42 } } }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.rButton,
  Imports.action(app)[layoutName].rButton
  + { hintStyle: { size: { width: 42, height: 42 } } }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.tButton,
  Imports.action(app)[layoutName].tButton
  + { hintStyle: { size: { width: 42, height: 42 } } }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.yButton,
  Imports.action(app)[layoutName].yButton
  + { hintStyle: { size: { width: 42, height: 42 } } }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.uButton,
  Imports.action(app)[layoutName].uButton
  + { hintStyle: { size: { width: 42, height: 42 } } }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.iButton,
  Imports.action(app)[layoutName].iButton
  + { hintStyle: { size: { width: 42, height: 42 } } }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.oButton,
  Imports.action(app)[layoutName].oButton
  + { hintStyle: { size: { width: 42, height: 42 } } }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.pButton,
  Imports.action(app)[layoutName].pButton
  + { hintStyle: { size: { width: 42, height: 42 } } }
)

// 2
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.aButton,
  Imports.action(app)[layoutName].aButton 
  + Imports.getSize(device, orientation, "aButton")
  + {
    aButtonSwipeDownHintForegroundStyle: { fontSize: 16 },
    hintSymbols: { size: { width: 40, height: 48 }}
  }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.sButton,
  Imports.action(app)[layoutName].sButton
  + {
    sButtonSwipeDownHintForegroundStyle: { fontSize: 16 },
    hintSymbols: { size: { width: 40, height: 48 }}
  }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.dButton,
  Imports.action(app)[layoutName].dButton
  + {
    hintSymbols: { size: { width: 40, height: 48 }}
  }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.fButton,
  Imports.action(app)[layoutName].fButton
  + {
    hintSymbols: { size: { width: 40, height: 48 }}
  }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.gButton,
  Imports.action(app)[layoutName].gButton
  + {
    hintSymbols: { size: { width: 40, height: 48 }}
  }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.hButton,
  Imports.action(app)[layoutName].hButton
  + {
    hintSymbols: { size: { width: 40, height: 48 }}
  }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.jButton,
  Imports.action(app)[layoutName].jButton
  + {
    hintSymbols: { size: { width: 40, height: 48 }}
  }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.kButton,
  Imports.action(app)[layoutName].kButton
  + {
    hintSymbols: { size: { width: 40, height: 48 }}
  }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.lButton,
  Imports.action(app)[layoutName].lButton
  +  Imports.getSize(device, orientation, "lButton")
  + {
    hintSymbols: { size: { width: 40, height: 48 }}
  }
)

// 3
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.zButton,
  Imports.action(app)[layoutName].zButton
  + {
    zButtonSwipeDownHintForegroundStyle: { fontSize: 16 },
    hintSymbols: { size: { width: 40, height: 48 }}
  }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.xButton,
  Imports.action(app)[layoutName].xButton
  + {
    xButtonSwipeDownHintForegroundStyle: { fontSize: 16 },
    hintSymbols: { size: { width: 40, height: 48 }}
  }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.cButton,
  Imports.action(app)[layoutName].cButton
  + {
    cButtonSwipeDownHintForegroundStyle: { fontSize: 16 },
    hintSymbols: { size: { width: 40, height: 48 }}
  }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.vButton,
  Imports.action(app)[layoutName].vButton
  + {
    vButtonSwipeDownHintForegroundStyle: { fontSize: 16 },
    hintSymbols: { size: { width: 40, height: 48 }}
  }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.bButton,
  Imports.action(app)[layoutName].bButton
  + {
    hintSymbols: { size: { width: 40, height: 48 }}
  }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.nButton,
  Imports.action(app)[layoutName].nButton
  + {
    nButtonSwipeDownHintForegroundStyle: { fontSize: 16 },
    hintSymbols: { size: { width: 40, height: 48 }}
  }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.mButton,
  Imports.action(app)[layoutName].mButton
  + {
    mButtonSwipeDownHintForegroundStyle: { fontSize: 16 },
    hintSymbols: { size: { width: 40, height: 48 }}
  }
)

// 4
+ Imports.keyboard.newSystemButton(app, device, orientation, theme,
  Imports.name.buttonName.shiftButton,
  Imports.action(app)[layoutName].shiftButton
  +  Imports.getSize(device, orientation, "shiftButton")
  ,needUpper=true
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
  + {
    ottButtonForegroundStyle: { fontSize: 16 }
  }
)
+ Imports.keyboard.newAlphabeticButton(app, device, orientation, theme,
  Imports.name.buttonName.toggle_LButton,
  Imports.action(app)[layoutName].toggle_LButton
  +  Imports.getSize(device, orientation, "toggle_LButton")
  + {
    light: { normalColor: "000000", highlightColor: "000000" },
    dark: { normalColor: "feffff", highlightColor: "ffffff" },
    toggle_LButtonForegroundStyle: { 
      center: { x: 0.66 },
    },
    toggle_LButtonUpForegroundStyle: utils.getColor({
        light: { normalColor: "575757e6", highlightColor: "575757" },
        dark: { normalColor: "ffffff65", highlightColor: "ffffff65" }
    }, theme){ center: { x: 0.59, y: 0.3}, fontSize: 14 }
  },
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
    (if std.objectHas(Imports.action(app)[layoutName].enterButton, "foregroundStyleLabel") then 
      Imports.action(app)[layoutName].enterButton.foregroundStyleLabel
    else utils.getKeyboardActionText(Imports.action(app)[layoutName].enterButton))
    + buttonStyle.newSystemButtonTextForegroundStyle("enterButton"),
  buttonStyle.systemButtonForegroundStyleName)(app, theme)

+ utils.newStyleFactory(
    (if std.objectHas(Imports.action(app)[layoutName].enterButton, "foregroundStyleLabel") then 
      Imports.action(app)[layoutName].enterButton.foregroundStyleLabel
    else utils.getKeyboardActionText(Imports.action(app)[layoutName].enterButton))
    + buttonStyle.newBlueButtonTextForegroundStyle("enterButton"),
  buttonStyle.blueButtonForegroundStyleName)(app, theme)
