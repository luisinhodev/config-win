return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-git",
		-- "saadparwaiz1/cmp_luasnip",
		"onsails/lspkind-nvim",
		-- {
  --     "L3MON4D3/LuaSnip",
  --     version = "v1.*",
  --   },
		"hrsh7th/cmp-vsnip",
		{
			"hrsh7th/vim-vsnip",
      init = function ()
        require('features.cmp.vsnip')
      end
		},
		-- "hrsh7th/cmp-nvim-lsp-signature-help", --HACK: see
		{ "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
	},

	event = "VeryLazy",
	config = function()
		require("features.cmp")
	end,
}
