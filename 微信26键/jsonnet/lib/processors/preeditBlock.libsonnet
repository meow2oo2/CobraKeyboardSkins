// lib/processors/preeditBlock.libsonnet

local Imports = import "../imports.libsonnet";
local utils = import "../utils.libsonnet";
local buttonStyle = Imports.buttonStyle;

local preeditBackgroundStyleName = buttonStyle.preeditBackgroundStyleName;
local preeditForegroundStyleName = 'preeditForegroundStyle';

function(app, orientation, theme, params={}) 
{
    [if app=="cskin" then "preeditStyle" else if app=="hskin" then "preedit"]: {
      insets: if orientation=="landscape" then { left: "12" }
        else buttonStyle.baseParams("预编辑区内距"),
      backgroundStyle: preeditBackgroundStyleName,
      foregroundStyle: preeditForegroundStyleName
    }
    + buttonStyle.newPreeditBackgroundStyle(app, theme, params),

    [preeditForegroundStyleName]: utils.newTextStyle(
      buttonStyle.baseParams("预编辑区前景")
      + { fontSize: buttonStyle.baseParams("预编辑区编码字体大小") }, theme)
}

