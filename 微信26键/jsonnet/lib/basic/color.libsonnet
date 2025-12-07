// /lib/basic/color.libsonnet


local themeColor = {

  "键盘区背景" : {
    light: {
      normalColor: "312C2D01",
    },
    dark: {
      normalColor: "2d2c3101"
    },
  },

  "字母键背景" : {
    light: {
      normalColor: "feffff",
      highlightColor: "00103429",
      normalLowerEdgeColor: "0000004D",
      highlightLowerEdgeColor: "0000004D",
      // normalBorderColor: "000000", 
      // highlightBorderColor: "000000",  
      // normalShadowColor: "000000",
      // highlightShadowColor: "000000",
    },
    dark: {
      normalColor: "d1d1d165",
      highlightColor: "ffffff19",
      normalLowerEdgeColor: "00000080",
      highlightLowerEdgeColor: "00000080",
    },
  },

  "功能键背景" : {
    light: {
      normalColor: "00103429",
      highlightColor: "feffff",
      normalLowerEdgeColor: "0000004D",
      highlightLowerEdgeColor: "0000004D",
    },
    dark: {
      normalColor: "ffffff19",
      highlightColor: "d1d1d165",
      normalLowerEdgeColor: "00000080",
      highlightLowerEdgeColor: "00000080",
    },
  },

  "蓝色键背景" : {
    light: {
      normalColor: "23C891",
      highlightColor: "feffff",
      normalLowerEdgeColor: "0000004D",
      highlightLowerEdgeColor: "0000004D",
    },
    dark: {
      normalColor: "23C891",
      highlightColor: "d1d1d165",
      normalLowerEdgeColor: "00000080",
      highlightLowerEdgeColor: "00000080",
    },
  },

  "提示背景": {
    light: {
      // normalColor: "ffffff03",
      // normalBorderColor: "000000", 
    },
    dark: {
      // normalColor: "00000003",
      // normalBorderColor: "000000", 
    },
  },

  "长按背景" : {
    light: {
      normalColor: "FCFCFE",
      normalShadowColor: "797B7E", // 仓shadowColor
    },
    dark: {
      normalColor: "00000003",
      normalShadowColor: "00000050", 
    },
  },

  "长按选中背景" : {
    light: {
      highlightColor: "23c891", // 仓normalColor
    },
    dark: {
      highlightColor: "23c891",
    },
  },

  "字母按键前景" : {
    light: {
      normalColor: "000000",
      highlightColor: "000000",
    },
    dark: {
      normalColor: "000000",
      highlightColor: "000000",
    },
  },

  "功能键前景" : {
    light: {
      normalColor: "000000",
      highlightColor: "000000",
    },
    dark: {
      normalColor: "feffff",
      highlightColor: "feffff",
    },
  },

  "蓝色键前景" : {
    light: {
      normalColor: "feffff",
      highlightColor: "000000",
    },
    dark: {
      normalColor: "feffff",
      highlightColor: "feffff",
    },
  },

  "上划前景" : {
    light: {
      normalColor: "433C3C01",
      highlightColor: "433C3C99",
    },
    dark: {
      normalColor: "feffff01",
      highlightColor: "ffffff",
    },
  },

  "下划前景" : {
    light: {
      normalColor: "433C3C01",
      highlightColor: "433C3C99",
    },
    dark: {
      normalColor: "feffff01",
      highlightColor: "ffffff",
    },
  },

  "uppercased前景" : {
    light: {
      normalColor: "000000",
      highlightColor: "000000",
    },
    dark: {
      normalColor: "000000",
      highlightColor: "000000",
    },
  },

  "capsLocked前景" : {
    light: {
      normalColor: "000000",
      highlightColor: "000000",
    },
    dark: {
      normalColor: "000000",
      highlightColor: "000000",
    },
  },

  "提示前景" : {
    light: {
      normalColor: "000000",
    },
    dark: {
      normalColor: "000000",
    },
  },

  "长按前景" : {
    light: {
      normalColor: "000000",
      highlightColor: "feffff",
    },
    dark: {
      normalColor: "feffff",
      highlightColor: "ffffff",
    },
  },

  "工具栏按钮背景" : {
    light: {
      normalColor: "feffff",
      highlightColor: "00103429",
    },
    dark: {
      normalColor: "ffffff19",
      highlightColor: "d1d1d165",
    },
  },

  "工具栏按钮前景" : {
    light: {
      normalColor: "575757",
      highlightColor: "00B552",
    },
    dark: {
      normalColor: "feffffcc",
      highlightColor: "00E582",
    },
  },

  "预编辑区前景" : {
    light: {
      normalColor: "000000",
    },
    dark: {
      normalColor: "feffff",
    },
  },

  "候选字颜色" : {
    light: {
      highlightBackgroundColor: "FCFFFFE0",
      preferredBackgroundColor: "FCFFFFE0",
      preferredIndexColor: "5f5f5fff",
      preferredTextColor: "00B552FF",
      preferredCommentColor: "505050ff",
      indexColor: "5f5f5fff",
      textColor: "303030ff",
      commentColor: "505050ff",
    },
    dark: {
      highlightBackgroundColor: "d1d1d165",
      preferredBackgroundColor: "d1d1d165",
      preferredIndexColor: "dfdfdfff",
      preferredTextColor: "00E582ff",
      preferredCommentColor: "dfdfdf",
      indexColor: "5c5c5c",
      textColor: "dfdfdf",
      commentColor: "cfcfcf",
    },
  },

};



local nativeConfig = {

  "背景色通用参数":{
    cornerRadius: 7,
    // borderSize: 3,
    // shadowRadius: 2,
    shadowOffset: { x: 0, y: 3 },
    shadowOpacity: 0.8,
  },

  "渐变色通用参数": {
    colorGradientType: "axial", // radial, conic
    colorLocation: [0, 1],
    colorStartPoint: { x: 0.5, y: 0 },
    colorEndPoint: { x: 0.5, y: 1 },
  },

  "横向候选展开按钮前景": {
    light: {
      normalColor: "000000",
      highlightColor: "000000",
    },
    dark: {
      normalColor: "feffff",
      highlightColor: "feffff",
    },
  },

  "纵向候选区域样式": {
    light: {
      backgroundColor: "1336480d", // 仓专用
      separatorColor: "ADADAD",
    },
    dark: {
      backgroundColor: "0000004d",
      separatorColor: "383838",
    },
  },
  
  "纵横候选列表其他参数": {
    itemSpacing: 6, // 仓横向候选间隙
    cornerRadius: 9,
    "最大横向候选字显示数量": 8,
    "最大纵向候选字列表行数": 6,
    "最大纵向候选字列表列数": 6,
  },

};



{
  nativeConfig: nativeConfig,
  themeColor: themeColor
  // themeColor: if true then themeColor else {}
}