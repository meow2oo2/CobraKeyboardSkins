// lib/effects/conditionStyle.libsonnet

local buttonStyle = import 'buttonStyle.libsonnet';

local enterButtonBackgroundStyle = [
  {
    styleName: buttonStyle.systemButtonBackgroundStyleName,
    conditionKey: '$returnKeyType',
    conditionValue: [0, 2, 3, 5, 6, 8, 11],
  },
  {
    styleName: buttonStyle.blueButtonBackgroundStyleName,
    conditionKey: '$returnKeyType',
    conditionValue: [1, 4, 7, 9, 10], 
  },
];

local enterButtonForegroundStyle = [
  {
    styleName: buttonStyle.systemButtonForegroundStyleName,
    conditionKey: '$returnKeyType',
    conditionValue: [0, 2, 3, 5, 6, 8, 11],
  },
  {
    styleName: buttonStyle.blueButtonForegroundStyleName,
    conditionKey: '$returnKeyType',
    conditionValue: [1, 4, 7, 9, 10],
  },
];


{
enterButtonBackgroundStyle: enterButtonBackgroundStyle,
enterButtonForegroundStyle: enterButtonForegroundStyle,
}

