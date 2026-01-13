return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "master",
	lazy = false,
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		"windwp/nvim-ts-autotag",
		-- { "m-demare/hlargs.nvim",
		--   enabled = true,
		--   config = function()
		--     require('hlargs').setup{
		--       color = '#7daea3'
		--     }
		--   end
		-- }
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		require 'nvim-treesitter.install'.compilers = { "gcc" }
		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = {
				enable = true,
				disable = { "html", "astro", 'typescript' },
			},

			-- ensure these languages parsers are installed
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"go",
				"yaml",
				"html",
				"css",
				"python",
				"http",
				"prisma",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"angular",
				"c",
				"cpp",
				"java",
				"rust",
				"ron",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
				},
			},
			additional_vim_regex_highlighting = false,
		})
	end,
}
