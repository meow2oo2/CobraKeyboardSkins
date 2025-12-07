local utils = import "../utils.libsonnet";

function(device, orientation, heightName) 
  local dimensions = {
    iphone: {
      portrait: {preedit: 15, toolbar: 45, keyboard: 216},
      landscape: {preedit: 9, toolbar: 38, keyboard: 160},
    },
    ipad: {
      portrait: {preedit: 30, toolbar: 40, keyboard: 256},
      landscape: {preedit: 30, toolbar: 40, keyboard: 344},
      floating: {preedit: 25, toolbar: 35, keyboard: 216},
    },
  };
  local getHeight = function(data) {
      default: {
        preeditHeight: data.preedit,
        toolbarHeight: data.toolbar,
        keyboardHeight: data.keyboard,
      },
      notToolbar: {
        preeditHeight: data.preedit,
        keyboardHeight: utils.sumHeights([data.toolbar, data.keyboard]),
      },
  };
  local deviceData = std.get(dimensions, device, error "Unknown device");
  local orientationData = std.get(deviceData, orientation, error "Orientation not supported on device");

  std.get(getHeight(orientationData), heightName, {})
