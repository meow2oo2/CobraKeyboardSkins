// lib/effects/notification.libsonnet

local baseStyle = (import 'baseStyle.libsonnet')();


local enterPreeditStateStyleNotification = {
  enterPreeditStateStyleNotification: {
    notificationType: 'preeditChanged',
    backgroundStyle: baseStyle.blueButtonBackgroundStyleName,
    foregroundStyle: baseStyle.blueButtonForegroundStyleName,
  },
};

local spacePreeditStateStyleNotification = {
  spacepreeditStateStyleNotification: {
    notificationType: 'preeditChanged',
    backgroundStyle: baseStyle.alphabeticButtonBackgroundStyleName,
    foregroundStyle: baseStyle.spacePreeditStateForegroundStyleName,
  },
};



{
enterPreeditStateStyleNotification: enterPreeditStateStyleNotification,
spacePreeditStateStyleNotification: spacePreeditStateStyleNotification,
}


