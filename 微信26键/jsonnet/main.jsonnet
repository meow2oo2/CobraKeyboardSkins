local pinyin = import 'keyboard/pinyin_26.jsonnet';


local pinyinPortraitFileName = 'pinyinPortrait';
local lightPinyinPortraitFileContent = pinyin(isDark=false, isPortrait=true);
local darkPinyinPortraitFileContent = pinyin(isDark=true, isPortrait=true);

local pinyinLandscapeFileName = 'pinyinLandscape';
local lightPinyinLandscapeFileContent = pinyin(isDark=false, isPortrait=false);
local darkPinyinLandscapeFileContent = pinyin(isDark=true, isPortrait=false);

local config = {

  name: "原生iOS26键",
  author: "meow",

  pinyin: {
    iPhone: {
      portrait: pinyinPortraitFileName,
      landscape: pinyinLandscapeFileName,
    },
  },

};

{
  ["config.yaml"]: std.manifestYamlDoc(config, indent_array_in_object=true, quote_keys=false),

  ['light/' + pinyinPortraitFileName + '.yaml']: std.toString(lightPinyinPortraitFileContent),
  ['dark/' + pinyinPortraitFileName + '.yaml']: std.toString(darkPinyinPortraitFileContent),
  ['light/' + pinyinLandscapeFileName + '.yaml']: std.toString(lightPinyinLandscapeFileContent),
  ['dark/' + pinyinLandscapeFileName + '.yaml']: std.toString(darkPinyinLandscapeFileContent),

}



// 拼音键盘
// TODO: 这里用 std.toString 代替 std.manifestYamlDoc 是为了避免 jsonnet 在处理非常大的内容时耗时太严重
// 在 PC 上调试的时候可以使用，方便排查问题
// ['light/' + pinyinPortraitFileName + '.yaml']: std.manifestYamlDoc(lightPinyinPortraitFileContent, indent_array_in_object=false, quote_keys=false),