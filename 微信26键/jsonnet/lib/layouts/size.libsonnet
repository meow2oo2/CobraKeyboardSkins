// lib/layouts/size.libsonnet
// 默认available, 支持百分比percentage, 浮点, 字符串1/4, 85/375

function(device, orientation, sizeName)
  local table = {
    iphone: {
      portrait: {
        default: { size: { width: { percentage: "0.1" } }},
        aButton: {
          size: { width: { percentage: "0.15" } },
          bounds: { width: "0.1/0.15", alignment: "right" }
        },
        lButton: {
          size: { width: { percentage: "0.15" } },
          bounds: { width: "0.1/0.15", alignment: "left" }
        },
        shiftButton: {
          size: { width: { percentage: "0.15" } },
          bounds: { width: "0.13/0.15", alignment: "left" }
        },
        backspaceButton: {
          size: { width: { percentage: "0.15" } },
          bounds: { width: "0.13/0.15", alignment: "right" }
        },
        ottButton: { size: { width: { percentage: "0.2" } }},
        toggle_LButton: { size: { width: { percentage: "0.1" } }},
        spaceButton: { size: { width: "available" }},
        toggle_RButton: { size: { width: { percentage: "0.11" } }},
        enterButton: { size: { width: { percentage: "0.215" } }},
        
        sym26shift: {
          size: { width: { percentage: "0.14" } },
          bounds: { width: "0.13/0.14", alignment: "left" }
        },
        sym26del: {
          size: { width: { percentage: "0.14" } },
          bounds: { width: "0.13/0.14", alignment: "right" }
        },
        symLastLowButton: { size: { width: { percentage: "0.12" } }},

        hintStyleSize: { size: { width: 48, height: 48 }},
        hintStyleFirstLowSize: { size: { width: 55, height: 55 }},
        hintSymbolsSize: { size: { width: 40, height: 45 }},
        candidateStateButtonSize: {size: { width: 45} },
        verticalLastRowStyleSize: {size: { height: 48} },
        toolbarButtonSize: {size: { width: "1/8" } },

      },
      landscape: self.portrait {
        ottButton: { size: { width: { percentage: "0.2" } }},
        enterButton: { size: { width: { percentage: "0.2" } }},
      },
    },

    ipad: {
      portrait: $.iphone.portrait{
      },
      landscape: $.iphone.landscape{
      },
      floating: self.portrait{
      },
    }};

  std.get(
    std.get(
      std.get(table, device, error "Unknown device"),
      orientation, error "orientation not supported on device "
    ),
    sizeName, {}
  )


