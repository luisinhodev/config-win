local values = require('config.values')

require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = values.theme.transparent,
	styles = {
		comments = { "italic" },
		conditionals = {},
		loops = {},
		functions = {},
		keywords = { "italic" },
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = { "italic" },
	},
	color_overrides = {
		frappe = {},
		macchiato = {
			base = "#242424",
			mantle = "#242424",
			crust = "#474747",
		},
		mocha = {
			base = "#181818",
			mantle = "#181818",
			crust = "#181818",
		},
	},
	custom_highlights = {},
	integrations = {
		cmp = true,
		rainbow_delimiters = true,
		noice = true,
		gitsigns = true,
		nvimtree = true,
		telescope = {
			enabled = true,
			style = "nvchad",
		},
		lsp_trouble = true,
		notify = true,
		mini = false,
		neotree = true,
		treesitter = true,
		hop = true,
		indent_blankline = {
			enabled = true,
			scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
			colored_indent_levels = false,
		},
		mason = true,
		illuminate = {
			enabled = true,
			lsp = true,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},
	},
})
