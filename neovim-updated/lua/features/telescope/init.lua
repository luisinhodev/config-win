local values = require("config.values")

local borderchars = {}
if values.theme.name == "gruvbox-material" then
	borderchars = {
		-- prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
		prompt = { " ", " ", "─", " ", "", "", " ", " " },
		results = { " " },
		preview = { " " },
	}
else
  borderchars = nil
end

require("telescope").setup({
	defaults = {
		prompt_prefix = "   ",
		selection_caret = "❯ ",
		sorting_strategy = "ascending",
		vimgrep_arguments = {
			"rg",
			"-L",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		layout_config = {
			horizontal = {
				prompt_position = "top",
			},
		},
    -- borderchars = borderchars,
		file_ignore_patterns = { "node_modules", "venv" },
	},
})
require("features.telescope.mapings")

require("telescope").load_extension("notify")
require("telescope").load_extension("file_browser")
-- require("telescope").load_extension("themes")



