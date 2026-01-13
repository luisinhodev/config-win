local values = require("config.values")

return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			map_cr = true,
		},
		config = function()
			local npairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")

			npairs.setup({
				check_ts = true,
				ts_config = {
					lua = { "string" }, -- it will not add a pair on that treesitter node
					javascript = { "template_string" },
					java = false, -- don't check treesitter on java
					angular = false,
				},
			})

			local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
			npairs.add_rules({
				Rule(" ", " "):with_pair(function(opts)
					local pair = opts.line:sub(opts.col - 1, opts.col)
					return vim.tbl_contains({
						brackets[1][1] .. brackets[1][2],
						brackets[2][1] .. brackets[2][2],
						brackets[3][1] .. brackets[3][2],
					}, pair)
				end),
			})
			for _, bracket in pairs(brackets) do
				npairs.add_rules({
					Rule(bracket[1] .. " ", " " .. bracket[2])
						:with_pair(function()
							return false
						end)
						:with_move(function(opts)
							return opts.prev_char:match(".%" .. bracket[2]) ~= nil
						end)
						:use_key(bracket[2]),
				})
			end
		end,
	},
	-- hop
	{
		"smoka7/hop.nvim",
		version = "*", -- optional but strongly recommended
		opts = {
			keys = "etovxqpdygfblzhckisuran",
		},
	},
	-- surround
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	-- Comment
	{
		"numToStr/Comment.nvim",
		keys = {
			{ "gcc", desc = "Comment current line" },
			{ "gc", mode = "v", desc = "Comment selected text" },
		},
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	-- multicursors
	{
		"mg979/vim-visual-multi",
		branch = "master",
		lazy = true,
		keys = {
			{ "<c-n>", nil, mode = { "n", "v" } },
			{
				"<c-d>",
				"<Plug>(VM-Find-Subword-Under)<cr>",
				mode = "v",
				desc = "Find occurrence of subword under cursor",
			},
		},
	},
	-- quick type
	{
		"Redoxahmii/json-to-types.nvim",
		build = "sh install.sh pnpm", -- Replace `npm` with your preferred package manager (e.g., yarn, pnpm).
		ft = "json",
		keys = {
			{
				"<leader>cU",
				"<CMD>ConvertJSONtoLang typescript<CR>",
				desc = "Convert JSON to TS",
			},
			{
				"<leader>ct",
				"<CMD>ConvertJSONtoLangBuffer typescript<CR>",
				desc = "Convert JSON to TS Buffer",
			},
		},
	},

	-- tagalong chanse
	"AndrewRadev/tagalong.vim",
	-- pick color
	"KabbAmine/vCoolor.vim",
	-- astro
	{ "wuelnerdotexe/vim-astro", enabled = values.syntax.astro },
	-- pug
	{ "digitaltoad/vim-pug", enabled = values.syntax.pug },
	-- jinja2
	{ "Glench/Vim-Jinja2-Syntax", enabled = values.syntax.jinja },
}
