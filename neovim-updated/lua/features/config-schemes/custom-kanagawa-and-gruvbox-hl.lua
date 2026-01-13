local colors = require("features.ui.colors")
local values = require("config.values")

if values.theme.name == "kanagawa" or
   values.theme.name == "gruvbox-material" or
   values.theme.name == "gruvbox" or
   values.theme.name == "everforest" then
	--NeoTree
	vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { bg = colors.sbg, fg = "#181616", bold = true })
	vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#343E43" })

	--Diagnostics
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { bg = "#392B2B" })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { bg = "#39382B" })
end

if values.theme.name == "kanagawa" or values.theme.name == "everforest" then
	-- NeoTree
	vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#a292a3" })
	vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#c4b28a" })
	vim.api.nvim_set_hl(0, "NeoTreeGitUnstaged", { fg = "#949fb5" })
	-- Notify
	vim.api.nvim_set_hl(0, "NotifyWARNBorder", { bg = "none", fg = "#c4b28a" })
	vim.api.nvim_set_hl(0, "NotifyWARNTitle", { bg = "none", fg = "#c4b28a" })
	vim.api.nvim_set_hl(0, "NotifyERRORBorder", { bg = "none", fg = "#c4746e" })
	vim.api.nvim_set_hl(0, "NotifyERRORTitle", { bg = "none", fg = "#c4746e" })
	-- Diagnostics
	vim.api.nvim_set_hl(0, "DiagnosticError", { bg = "#392B2B", fg = "#c4746e" })
	vim.api.nvim_set_hl(0, "DiagnosticWarn", { bg = "#39382B", fg = "#c4b28a" })
	vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { bg = "", fg = "#c4b28a" })
	vim.api.nvim_set_hl(0, "DiagnosticSignError", { bg = "", fg = "#c4746e" })
	-- vim.api.nvim_set_hl(0, "DiagnosticHint", { bg = "#2B3934", fg = "#68AD99" })

	--Telescope
	vim.api.nvim_set_hl(0, "TelescopeTitle", { bg = "#d3869b", fg = "#282727", bold = true })
	vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "#7daea3", fg = "#282727", bold = true })
	vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "#a9b665", fg = "#282727", bold = true })

  --lualine
	if values.theme.transparent then
		vim.api.nvim_set_hl(0, "lualine_c_diagnostics_error_normal", { fg = "#c4746e", bg = "none" })
		vim.api.nvim_set_hl(0, "lualine_c_diagnostics_warn_normal", { fg = "#c4b28a", bg = "none" })
	else
		vim.api.nvim_set_hl(0, "lualine_c_diagnostics_error_normal", { fg = "#c4746e", bg = "#282727" })
		vim.api.nvim_set_hl(0, "lualine_c_diagnostics_warn_normal", { fg = "#c4b28a", bg = "#282727" })
	end
end

if values.theme.name == "gruvbox-material" or
   values.theme.name == "gruvbox" then
	--NeoTree
	vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { bg = "none", fg = "#504945" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "", fg = "#504945" })
	--Telescope
	vim.api.nvim_set_hl(0, "TelescopeTitle", { bg = "#d3869b", fg = "#282727", bold = true })
	vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "#7daea3", fg = "#282727", bold = true })
	vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "#a9b665", fg = "#282727", bold = true })

	if values.theme.transparent then
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#504945" })
		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#504945" })
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#504945" })
	end

	if not values.theme.transparent then
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#252524" })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "#252524", fg = "#252524" })

		vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "#121718", fg = "#ddc7a1" })
		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "#121718", fg = "#121718" })

		vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "#202020" })
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "#202020", fg = "#202020" })
	end
end
