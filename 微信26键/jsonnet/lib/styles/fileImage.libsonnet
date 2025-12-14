// lib/templates/fileImage.libsonnet

local name = (import '../imports.libsonnet').name;

local defaultOffset = {
  targetScale: {},
  center: {},
};

local backgroundStyle = {
  "键盘区背景" : {
    normalImage: { file: "anjian26", image: "IMG1" },
  },
  "预编辑区背景" : {
    normalImage: { file: "anjian26", image: "IMG1" },
  },
  "工具栏区背景" : {
    normalImage: { file: "anjian26", image: "IMG1" },
  },
  "字母键背景" : {
    normalImage: { file: "anjian26", image: "IMG1" },
    highlightImage: { file: "anjian26", image: "IMG2" }, 
  },
  "功能键背景" : {
    normalImage: { file: "anjian26", image: "IMG1" },
    highlightImage: { file: "anjian26", image: "IMG2" }, 
  },
  "蓝色键背景" : {
    normalImage: { file: "anjian26", image: "IMG1" },
    highlightImage: { file: "anjian26", image: "IMG2" }, 
  },
  "提示背景" : {
    normalImage: { file: "hint", image: "IMG1" },
    contentMode: "scaleAspectFill"
  }, 
  "长按背景" : {
    normalImage: { file: "anjian26", image: "IMG1" },
  },
  "长按选中背景" : {
    normalImage: { file: "anjian26", image: "IMG1" },
  },
  "纵向一级分类列表选中背景" : {
    normalImage: { file: "anjian26", image: "IMG1" },
  },
  "纵向一级分类列表背景" : {
    normalImage: { file: "anjian26", image: "IMG1" },
  },
  "纵向二级分类列表选中背景" : {
    normalImage: { file: "anjian26", image: "IMG1" },
  },
  "纵向二级分类列表背景" : {
    normalImage: { file: "anjian26", image: "IMG1" },
  },
  
};

local foregroundStyle = {

[name.buttonName.qButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.wButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.eButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.rButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.tButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.yButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.uButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.iButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.oButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.pButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.aButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.sButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.dButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.fButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.gButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.hButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.jButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.kButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.lButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.zButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.xButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.cButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.vButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.bButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.nButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.mButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},


[name.buttonName.shiftButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  uppercasedStateForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
  capsLockedStateForegroundStyle: self.uppercasedStateForegroundStyle{},
  hintForegroundStyle: {
    normalImage: { file: "letter", image: "IMG36" }
  }
},
[name.buttonName.backspaceButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
},
[name.buttonName.ottButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
},
[name.buttonName.spaceButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
},
[name.buttonName.enterButton]: { 
  foregroundStyle: {
    normalImage: { file: "letter", image: "IMG36" },
    highlightImage: { file: "letter", image: "IMG36" },
    targetScale: defaultOffset.targetScale,
    center: defaultOffset.center
  },
},

};


local extraImageStyle = {

  "工具栏主按钮前景": {
    foregroundStyle: {
      insets: { top: 3, bottom: 3, left: 5, right: 5 },
      normalImage: { file: "logo", image: "IMG1" },
      highlightImage: { file: "logo", image: "IMG1" },
    },
  },
  "横向候选展开按钮前景": {
    foregroundStyle: {
      normalImage: { file: "letter", image: "IMG36" },
      highlightImage: { file: "letter", image: "IMG36" },
    },
  },
  "纵向候选收起按钮前景": {
    foregroundStyle: {
      normalImage: { file: "letter", image: "IMG36" },
      highlightImage: { file: "letter", image: "IMG36" },
    },
  },

};




backgroundStyle
+ foregroundStyle
+ extraImageStyle
