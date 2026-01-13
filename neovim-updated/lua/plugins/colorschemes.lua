local values = require("config.values")

return {
	{
		"catppuccin/nvim",
		enabled = values.theme.name == "catppuccin",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("features.config-schemes.catppuccin")
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		enabled = values.theme.name == "gruvbox",
		lazy = false,
		priority = 1000,
		config = function()
			require("features.config-schemes.gruvbox")
			vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		enabled = values.theme.name == "gruvbox-material",
		priority = 1000,
		init = function()
			require("features.config-schemes.gruvbox-material")
		end,
		config = function()
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
	{
		"sainnhe/everforest",
		lazy = false,
		enabled = values.theme.name == "everforest",
		priority = 1000,
		init = function()
			require("features.config-schemes.everforest-shine")
		end,
		config = function()
			vim.cmd.colorscheme("everforest")
		end,
	},
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
		enabled = values.theme.name == "everforest-nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    init = function ()
      require("features.config-schemes.everforest-nvim")
    end,
    config = function()
      vim.cmd.colorscheme("everforest")
    end,
  },
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		enabled = values.theme.name == "kanagawa",
		priority = 1000,
		config = function()
      require('features.config-schemes.kanagawa')
			vim.cmd.colorscheme("kanagawa")
      vim.cmd([[
         hi Visual guifg=none guibg=none gui=reverse
      ]])
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		enabled = values.theme.name == "fox",
		lazy = false,
		priority = 1000,
		config = function()
			require("features.config-schemes.nightfox")
			-- setup must be called before loading
			vim.cmd.colorscheme(values.theme.variant)
		end,
	},
}
