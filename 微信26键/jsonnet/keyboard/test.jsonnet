// alphabet_main.libsonnet

local Imports = import '../lib/imports.libsonnet';
local utils = import "../lib/utils.libsonnet";
local pinyin = import 'pinyin_26.jsonnet';
local alphabetic_26 = import 'alphabetic_26.jsonnet';
local numer_26 = import 'numer_26.jsonnet';
local symbol_26 = import 'symbol_26.jsonnet';


local app = "cskin";
local device = "iphone";
local orientation = "portrait";
local theme = "light";

pinyin(app, device, orientation, theme)
// Imports.getHeight(device, orientation, "notToolbar")

// jsonnet .\test.jsonnet -o .\alphabet.yaml -J .