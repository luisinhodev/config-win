return {
	-- neo-tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			local icons = require("features.ui.icons")

			require("neo-tree").setup({
				event_handlers = {
					{
						event = "file_opened",
						handler = function(file_path)
							--auto close
							require("neo-tree").close_all()
						end,
					},
				},
				filesystem = {
					follow_current_file = {
						enabled = true, -- El cursor seguirá al archivo actual
					},
				},
				popup_border_style = "rounded", --rounded
				window = {
					position = "float",
					width = 30,
					--       mappings = {
					--         ["<leader>ll"] = function (state)
					--           local node = state.tree:get_node()
					--           if require("neo-tree.utils").is_expandable(node) then
					--             state.commands["toggle_directory"](state)
					--           else
					--             state.commands["close_node"](state)
					--           end
					--         end,
					--       }
				},
				default_component_configs = {
					indent = {},
					icon = {
						folder_closed = icons.fs.DirEmptyClosed,
						folder_open = icons.fs.DirEmptyOpen,
						folder_empty = "󰜌",
						-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
						-- then these will never be used.
						default = "*",
						highlight = "NeoTreeFileIcon",
					},
				},
			})
		end,
	},
	-- noice
	{
		"folke/noice.nvim",
		enabled = true,
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				cmdline = {
					view = "cmdline", --`cmdline` `cmdline_popup`
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
		end,
	},
	-- notify
	{
		"rcarriga/nvim-notify",
		config = function()
			local notify = require("notify")
			-- this for transparency
			notify.setup({
				background_colour = "#000000",
				level = 1,
				minimum_width = 50,
				render = "compact", -- default, minimal, simple, compact
				stages = "fade_in_slide_out", --fade_in_slide_out, fade, slide, static
				top_down = false,
				timeout = 1500,
			})
			-- this overwrites the vim notify function
			vim.notify = notify.notify
		end,
	},

	-- fzf
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5", -- or , branch = '0.1.x',
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			-- "andrew-george/telescope-themes",
		},
		config = function()
			require("features.telescope")
		end,
	},
	-- {
	-- 	"ibhagwan/fzf-lua",
	-- 	-- optional for icon support
	-- 	dependencies = {
	-- 		"nvim-tree/nvim-web-devicons",
	-- 		{ "junegunn/fzf", build = "./install --bin" },
	-- 	},
	-- 	config = function()
	-- 		-- calling `setup` is optional for customization
	-- 		require("fzf-lua").setup({ "fzf-vim" }) -- max-perf = desactiva icons
	-- 	end,
	-- }
}
