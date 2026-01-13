local values = require("config.values")
local bg = values.lualine.transparent

local colors = {
	color0 = "#12120f", --
	color1 = "#494643", --
	color2 = "#c5c9c5", --
	color3 = "#32302f",
	color4 = "#8ba4b0", --
	color5 = "#a292a3", --
	color6 = "#87a987", --
	color7 = "#c4b28a", --
	color8 = "#d3869b",
	color9 = "#c4746e", --
	color10 = "#2E2924",
}

return {
  normal = {
		a = { bg = colors.color4, fg = colors.color0, gui = "bold" },
		b = bg == 1 and { bg = "none", fg = colors.color5 } or { bg = colors.color1, fg = colors.color7 },
		c = bg == 1 and { bg = "none", fg = "none" } or { bg = colors.color3, fg = colors.color4 },
	},

	insert = {
		a = { bg = colors.color5, fg = colors.color0, gui = "bold" },
		b = bg == 1 and { bg = "none", fg = colors.color6 } or { bg = colors.color1, fg = colors.color6 },
		c = bg == 1 and { bg = "none", fg = "none" } or { bg = colors.color3, fg = "none" },
	},
	visual = {
		a = { bg = colors.color6, fg = colors.color0, gui = "bold" },
		b = bg == 1 and { bg = "none", fg = colors.color7 } or { bg = colors.color1, fg = colors.color7 },
		c = bg == 1 and { bg = "none", fg = "none" } or { bg = colors.color10, fg = colors.color6 },
	},
	replace = {
		a = { bg = colors.color9, fg = colors.color0, gui = "bold" },
		b = bg == 1 and { bg = "none", fg = colors.color2 } or { bg = colors.color1, fg = colors.color2 },
		c = bg == 1 and { bg = "none", fg = "none" } or { bg = colors.color0, fg = colors.color2 },
	},
	command = {
		a = { bg = colors.color6, fg = colors.color0, gui = "bold" },
		b = bg == 1 and { bg = "none", fg = "none" } or { bg = colors.color1, fg = colors.color2 },
		c = bg == 1 and { bg = "none", fg = "none" } or { bg = colors.color10, fg = colors.color0 },
	},
	inactive = {
		a = { bg = colors.color3, fg = colors.color4, gui = "bold" },
		b = bg == 1 and { bg = "none", fg = "none" } or { bg = colors.color3, fg = colors.color4 },
		c = bg == 1 and { bg = "none", fg = "none" } or { bg = colors.color3, fg = colors.color4 },
	},
}
-- require('lualine').setup {options = {theme = gruvbox}}
