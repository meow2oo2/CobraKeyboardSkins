// lib/processors/preeditBlock.libsonnet

local Imports = import "../imports.libsonnet";
local utils = import "../utils.libsonnet";
local baseStyle = Imports.baseStyle();

local preeditBackgroundStyleName = baseStyle.preeditBackgroundStyleName;
local preeditForegroundStyleName = 'preeditForegroundStyle';

function(app, device, orientation, theme) 
{
    [if app=="cskin" then "preeditStyle" else if app=="hskin" then "preedit"]: {
      insets: if orientation=="landscape" then {left: "12"}
        else Imports.baseParam.inner["预编辑区内距"],
      backgroundStyle: preeditBackgroundStyleName,
      foregroundStyle: preeditForegroundStyleName
    },

    [preeditBackgroundStyleName]: utils.newStyleFactory(
      baseStyle.newPreeditBackgroundStyle()
    )(app, device, orientation, theme),

    [preeditForegroundStyleName]: utils.newStyleFactory(
      Imports.baseParam.color.themeColor["预编辑区前景"]
      + utils.newBaseParamsAtFormat({
        fontSize: Imports.baseParam.font["预编辑区编码字体大小"]
      })
    )(app, device, orientation, theme)
}





