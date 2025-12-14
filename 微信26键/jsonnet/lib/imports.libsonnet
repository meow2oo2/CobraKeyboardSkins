// lib/imports.libsonnet
{
  // baseParams(app):
  //   if app == "cskin" then (import '../lib/basic/cskin_base_params.libsonnet')
  //   else if app == "hskin" then (import '../lib/basic/hskin_base_params.libsonnet')
  //   else error "no such app baseParams",

  // baseParams:{ 
  //   cskin: import '../lib/basic/cskin_base_params.libsonnet',
  //   hskin: import '../lib/basic/hskin_base_params.libsonnet',
  // },

  baseParams: 
    local color = import '../lib/basic/color.libsonnet';
    local font = import '../lib/basic/font.libsonnet';
    local inner = import '../lib/basic/inner.libsonnet';
    local offset = import '../lib/basic/offset.libsonnet';
    color + font + inner + offset,

  preedit: import "../lib/processors/preeditBlock.libsonnet",  
  toolbar: import "../lib/processors/toolbarBlock.libsonnet",
  keyboard: import "../lib/processors/keyboardBlock.libsonnet",

  name : import "../lib/inputs/name.libsonnet",
  action : import "../lib/inputs/action.libsonnet",
  swipe : import "../lib/inputs/swipe.libsonnet", 
  hintSymbols : import "../lib/inputs/hintSymbols.libsonnet", 
  toolbarAction : import '../lib/inputs/toolbar_actions.libsonnet',

  getSize: import "../lib/layouts/size.libsonnet", 
  getHeight: import "../lib/layouts/height.libsonnet",
  getLayout: import "../lib/layouts/layout.libsonnet",

  animation : import "../lib/styles/animation.libsonnet",
  buttonStyle : import "../lib/styles/buttonStyle.libsonnet",
  conditionStyle : import "../lib/styles/conditionStyle.libsonnet",
  notification: import "../lib/styles/notification.libsonnet",
  fileImage: import '../lib/styles/fileImage.libsonnet',
  javascript: import '../lib/styles/javascript.libsonnet',
  
}