local merge = require("utils.merge")
local values = require("config.values")

local palette = {
  --lualine
	purple = "#BE94F9",
}

local colors = {
	--INFO:gruvbox-material, tabs
	gruvbox_material = {
		nbg = "#141617",
		sbg = "#BAA991",
		tfg = "#d4be98",
		nbgl = "#433E3B",

    --lualine
		bg_a = "#a9b665",
		fg_b = "#d8a657",
		bg_b = "#393836",
    fg_b_i = "#d3869b"
	},

	--INFO: kanagawa
	kanagawa = {
    -- tabs
		nbg = "#181825", -- active fg
		sbg = "#8ba4b0", -- active bg
		tfg = "#8a9aa3", -- inactive fg
		nbgl = "#433E3B", -- inactive bg

		-- lualine
		bg_a = "#a292a3",
		fg_b = "#7E9CD8",
		bg_b = "#393836",
    fg_b_i = "#87a987"
	},
}

if values.theme.name == "kanagawa" then
	return merge({ palette, colors.kanagawa })
elseif values.theme.name == "gruvbox-material" or values.theme.name == "gruvbox" then
	return merge({ palette, colors.gruvbox_material })
elseif values.theme.name == "everforest" then
	return merge({ palette, colors.kanagawa })
end
