local wezterm = require 'wezterm'
local home = os.getenv("USERPROFILE") or os.getenv("HOME") or ((type(wezterm.home_dir) == "function" and wezterm.home_dir()) or (type(wezterm.home_dir) == "string" and wezterm.home_dir) ) or "."
local config_dir = (type(wezterm.config_dir) == "function" and wezterm.config_dir()) or (type(wezterm.config_dir) == "string" and wezterm.config_dir) or ""

return {
    -- font = wezterm.font 'Dank Mono',
    -- font_size = 11,
    -- -- dpi = 144.0,
    -- tab_max_width = 14,
    -- color_scheme = "Gruvbox Dark (Gogh)", --"nordfox",
    -- window_decorations = 'RESIZE',
    -- -- window_background_opacity = 0.9,
    -- tab_bar_at_bottom = true,
    -- use_fancy_tab_bar = false,

  -- NOTE: tab bar
  hide_tab_bar_if_only_one_tab = false,
  enable_tab_bar = true,
  show_tab_index_in_tab_bar = false,
  tab_bar_at_bottom = false,
  use_fancy_tab_bar = false,
  -- enabe_scroll_bar = false,

  --NOTE: General
	use_ime = true,
	use_dead_keys = false,
	warn_about_missing_glyphs = false,
	enable_kitty_graphics = true,
	animation_fps = 1,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	cursor_blink_rate = 0,
  default_cursor_style = "BlinkingBar", -- default: 'SteadyBlock'

	enable_csi_u_key_encoding = true,
	enable_wayland = false,
	adjust_window_size_when_changing_font_size = false,

  -- default_prog = { 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe', '-NoLogo', '-NoProfile' },
  default_prog = { 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe', '-NoLogo' },


  window_frame = {active_titlebar_bg = "#181818", font_size = 11},

 --NOTE: bg img (Windows-friendly)
  window_background_image = home .. "\\Pictures\\win.jpg",
  window_background_image_hsb = {
    brightness = 0.10, --0.02,
    hue = 1.0,
    saturation = 1.0
  },
  --NOTE: bg opacity
  window_background_opacity = 1.0,
  window_decorations = "RESIZE",--INTEGRATED_BUTTONS NONE RESIZE

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  --NOTE: font
  -- warn_about_missing_glyphs = false,
  font = wezterm.font_with_fallback {
    -- 'Consolas',
    'Dank Mono',
    -- 'nonicons',
    'Symbols Nerd Font'
  },
  font_rules = {}, --controlar italic bold etc...
  font_size = 11,

  -- For example, changing the color scheme:
  -- Gruvbox dark, medium (base16)
  -- GruvboxDark
  -- Gruvbox Material (Gogh)
  -- Kanagawa (Gogh)
  color_scheme = "kanagawa",
  color_scheme_dirs = {
    home .. "\\.config\\wezterm\\colors\\",
    config_dir .. "/../colors",
  },

  colors = {
    tab_bar = {
      -- The color of the inactive tab bar edge/divider
      background = '#252623',
      new_tab = {bg_color = '#252623', fg_color = '#d4be98'},
    },
  },

	disable_default_key_bindings = true,
}
