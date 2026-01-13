local values = require('config.tab-theme')

local kanagawa = {
  --INFO: kanagawa
  dark_0 = "#252623",
  dark_1 = "#433E3B",
  white_0 = "#8ba4b0",
  white_1 = "#8a9aa3",

  --NOTE: right status
  colors = {
    --INFO: kanagawa
    '#252623',
    '#8ba4b0',
    '#8a9aa3',
    '#8ea4a2',
    '#433e3b',
  }
}

local gruv_material = {
  --PERF: gruvbox-material
  dark_0 = "#252623",
  dark_1 = "#433E3B",
  white_0 = "#BAA991",
  white_1 = "#ddc7a1",

  --PERF: right status
  colors = {
    --PERF: gruvbox-material
    '#252623',
    '#d4be98',
    '#a89984',
    '#928374',
    '#433e3b',

  }
}

if values.theme == 'kanagawa' then
  return kanagawa
elseif values.theme == 'gruvbox-material' then
  return gruv_material
end
