return {
	"neovim/nvim-lspconfig",
	enabled = true,
	dependencies = {
		{
			"jay-babu/mason-null-ls.nvim",
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				"nvimtools/none-ls.nvim",
				-- "jose-elias-alvarez/null-ls.nvim"
			},
		},
		{
			"williamboman/mason.nvim",
			opts = {
				ui = {
					border = "rounded",
				},
			},
		},
		"folke/neodev.nvim",
		"williamboman/mason-lspconfig.nvim",
		"princejoogie/tailwind-highlight.nvim",
		-- "mfussenegger/nvim-lint"
	},
	event = "VeryLazy",
	config = function()
		require("features.lsp")
		-- local values = require('config.values')
		vim.diagnostic.config({
			-- Deshabilita el texto que aparece en la línea de código (ej: el puntito rojo o el mensaje de error).
      virtual_text = false,

      -- Deshabilita los signos (iconos en el margen izquierdo/sign column).
      signs = false, -- Puedes dejarlo en 'true' para saber que hay un error, o en 'false' para ocultarlo.

      -- Deshabilita la ventana flotante de diagnóstico cuando el cursor se detiene.
     float = {
       source = 'never', -- always Si se muestra la fuente del diagnóstico.
      header = "",
      focusable = false,
      close_events = { 'CursorMoved', 'BufHidden', 'InsertCharPre', 'WinLeave' },
      delay = 100000,
      }
    })

    -- Variable para rastrear el estado
    local diagnostics_visible = false

    -- Función para alternar la visibilidad de los diagnósticos
    local function toggle_diagnostics()
        diagnostics_visible = not diagnostics_visible
        vim.diagnostic.config({
            virtual_text = diagnostics_visible,
            signs = diagnostics_visible,
        })

        local status = diagnostics_visible and "ACTIVADOS" or "DESACTIVADOS"
        vim.notify("Diagnósticos LSP " .. status, vim.log.levels.INFO)
    end

    vim.keymap.set('n', '<leader>d', toggle_diagnostics, { desc = "Alternar Diagnósticos LSP" })
  end
}
