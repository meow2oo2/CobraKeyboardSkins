// lib/imports.libsonnet
{
  baseParam: {
    color: import '../lib/basic/color.libsonnet',
    font: import '../lib/basic/font.libsonnet',
    inner: import '../lib/basic/inner.libsonnet',
    offset: import '../lib/basic/offset.libsonnet', 
    scale: import '../lib/basic/scale.libsonnet', 
  },

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
  baseStyle : import "../lib/styles/baseStyle.libsonnet",
  conditionStyle : import "../lib/styles/conditionStyle.libsonnet",
  notification: import "../lib/styles/notification.libsonnet",
  fileImage: import '../lib/styles/fileImage.libsonnet',
  javascript: import '../lib/styles/javascript.libsonnet',
  panelStyle: import '../lib/styles/panelStyle.libsonnet',
  
}