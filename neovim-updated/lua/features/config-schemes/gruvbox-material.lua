local g = vim.g                       -- global variables
local cmd = vim.cmd                   -- execute Vim commands
local values = require('config.values')

-- local opt = vim.opt

-- opt.termguicolors = true      -- enable 24-bit RGB colors
 -- let g:gruvbox_material_colors_override = {'bg0': ['#181818', '234'], 'bg2': ['#202020', '235']}

-- bg0 = #252623, #181818

cmd [[
 let g:gruvbox_material_colors_override = {'bg0': ['#181818', '234'], 'bg2': ['#252623', '235'] }
]]

local bg = 0
if values.theme.transparent then
  bg = 2
end

 g.gruvbox_material_background = values.theme.variant
 g.gruvbox_material_better_performance = 1
 g.gruvbox_material_foreground = 'material'  --"`'material'`, `'mix'`, `'original'`
 g.gruvbox_material_enable_bold = 1 --"function name bold `1`
 g.gruvbox_material_enable_italic = 1
 g.gruvbox_material_disable_italic_comment = 0
 g.gruvbox_material_transparent_background = bg --"default `0` `1`bg `2`bg & status
 g.gruvbox_material_visual = 'reverse' --"Available values:   `'grey background'`, `'green background'`, `'blue background'`, `'red background'`, `'reverse'`
g.gruvbox_material_menu_selection_background = 'orange' --  `'grey'`, `'red'`, `'orange'`, `'yellow'`, `'green'`, `'aqua'`, `'blue'`, `'purple'`
 g.gruvbox_material_ui_contrast = 'high' --" high, low
 g.gruvbox_material_diagnostic_text_highlight = 1
g.gruvbox_material_diagnostic_line_highlight = 1 -- `0`, `1`
 g.gruvbox_material_diagnostic_virtual_text = 'colored' -- `'grey'`, `'colored'`, `'highlighted'`
 -- g.gruvbox_material_current_word = 'grey background' --" `grey background`, `underline` `italic` `bold`
-- g.gruvbox_material_sign_column_background = 'none' -- `'none'`, `'grey'`
g.gruvbox_material_spell_foreground = 'colored' -- `'none'`, `'colored'`
g.gruvbox_material_float_style = 'dim' -- `'bright'`, `'dim'`
g.gruvbox_material_statusline_style = 'mix' --`'default'`, `'mix'`, `'original'`
g.gruvbox_material_lightline_disable_bold = 1 -- `0`, `1`
