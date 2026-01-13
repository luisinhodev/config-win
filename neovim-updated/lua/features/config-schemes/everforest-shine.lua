local values = require('config.values')
local g = vim.g
local cmd = vim.cmd                   -- execute Vim commands
-- local opt = vim.opt

-- opt.termguicolors = true      -- enable 24-bit RGB colors

cmd [[
  let g:everforest_colors_override = {'bg0': ['#202020', '234'], 'bg2': ['#282828', '235']}
]]

 -- let g:everforest_colors_override = {'bg0': ['#1E2326', '234'], 'bg2': ['#5E5E5E', '235']}
-- let g:everforest_colors_override = {'bg0': ['#202020', '234'], 'bg2': ['#282828', '235']}

local bg = 0
if values.theme.transparent then
  bg = 2
end


g.everforest_background = values.theme.variant -- " Available values: 'hard', 'medium'(default), 'soft'
g.everforest_better_performance = 1 ----`0`, `1`
g.everforest_enable_italic = 1  --`0`, `1`
g.everforest_disable_italic_comment = 1 -- `0`, `1`
g.everforest_cursor = 'auto'  --`d:'auto'`, `'red'`, `'orange'`, `'yellow'`, `'green'`, `'aqua'`, `'blue'`, `'purple'`
g.everforest_transparent_background = bg --`0`, `1`, `2`
g.everforest_dim_inactive_windows = 1 -- `0`, `1`
g.everforest_sign_column_background = 'none' --`d:'none'`, `'grey'`
g.everforest_spell_foreground = 'colored'-- `d:'none'`, `'colored'`
g.everforest_ui_contrast = 'low' -- `d:'low'`, `'high'`
g.everforest_show_eob = 1 -- d:`1`, `0`
g.everforest_float_style = 'dim' -- `d:'bright'`, `'dim'`
g.everforest_diagnostic_text_highlight = 1 -- d:`0`, `1`
g.everforest_diagnostic_line_highlight = 1 -- d:`0`, `1`
g.everforest_diagnostic_virtual_text = 'colored' --d:'grey'`, `'colored'`, `'highlighted'`
g.everforest_current_word = 'grey background' --" `'grey background'`, `'bold'`, `'underline'`, `'italic' = default =  `'grey background'` when not in transparent mode, `'bold'`
g.everforest_lightline_disable_bold = 1 -- d:`0`, `1`

-- vim.cmd("colorscheme everforest")
