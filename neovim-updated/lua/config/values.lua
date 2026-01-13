-- local gruvbox = require('features.ui.gruvbox')

local values = {
  -- available themes:

  -- theme 1
  -- gruvbox-material
  -- variant values: 'hard', 'medium'(default), 'soft'

  -- theme 1
  -- fox
  -- variant values: nightfox, duskfox, nordfox, terafox, carbonfox

  -- everforest
  -- variant values: 'hard', 'medium'(default), 'soft'

  -- everforest-nvim
  -- variant values: 'hard', 'medium'(default), 'soft'

  -- kanagawa
  -- variant values: 'wave', 'dragon'

  theme = {
    name = 'kanagawa',
    variant = 'wave',
    transparent = false
  },

  lualine = {
    -- auto, kanagawa, gruvbox-material ...
    theme = 'kanagawa',
    transparent = 0 -- 1 or 0
  },

  syntax = {
    pug = false,
    jinja = true,
    astro = false
  },

  servers = {
    emmet_language_server = true,
    html = true,
    cssls = true,
    jsonls = true,
    prismals = true,
    lua_ls = true,
    marksman = false,
    pyright = false,
    pylsp = true,
    tailwindcss = true,
    ts_ls = true,
    vue_ls = true,
    vtsls = false,
    angularls = true,
    svelte = false
  },

  lint = false
}

return values
