// lib/effects/notification.libsonnet

local buttonStyle = import 'buttonStyle.libsonnet';


local enterPreeditStateStyleNotification = {
  enterPreeditStateStyleNotification: {
    notificationType: 'preeditChanged',
    backgroundStyle: buttonStyle.blueButtonBackgroundStyleName,
    foregroundStyle: buttonStyle.blueButtonForegroundStyleName,
  },
};

local spacePreeditStateStyleNotification = {
  spacepreeditStateStyleNotification: {
    notificationType: 'preeditChanged',
    backgroundStyle: buttonStyle.alphabeticButtonBackgroundStyleName,
    foregroundStyle: buttonStyle.spacePreeditStateForegroundStyleName,
  },
};



{
enterPreeditStateStyleNotification: enterPreeditStateStyleNotification,
spacePreeditStateStyleNotification: spacePreeditStateStyleNotification,
}


