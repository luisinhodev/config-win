local kanagawa = require "features.ui.kanagawa"

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local icon = require("features.ui.icons")
		local values = require("config.values")
		local colors = require("features.ui.colors")
    local gruvbox = require "features.ui.gruvbox"
		-- local theme_custom = require("utils.custom-theme")
		--
		-- local custom_theme = require("lualine.themes." .. values.lualine.theme)
		-- local theme = theme_custom(custom_theme)
		local t_lualine = values.lualine.theme

		-- Config
		local config = {
			options = {
				-- Disable sections and component separators
				component_separators = { left = "⁝", right = "⁝" }, -- 
				section_separators = { left = "", right = "" },
        -- theme = gruvbox
				theme = (
          t_lualine == "kanagawa" and kanagawa or
          t_lualine == "gruvbox-material" and gruvbox or
          t_lualine == "gruvbox" and gruvbox or
          t_lualine
        )
				-- fmt = string.upper
			},
			sections = {
				-- these are to remove the defaults
				lualine_a = { { "mode", icon = " " } },
				lualine_b = {
					{
						"filename",
						icon = icon.fs.File,
						separator = { right = not values.theme.transparent and "" or "" },
						symbols = { modified = "" },
						color = { gui = "bold" },
					},
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {
					{
						"location",
						icon = icon.misc.Location,
						padding = { left = 1, right = 0 },
					},
					{
						"progress",
						icon = icon.custom.Crates,
						separator = { left = " " },
						padding = { left = 1, right = 1 },
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = { "filename" },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		}

		-- Inserts a component in lualine_c at left section
		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		-- Inserts a component in lualine_x at right section
		local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		ins_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", hint = " ", warn = " ", info = " " },
		})

		ins_right({
			"filetype",
			icon_only = false,
			-- fmt = string.upper, -- I'm not sure why it's upper case either ;)
			color = { gui = "italic" },
			-- padding = { left = 1, right = 0}, -- We don't need space before this
		})
		ins_right({
			"diff",
			symbols = { added = " ", modified = "  ", removed = " " },
			-- symbols = { added = ' ', modified = "󰝤 " | '柳 ', removed = ' ' },
		})

		ins_right({
			"branch",
			icon = icon.custom.Octoface .. " ",
			color = { fg = colors.purple, gui = "bold" },
		})

		require("lualine").setup(config)
	end,
}
