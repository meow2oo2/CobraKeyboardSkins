// lib/effects/animation.libsonnet

// 放大或缩小的动画
local scaleAnimation = {
  animationType: "scale",
  isAutoReverse: true,
  scale: 0.87,
  pressDuration: 40,
  releaseDuration: 80
};

// 用于替代 apng 图片类型的动画
local cartoonAnimation = {
    animationType: "cartoon",
    fps: 60,
    images: [
      std.format("cartoon_%02d.png", i)
      for i in std.range(1, 28)
    ],
    zPosition: "below", // above
    // targetScale: { x: 0, y: 0 },
    // center: { x: 0, y: 0 },
  };

// 用于替换之前 emit 动画
local physicsAnimation = {
  animationType: "physics",
  duration: 1500,
  images: [
    "lleeimage_0.png",
    "lleeimage_1.png",
  ],
  randomImage: true,
  randomPosition: { x: 50, y: 10 },
  startPosition: { x: 0, y: 0 },
  endPosition: { x: 0, y: -70 },
  useOpacity: true,
  startOpacity: 1,
  endOpacity: 0.2,
  useRotation: true,
  randomAngle: 6.28,
  startAngle: 0,
  endAngle: 6.28,
  // targetScale: { x: 0, y: 0 },
};

  // 仓按键背景动画
local backgroundAnimation = [
    {
      type: "bounds",
      duration: 40,
      repeatCount: 1,
      fromScale: 1,
      toScale: 0.87,
    },
    {
      type: "bounds",
      duration: 80,
      repeatCount: 1,
      fromScale: 0.87,
      toScale: 1,
    }
  ];

    // 仓按键前景动画
local foregroundAnimation = [
    {
      type: "bounds",
      duration: 40,
      repeatCount: 1,
      fromScale: 1,
      toScale: 0.87,
    },
    {
      type: "bounds",
      duration: 80,
      repeatCount: 1,
      fromScale: 0.87,
      toScale: 1,
    }
  ];

local setCskinAnimationName = [
  "scaleAnimation"
];
local setHskinBackgroundAnimationName = "backgroundAnimation";
local setHskinForegroundAnimationName = "foregroundAnimation";

local setCskinAnimation = {
  scaleAnimation: scaleAnimation,
};

local setHskinAnimation = {
  backgroundAnimation: backgroundAnimation,
  foregroundAnimation: foregroundAnimation
  
};

local getAnimation(app) = 
  if app=="cskin" then setCskinAnimation else if app=="hskin" then setHskinAnimation ;


    
{
  getAnimation: getAnimation,

  scaleAnimation: scaleAnimation,
  cartoonAnimation: cartoonAnimation,
  physicsAnimation: physicsAnimation,

  backgroundAnimation: backgroundAnimation,
  foregroundAnimation: foregroundAnimation,

  setCskinAnimationName: setCskinAnimationName,
  setHskinBackgroundAnimationName: setHskinBackgroundAnimationName,
  setHskinForegroundAnimationName: setHskinForegroundAnimationName
}



