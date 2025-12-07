// lib/layouts/layout.libsonnet

local name = (import '../imports.libsonnet').name;

function(device, orientation, layoutName)
  local table = {
    iphone: {
      portrait: {

        [name.layoutName.pinyin_26]: {
          keyboardLayout: [
            {
              HStack: {
                subviews: [
                  { Cell: name.buttonName.qButton },
                  { Cell: name.buttonName.wButton },
                  { Cell: name.buttonName.eButton },
                  { Cell: name.buttonName.rButton },
                  { Cell: name.buttonName.tButton },
                  { Cell: name.buttonName.yButton },
                  { Cell: name.buttonName.uButton },
                  { Cell: name.buttonName.iButton },
                  { Cell: name.buttonName.oButton },
                  { Cell: name.buttonName.pButton }
                ]
              }
            },
            {
              HStack: {
                subviews: [
                  { Cell: name.buttonName.aButton },
                  { Cell: name.buttonName.sButton },
                  { Cell: name.buttonName.dButton },
                  { Cell: name.buttonName.fButton },
                  { Cell: name.buttonName.gButton },
                  { Cell: name.buttonName.hButton },
                  { Cell: name.buttonName.jButton },
                  { Cell: name.buttonName.kButton },
                  { Cell: name.buttonName.lButton },
                ]
              }
            },
            {
              HStack: {
                subviews: [
                  { Cell: name.buttonName.shiftButton },
                  { Cell: name.buttonName.zButton },
                  { Cell: name.buttonName.xButton },
                  { Cell: name.buttonName.cButton },
                  { Cell: name.buttonName.vButton },
                  { Cell: name.buttonName.bButton },
                  { Cell: name.buttonName.nButton },
                  { Cell: name.buttonName.mButton },
                  { Cell: name.buttonName.backspaceButton }
                ]
              }
            },
            {
              HStack: {
                subviews: [
                  { Cell: name.buttonName.ottButton },
                  { Cell: name.buttonName.toggle_LButton },
                  { Cell: name.buttonName.spaceButton },
                  { Cell: name.buttonName.toggle_RButton },
                  { Cell: name.buttonName.enterButton }
                ]
              }
            }
          ],
        },

        [name.layoutName.symbol_26]: {
          keyboardLayout: [
            {
              HStack: {
                subviews: [
                  { Cell: name.buttonName.qButton },
                  { Cell: name.buttonName.wButton },
                  { Cell: name.buttonName.eButton },
                  { Cell: name.buttonName.rButton },
                  { Cell: name.buttonName.tButton },
                  { Cell: name.buttonName.yButton },
                  { Cell: name.buttonName.uButton },
                  { Cell: name.buttonName.iButton },
                  { Cell: name.buttonName.oButton },
                  { Cell: name.buttonName.pButton }
                ]
              }
            },
            {
              HStack: {
                subviews: [
                  { Cell: name.buttonName.aButton },
                  { Cell: name.buttonName.sButton },
                  { Cell: name.buttonName.dButton },
                  { Cell: name.buttonName.fButton },
                  { Cell: name.buttonName.gButton },
                  { Cell: name.buttonName.hButton },
                  { Cell: name.buttonName.jButton },
                  { Cell: name.buttonName.kButton },
                  { Cell: name.buttonName.lButton },
                  { Cell: name.buttonName.zButton }
                ]
              }
            },
            {
              HStack: {
                subviews: [
                  { Cell: name.buttonName.shiftButton },
                  { Cell: name.buttonName.xButton },
                  { Cell: name.buttonName.cButton },
                  { Cell: name.buttonName.vButton },
                  { Cell: name.buttonName.bButton },
                  { Cell: name.buttonName.nButton },
                  { Cell: name.buttonName.mButton },
                  { Cell: name.buttonName.backspaceButton }
                ]
              }
            },
            {
              HStack: {
                subviews: [
                  { Cell: name.buttonName.ottButton },
                  { Cell: name.buttonName.spaceButton },
                  { Cell: name.buttonName.enterButton }
                ]
              }
            }
          ],
        },

      },//port

      landscape: self.portrait{
        
      },//land
    },

    ipad: {
      portrait: $.iphone.portrait { },
      landscape: $.iphone.landscape { },
      floating: self.portrait { },
    },
  };

  std.get(
    std.get(
      std.get(table, device, error "Unknown device"),
      orientation,
      error "orientation not supported on device"
    ),
    layoutName, error "layoutName not found"
  )