local wezterm = require("wezterm")
local palette = require('colors.colors')
local icons = require('utils.icons')

local M = {}

-- Hide window title
wezterm.on("format-window-title", function(_, _, _, _, _)
    -- Hyprland doesn't have an Alt-tab previewer, so you can get lost easily.
    -- You need to add a title to the app.
    -- return "Wezterm"
    return ""
end)

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- default title.
function M.tab_title(tab)
    local title = tab.tab_title
    -- if the tab title is explicitly set, take that
    if title and #title > 0 then
        return title
    end
    -- Otherwise, use the default title.
    return "Tab"
    -- return "Tab #" .. tab.tab_index + 1
end

wezterm.on("format-tab-title", function(tab, _, _, _, _, max_width)

  local solid_left_arrow = icons.SOLID_LEFT_ARROW --"" --""
  local solid_right_arrow = icons.SOLID_RIGHT_ARROW --"" --""

  local SUP_IDX = {"¹","²","³","⁴","⁵","⁶","⁷","⁸","⁹","¹⁰",
                   "¹¹","¹²","¹³","¹⁴","¹⁵","¹⁶","¹⁷","¹⁸","¹⁹","²⁰"}
  local SUB_IDX = {"₁","₂","₃","₄","₅","₆","₇","₈","₉","₁₀",
                   "₁₁","₁₂","₁₃","₁₄","₁₅","₁₆","₁₇","₁₈","₁₉","₂₀"}


  -- Edge icon color
  local edge_icon_bg = palette.dark_0
  local edge_icon_fg = palette.dark_0

  -- Inactive tab
  local tab_bg_color = palette.dark_1
  local tab_fg_color = palette.white_1

  if tab.is_active then
    tab_bg_color = palette.white_0
    tab_fg_color = palette.dark_1
  end

  edge_icon_fg = tab_bg_color
  local title = M.tab_title(tab)

  local icon_title
  if title == "nvim" then
    icon_title = icons.NVIM
  elseif title == "vim" then
    icon_title = icons.VIM
  elseif title == "pnpm" then
    icon_title = icons.OBJECT
  elseif title == "htop" then
    icon_title = icons.HOURGLASS_ICON
  else
    icon_title = icons.ZSH_ICON
  end

  local icon = " " .. wezterm.truncate_right(icon_title, max_width-6) .. " "
  local id = SUB_IDX[tab.tab_index+1]
  local pid = SUP_IDX[tab.active_pane.pane_index+1]

  return {
    { Background = { Color = edge_icon_bg } },
    { Foreground = { Color = edge_icon_fg } },
    { Text = solid_left_arrow },
    { Background = { Color = tab_bg_color } },
    { Foreground = { Color = tab_fg_color } },
    { Text = id },
    { Text = icon },
    { Text = " " .. title .. " " },
    { Text = pid },
    { Background = { Color = edge_icon_bg } },
    { Foreground = { Color = edge_icon_fg } },
    { Text = solid_right_arrow },
  }
end)
