// lib/utils.libsonnet

local extractCells(obj) =
  if std.objectHas(obj, "Cell") then [obj.Cell]
  else if std.objectHas(obj, "subviews") && std.type(obj.subviews) == "array" then
    std.flattenArrays([extractCells(subview) for subview in obj.subviews])
  else if std.objectHas(obj, "HStack") then
    extractCells(obj.HStack)
  else if std.objectHas(obj, "VStack") then
    extractCells(obj.VStack)
  else [];

local removeField(obj, field, include_hidden=false) =
  if std.objectHasEx(obj, field, include_hidden) then (obj - field) else obj;

local removeFields(obj, fields, include_hidden=false) =
  local fieldList =
    if std.type(fields) == "string" then [fields]
    else if std.type(fields) == "array" then fields
    else error "removeFields: 'fields' must be string or array";
  std.foldl(
    function(o, f)
      if std.type(f) != "string" then
        error "removeFields: field name must be string, got %s"
      else removeField(o, f, include_hidden),
    fieldList,  
    obj  
  );

local tail(arr, n=1) = arr[n:];

local objectHasAtPath(obj, path) =
  if std.length(path) == 0 then error "path must not be empty"
  else if obj == null then false
  else (
    local head = path[0];
    local rest = tail(path);
    if std.length(path) == 1 then (
      if std.type(obj) == "object" && std.type(head) == "string" then head in obj
      else if std.type(obj) == "array" && std.type(head) == "number" && head >= 0 && head < std.length(obj) then true else false
    ) else (
      if std.type(obj) == "object" && std.type(head) == "string" && (head in obj) then
        objectHasAtPath(obj[head], rest)
      else if std.type(obj) == "array" && std.type(head) == "number" && head >= 0 && head < std.length(obj) then objectHasAtPath(obj[head], rest) else false
    )
  );

local getValueAtPath(obj, path) =
  if std.length(path) == 1 then obj[path[0]]
  else getValueAtPath(obj[path[0]], tail(path));

local normalizePaths(spec) =
  if std.type(spec) != "array" then
    error "spec must be an array"
  else if std.length(spec) == 0 then
    error "empty path not allowed" 
  else [
    if std.type(item) == "string" then [item] 
    else if std.type(item) == "array" then item 
    else error "must be a strings or numbers"
    for item in spec
  ];

local isEmptyValue(v) = v == null ||
  (std.type(v) == "object" && std.length(std.objectFields(v)) == 0) ||
  (std.type(v) == "array" && std.length(v) == 0);

local extractAtPaths(obj, spec) =
  local paths = normalizePaths(spec);
  local raw = {
    [std.toString(p[std.length(p) - 1])]: getValueAtPath(obj, p)
    for p in paths
    if objectHasAtPath(obj, p)};
  {
    [k]: raw[k]
    for k in std.objectFields(raw)
    if raw[k] != null && !isEmptyValue(raw[k]) // if raw[k] != null
  };

local getIn(obj, path, default={}) =
  if std.length(path) == 0 then obj // default
  else if obj == null then default
  else (
    local head = path[0];
    local tail = path[1:];
    if std.type(obj) == "object" && std.type(head) == "string" && (head in obj) then
      getIn(obj[head], tail, default)
    else if std.type(obj) == "array" && std.type(head) == "number" && head >= 0 && head < std.length(obj) then getIn(obj[head], tail, default)
    else default
  );

local getInBatch(obj, spec, default={}, filterEmpty=true) =
  local normalizedPaths = normalizePaths(spec);
  local rawResult = {
    [if std.length(p) == 0 then "" else std.toString(p[std.length(p) - 1])]: getIn(obj, p, default)
    for p in normalizedPaths
  };
  if filterEmpty then {
      [k]: rawResult[k]
      for k in std.objectFields(rawResult) 
      if rawResult[k] != null && !isEmptyValue(rawResult[k])
    }
  else rawResult;

local newBaseParamsAtFormat(params={}) =
  local list = std.set(['insets', 'targetScale', 'center', 'fontSize']);
  local orientationMap = { 'port': 'portrait', 'land': 'landscape', 'float': 'floating', 'flaot': 'floating' };
  local isDistributable(field) = std.setMember(field, list);
  local parseParamKey(keyStr) = if std.type(keyStr) != 'string' then null else
    local parts = std.split(keyStr, '.'); local len = std.length(parts);
    if len == 0 then null else (
      local p0=parts[0]; local p1=parts[1]; local p2=parts[2]; local p3=parts[3];
      local mkRes(skin, device, orient_alias, field) = if isDistributable(field) then { 
        skin: skin, device: device, orientation: orientationMap[orient_alias], field: field } else null;
      local mkResSimple(skin, device, orient, field) = if isDistributable(field) then { 
        skin: skin, device: device, orientation: orient, field: field } else null;
      if len == 1 then mkResSimple('both', 'iphone', 'portrait', p0)
      else if len == 2 && p0 == 'land' then mkResSimple('both', 'iphone', 'landscape', p1)
      else if len >= 3 && p0 == 'ipad' && std.objectHas(orientationMap, p1) then mkRes('both', 'ipad', p1, p2)
      else if len >= 2 && (p0 == 'cskin' || p0 == 'hskin') && isDistributable(p1) then mkResSimple(p0, 'iphone', 'portrait', p1)
      else if len >= 3 && (p0 == 'cskin' || p0 == 'hskin') && p1 == 'land' then mkResSimple(p0, 'iphone', 'landscape', p2)
      else if len >= 4 && p0 == 'cskin' && p1 == 'ipad' && std.objectHas(orientationMap, p2) then mkRes('cskin', 'ipad', p2, p3)
      else if len >= 4 && p0 == 'hskin' && p1 == 'ipad' && std.objectHas(orientationMap, p2) then mkRes('hskin', 'ipad', p2, p3)
      else null );
  local baseDeviceStructure = {
    cskin: { iphone: { portrait: {}, landscape: {} }, ipad: { portrait: {}, landscape: {}, floating: {} } },
    hskin: { iphone: { portrait: {}, landscape: {} }, ipad: { portrait: {}, landscape: {}, floating: {} } }
  };
  local filledStagingArea = std.foldl(
    function(stagingArea, paramKey)
      local parsedInfo = parseParamKey(paramKey);
      if parsedInfo == null then stagingArea else (
        local value = params[paramKey]; local s=parsedInfo.skin; 
        local d=parsedInfo.device; local o=parsedInfo.orientation; local f=parsedInfo.field;
        local u(skin) = stagingArea { [skin]+: { [d]+: { [o]+: { [f]: value } } } };
        if s == 'cskin' then u('cskin') else if s == 'hskin' then u('hskin') else if s == 'both' then u('cskin') { 
          hskin+: { [d]+: { [o]+: { [f]: value } } } } else stagingArea ),
    std.objectFields(params), baseDeviceStructure
  );
  local applyInheritance(structure) = (
    local s = structure;
    local ip_p = s.iphone.portrait; 
    local ip_l = std.mergePatch(ip_p, s.iphone.landscape);
    local ipa_p = std.mergePatch(ip_p, s.ipad.portrait); 
    local ipa_l = std.mergePatch(ip_l, s.ipad.landscape); 
    local ipa_f = std.mergePatch(ipa_p, s.ipad.floating);
    { iphone: { portrait: ip_p, landscape: ip_l }, ipad: { portrait: ipa_p, landscape: ipa_l, floating: ipa_f } }
  );
  std.mergePatch(params, { cskin: applyInheritance(filledStagingArea.cskin), hskin: applyInheritance(filledStagingArea.hskin) });

local extractProperty(obj, key) =
  if std.objectHas(obj, key) then { [key]: obj[key] }
  else {};

local extractProperties(obj, keys) =
  { [key]: obj[key] for key in keys if std.objectHas(obj, key) };
  
local getKeyboardActionText(params={}, key='action', style="style", isUppercase=false) =
  if std.objectHas(params, style) then
     params[style] 
  else if std.objectHas(params, key) then
    local action = params[key];
    if std.type(action) == 'object' then
      if std.objectHas(action, 'character') then
        local text = if isUppercase then std.asciiUpper(action.character) else action.character;
        { text: text }
      else if std.objectHas(action, 'symbol') then
        local text = if isUppercase then std.asciiUpper(action.symbol) else action.symbol;
        { text: text }
      else {}
    else {}
  else {};

local checkExists(pathsSpec, overrides) =
  local normalizedSpec = normalizePaths(pathsSpec);
  std.length([p for p in normalizedSpec if objectHasAtPath(overrides, p)]) > 0;

local newTypelessStyle(app, device, orientation, theme, overrides={}) =
  local base = extractAtPaths(overrides, [ // 这里粗暴提取,谨慎传参
    [app, device, orientation, "insets"], [app, device, orientation, "targetScale"],
    [theme, "normalColor"], [theme, "highlightColor"], [app, device, orientation, "center"], [app, device, orientation, "fontSize"], "normalImage", "highlightImage", "contentMode", "animation", "fontWeight", "systemImageName", "assetImageName", "text"
  ]);
  local toNumber(x) = if std.type(x) == "string" then std.parseJson(x) else x ;
  local shouldAdjustCenter = std.objectHas(base, "text") && std.objectHas(base, "center") &&
    std.type(base.center) == "object" && std.objectHas(base.center, "y");
  if shouldAdjustCenter then base{ center +: {y: toNumber(base.center.y) + 0.3 }} else base;

local newOriginalStyle(app, device, orientation, theme, overrides={}) =
  local type = { type: "original" };
  local basePaths = [
    [theme, "normalColor"], [theme, "highlightColor"], [theme, "normalBorderColor"], [theme, "highlightBorderColor"],
    [theme, "normalLowerEdgeColor"], [theme, "highlightLowerEdgeColor"], [theme, "normalShadowColor"], [theme, "highlightShadowColor"], 
    [app, device, orientation, "insets"], "cornerRadius", "borderSize", "shadowRadius", "shadowOffset", "animation"];
  type + extractAtPaths(overrides, basePaths);

local newGeometryStyle(app, device, orientation, theme, overrides={}) =
  local type = { buttonStyleType: "geometry" };
  local hasNormalGrad = checkExists([[theme, "normalColor"]], overrides) &&
    (std.objectHas(overrides, theme) && std.type(overrides[theme].normalColor) == "array" && std.length(overrides[theme].normalColor) == 2);
  local hasHighlightGrad = checkExists([[theme, "highlightColor"]], overrides) &&
    (std.objectHas(overrides, theme) && std.type(overrides[theme].highlightColor) == "array" && std.length(overrides[theme].highlightColor) == 2);
  local addGrad = hasNormalGrad || hasHighlightGrad;
  local hasAnyBorderColor = checkExists([[theme, "normalBorderColor"], [theme, "highlightBorderColor"]], overrides);
  local hasAnyShadowColor = checkExists([[theme, "normalShadowColor"], [theme, "highlightShadowColor"]], overrides);
  local base = [
    [theme, "normalColor"], [theme, "highlightColor"], [theme, "normalLowerEdgeColor"], [theme, "highlightLowerEdgeColor"],
    [theme, "normalBorderColor"], [theme, "highlightBorderColor"], [theme, "normalShadowColor"], [theme, "highlightShadowColor"], 
    [app, device, orientation, "insets"], "cornerRadius"
  ] + (if hasAnyBorderColor then ["borderSize"] else [])
    + (if hasAnyShadowColor then ["shadowRadius", "shadowOffset", "shadowOpacity"] else [])
    + (if addGrad then ["colorGradientType", "colorLocation", "colorStartPoint", "colorEndPoint"] else []);
  local merged = type + extractAtPaths(overrides, base);
  local defaultGradConfig = if addGrad then {
    colorGradientType: "radial", colorLocation: [0, 1], colorStartPoint: { x: 0.5, y: 0 }, colorEndPoint: { x: 0.5, y: 1 }
  } else {};
  defaultGradConfig + merged;

local newFileImageStyle(app, device, orientation, overrides={}) =
  local type = { buttonStyleType: "fileImage" };
  type + extractAtPaths(overrides, [
    [app, device, orientation, "insets"], [app, device, orientation, "center"],
    "normalImage", "highlightImage", "contentMode",
  ]);

local newSystemImageStyle(app, device, orientation, theme, overrides={}) =
  local type = { buttonStyleType: "systemImage" };
  local base = extractAtPaths(overrides, [
    [app, device, orientation, "insets"], [theme, "normalColor"], [theme, "highlightColor"], "contentMode", 
    [app, device, orientation, "center"], [app, device, orientation, "fontSize"], "fontWeight",
    "systemImageName", "highlightSystemImageName"
  ]);
  if objectHasAtPath(base, [app, device, orientation, "fontSize"]) && (base.fontSize < 20) then 
   type + base{ fontSize: base.fontSize + 4 } else type + base;

local newAssetImageStyle(app, device, orientation, theme, overrides={}) =
  local type = { buttonStyleType: "assetImage" };
  type + extractAtPaths(overrides, [
    [app, device, orientation, "insets"], [theme, "normalColor"], [theme, "highlightColor"], "contentMode", 
    [app, device, orientation, "center"], [app, device, orientation, "fontSize"], "fontWeight", "assetImageName"
  ]);

local newTextStyle(app, device, orientation, theme, overrides={}) =
  local type = { buttonStyleType: "text" };
  type + extractAtPaths(overrides, [
    [app, device, orientation, "insets"], [theme, "normalColor"], [theme, "highlightColor"],
    [app, device, orientation, "center"], [app, device, orientation, "fontSize"], "fontWeight", "text"
  ]);

local newManuStyle(app, device, orientation, theme, buttonStyleType, overrides={}) =
  if std.member([
    "geometry", "fileImage", "systemImage", "assetImage", "text"
  ], buttonStyleType) then
    if buttonStyleType == "geometry" then newGeometryStyle(app, device, orientation, theme, overrides)
    else if buttonStyleType == "fileImage" then newFileImageStyle(app, device, orientation, overrides)
    else if buttonStyleType == "systemImage" then newSystemImageStyle(app, device, orientation, theme, overrides)
    else if buttonStyleType == "assetImage" then newAssetImageStyle(app, device, orientation, theme, overrides)
    else if buttonStyleType == "text" then newTextStyle(app, device, orientation, theme, overrides)
    else
      {}
  else
    {};

local newAutoStyle(app, device, orientation, theme, overrides={}) =
  if app == "cskin" then
    local hasStyleType = std.objectHas(overrides, 'buttonStyleType');
    local hasColor = checkExists([[theme, "normalColor"], [theme, "highlightColor"]], overrides);
    local hasImage = checkExists(["normalImage", "highlightImage"], overrides);
    local hasSystemImageName = checkExists(["systemImageName", "highlightSystemImageName"], overrides);
    local hasAssetImageName = checkExists(["assetImageName"], overrides);
    local hasText = checkExists(["text"], overrides);
    local hasFontSize = checkExists([[app, device, orientation, "fontSize"],], overrides);
    if hasStyleType then newManuStyle(app, device, orientation, theme, overrides.buttonStyleType, overrides)
    else if hasImage && !hasColor then newFileImageStyle(app, device, orientation, overrides)
    else if hasColor && !hasImage then
      if hasSystemImageName then newSystemImageStyle(app, device, orientation, theme, overrides)
      else if hasAssetImageName then newAssetImageStyle(app, device, orientation, theme, overrides)
      else if hasText then newTextStyle(app, device, orientation, theme, overrides)
      else if hasFontSize then newTextStyle(app, device, orientation, theme, overrides)
      else newGeometryStyle(app, device, orientation, theme, overrides)
    else error "无法判断"
  else if app == "hskin" then
    local hasSpecificImageOrText = checkExists([
         "normalImage", "highlightImage", "systemImageName", "highlightSystemImageName", "assetImageName", "text", [app, device, orientation, "fontSize"]
      ], overrides);
    if hasSpecificImageOrText then newTypelessStyle(app, device, orientation, theme, overrides)
    else newOriginalStyle(app, device, orientation, theme, overrides)
  else error "Unsupported app: " + app;

local newStyleFactory(baseStyle, styleName=null) =
  function(app="cskin", device="iphone", orientation="portrait", theme="light", params={})
    local computedStyle = newAutoStyle(app, device, orientation, theme, baseStyle) + params;
    if styleName == null then computedStyle else { [styleName]: computedStyle };

local newBackgroundStyle(styleName='backgroundStyle', style) = { [styleName]: style };
local newForegroundStyle(styleName='foregroundStyle', style) = { [styleName]: [style] };

local makeParamValidator(
  validapps=["cskin", "hskin"],
  validDevices=["iphone", "ipad"],
  validThemes=["light", "dark"],
  validOrientationsByDevice={
    iphone: ["portrait", "landscape"],
    ipad: ["portrait", "landscape", "floating"],
  }) =
  function(app, device, orientation, theme)
    if !std.member(validapps, app) then
      error "!app"
    else if !std.member(validDevices, device) then
      error "!device"
    else if !std.member(validThemes, theme) then
      error "!theme"
    else if !(std.member(validOrientationsByDevice[device], orientation)) then
      error "!orientation"
    else true;

local sumHeights =
  local fromVh(s) = std.parseJson(std.substr(s, 0, std.length(s) - 2));
  local sumVh(arr) =
    if std.length(arr) == 0 then "0vh"
    else
      local sum = std.foldl(
        function(acc, v) acc + fromVh(v),
        arr,
        0
      );
      std.toString(sum) + "vh";
  function(arr)
    if std.length(arr) == 0 then 0
    else if std.type(arr[0]) == "string" then sumVh(arr) 
    else std.sum(arr);

local getProcessedActionData(data, mode='raw') = 
    if !(mode == 'character' || mode == 'symbol') then data else
    local fromField = if mode == 'character' then 'symbol' else 'character';
    local transformActionValue(val) =
      local valType = std.type(val);
      if valType == 'object' then
        local fields = std.objectFields(val); 
        local numFields = std.length(fields); 
        if numFields == 1 && fields[0] == fromField then
          { [mode]: val[fromField] } 
        else val 
      else val;
    local process(obj) =
      local objType = std.type(obj);
      if objType == 'object' then {
        [key]:
          if key == 'action' || key == 'uppercasedStateAction' then transformActionValue(obj[key]) 
            else process(obj[key])
          for key in std.objectFields(obj)
      } else obj;
    process(data);

local addActionBadgeStyle(action) =
  local isHalfWidthPunctuation(str) =
    std.length(str) == 1 &&
    std.member([
      "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/",
      ":", ";", "<", "=", ">", "?", "@", "[", "\\", "]", "^", "_", "`",
      "{", "|", "}", "~"
    ], str);

  local isFullWidthPunctuation(str) =
    std.length(str) == 1 &&
    std.member([
      "！", "＂", "＃", "＄", "％", "＆", "＇", "（", "）", "＊", "＋", "，", "－", "．", "／",
      "：", "；", "＜", "＝", "＞", "？", "＠", "［", "＼", "］", "＾", "＿", "｀",
      "｛", "｜", "｝", "～"
    ], str);

  local charToCheck =
  if std.type(action) == "object" then (
    if std.objectHas(action, "character") && std.length(action.character) == 1 then
      action.character
    else if std.objectHas(action, "symbol") && std.length(action.symbol) == 1 then
      action.symbol
    else null
  ) else null;
  if charToCheck != null then (
        if isHalfWidthPunctuation(charToCheck) then ["halfStyle"] 
        else if isFullWidthPunctuation(charToCheck) then ["fullStyle"] else []
      ) else [];








{
  getIn: getIn,
  getInBatch: getInBatch,
  extractCells: extractCells,
  removeField: removeField,
  removeFields: removeFields,
  objectHasAtPath: objectHasAtPath,
  extractAtPaths: extractAtPaths, // getInBatch
  newBaseParamsAtFormat: newBaseParamsAtFormat,
  extractProperty: extractProperty,
  extractProperties: extractProperties,
  getKeyboardActionText: getKeyboardActionText,
  newTypelessStyle: newTypelessStyle,
  newOriginalStyle: newOriginalStyle,
  newGeometryStyle: newGeometryStyle,
  newFileImageStyle: newFileImageStyle,
  newSystemImageStyle: newSystemImageStyle,
  newAssetImageStyle: newAssetImageStyle,
  newTextStyle: newTextStyle,
  newManuStyle: newManuStyle,
  newAutoStyle: newAutoStyle,
  newStyleFactory: newStyleFactory,
  newBackgroundStyle: newBackgroundStyle,
  newForegroundStyle: newForegroundStyle,
  makeParamValidator:makeParamValidator,
  sumHeights: sumHeights,
  getProcessedActionData: getProcessedActionData,
  addActionBadgeStyle: addActionBadgeStyle
}