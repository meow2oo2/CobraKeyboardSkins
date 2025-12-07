// lib/effects/conditionStyle.libsonnet

local baseStyle = (import 'baseStyle.libsonnet')();

local enterButtonBackgroundStyle = [
  {
    styleName: baseStyle.systemButtonBackgroundStyleName,
    conditionKey: '$returnKeyType',
    conditionValue: [0, 2, 3, 5, 6, 8, 11],
  },
  {
    styleName: baseStyle.blueButtonBackgroundStyleName,
    conditionKey: '$returnKeyType',
    conditionValue: [1, 4, 7, 9, 10], 
  },
];

local enterButtonForegroundStyle = [
  {
    styleName: baseStyle.systemButtonForegroundStyleName,
    conditionKey: '$returnKeyType',
    conditionValue: [0, 2, 3, 5, 6, 8, 11],
  },
  {
    styleName: baseStyle.blueButtonForegroundStyleName,
    conditionKey: '$returnKeyType',
    conditionValue: [1, 4, 7, 9, 10],
  },
];


{
enterButtonBackgroundStyle: enterButtonBackgroundStyle,
enterButtonForegroundStyle: enterButtonForegroundStyle,
}

