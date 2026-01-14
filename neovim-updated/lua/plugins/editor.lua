return {
	--web-tools
	--{
	--	"ray-x/web-tools.nvim",
	--	config = function()
	--		require("web-tools").setup({
	--			keymaps = {
	--				rename = nil, -- by default use same setup of lspconfig
	--				repeat_rename = ".", -- . to repeat
	--			},
	--		})
	--	end,
	--},

	-- Trouble
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>tt",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			-- {
			-- 	"<leader>xX",
			-- 	"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			-- 	desc = "Buffer Diagnostics (Trouble)",
			-- },
			-- {
			-- 	"<leader>cs",
			-- 	"<cmd>Trouble symbols toggle focus=false<cr>",
			-- 	desc = "Symbols (Trouble)",
			-- },
			-- {
			-- 	"<leader>cl",
			-- 	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			-- 	desc = "LSP Definitions / references / ... (Trouble)",
			-- },
			-- {
			-- 	"<leader>xL",
			-- 	"<cmd>Trouble loclist toggle<cr>",
			-- 	desc = "Location List (Trouble)",
			-- },
			-- {
			-- 	"<leader>xQ",
			-- 	"<cmd>Trouble qflist toggle<cr>",
			-- 	desc = "Quickfix List (Trouble)",
			-- },
		},
	},
	-- gitsigns
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "┃" }, --│
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┃" }, -- ┆
				},
			})
		end,
	},
	-- colorizer
	{
		"NvChad/nvim-colorizer.lua",
		event = "VeryLazy",
		config = function()
			require("colorizer").setup({
				user_default_options = {
					rgb_fn = true, -- CSS rgb() and rgba() functions
					hsl_fn = true, -- CSS hsl() and hsla() functions
					tailwind = true,
					sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
				},
			})
		end,
	},

	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			delay = 200,
			large_file_cutoff = 2000,
			large_file_overrides = {
				providers = { "lsp" },
			},
		},
		config = function(_, opts)
			-- change the highlight style
			vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#4D4949" }) --link = "CursorLine" or bg = "#595555"
			vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#4D4949" })
			vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#4D4949" })

			--- auto update the highlight style on colorscheme change
			vim.api.nvim_create_autocmd({ "ColorScheme" }, {
				pattern = { "*" },
				callback = function(ev)
					vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#4D4949" })
					vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#4D4949" })
					vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#4D4949" })
				end,
			})
			require("illuminate").configure(opts)

			local function map(key, dir, buffer)
				vim.keymap.set("v", key, function()
					require("illuminate")["goto_" .. dir .. "_reference"](false)
				end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
			end

			map("]]", "next")
			map("[[", "prev")

			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					map("]]", "next", buffer)
					map("[[", "prev", buffer)
				end,
			})
		end,
		keys = {
			{ "]]", desc = "Next Reference" },
			{ "[[", desc = "Prev Reference" },
		},
	},
	-- rainbow-delimiters
	-- {
	-- 	"HiPhish/rainbow-delimiters.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		local rainbow_delimiters = require("rainbow-delimiters")
	-- 		require("rainbow-delimiters.setup").setup({
	-- 			strategy = {
	-- 				[""] = rainbow_delimiters.strategy["global"],
	-- 				commonlisp = rainbow_delimiters.strategy["local"],
	-- 			},
	-- 			query = {
	-- 				[""] = "rainbow-delimiters",
	-- 				latex = "rainbow-blocks",
	-- 			},
	-- 			highlight = {
	-- 				-- "RainbowDelimiterRed",
	-- 				"RainbowDelimiterYellow",
	-- 				"RainbowDelimiterBlue",
	-- 				"RainbowDelimiterOrange",
	-- 				"RainbowDelimiterGreen",
	-- 				"RainbowDelimiterViolet",
	-- 				"RainbowDelimiterCyan",
	-- 			},
	-- 			blacklist = { "c", "cpp" },
	-- 		})
	-- 	end,
	-- },
	-- toggleterm
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 20,
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				shade_filetypes = {},
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = "float",
				close_on_exit = true,
				-- shell = vim.o.shell,
				shell = "powershell.exe",
				float_opts = {
					border = "curved",
					winblend = 0,
					highlights = {
						border = "Normal",
						background = "Normal",
					},
				},
			})
			function _G.set_terminal_keymaps()
				local opts = { noremap = true }
				vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<A-h>", [[<C-\><C-n><C-W>h]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<A-j>", [[<C-\><C-n><C-W>j]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<A-k>", [[<C-\><C-n><C-W>k]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<A-l>", [[<C-\><C-n><C-W>l]], opts)
			end

			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		end,
	},
	-- todo-comments
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			keywords = {
				FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
				TODO = { icon = " ", color = "info" },
				HACK = { icon = " ", color = "warning" },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
				TEST = { icon = "ﭧ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		init = function()
			-- use Neovim nightly branch
			-- vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:'
			vim.o.foldenable = true
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldmethod = "expr"
			vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.o.foldtext = ""
			vim.opt.foldcolumn = "0"
			vim.opt.fillchars:append({ fold = " " })

			-- vim.opt.fillchars = {
			--   eob = " ",
			--   fold = " ",
			--   foldopen = "",
			--   foldsep = " ",
			--   -- foldinner = " ",
			--   foldclose = "",
			-- }
		end,
		config = function()
			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" } -- Usa treesitter como fuente principal
				end,
			})
		end,
	},
}
