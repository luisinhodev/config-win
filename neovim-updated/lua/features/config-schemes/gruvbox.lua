local values = require("config.values")

vim.cmd([[
      autocmd InsertEnter * highlight  CursorLine guibg=#2C2830
      autocmd InsertLeave * highlight  CursorLine guibg=#202D2A
    ]])

require("gruvbox").setup({
	terminal_colors = true, -- add neovim terminal colors
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = true,
		emphasis = true,
		comments = true,
		operators = false,
		folds = false,
	},
	strikethrough = true,
	invert_selection = true,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = values.theme.variant, -- can be "hard", "soft" or empty string
	palette_overrides = {
		dark0 = "none", -- "#181818",
		dark1 = "none", -- "#181818",
		dark2 = "none", -- "#282A2A", --popup
		-- dark3 = "#928474", -- num left

		light0 = "#d4be98", --
		light1 = "#bdae93", --
		bright_red = "#ea6962", --
		bright_green = "#a9b665", --#AA99BB
		bright_yellow = "#d8a657", --
		bright_blue = "#7daea3", --
		bright_purple = "#d3869b", --
		bright_aqua = "#8ec07c", --
		bright_orange = "#e78a4e", --

		neutral_red = "#ea6962", --
		-- gray = "#928374",
	},
	overrides = {
		SignColumn = { bg = "" },
		CursorLine = { bg = "#202D2A" },
    NeoTreeGitUntracked = { fg = "#d8a657" },

		["@tag"] = { fg = "#e78a4e" },
		["@tag.delimiter"] = { fg = "#a9b665" },
		["@tag.attribute"] = { fg = "#a9b665" },
	},
	dim_inactive = true,
	transparent_mode = values.theme.transparent, -- ...
})
