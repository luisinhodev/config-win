local mason = require "mason"
local mason_lspconfig = require "mason-lspconfig"
local langs = require "features.lsp.servers"

-- Inicializa Mason
mason.setup()

-- Convierte tu tabla de servidores en una lista de nombres
local server_names = {}
for name, _ in pairs(langs) do
    table.insert(server_names, name)
end

-- Configura mason-lspconfig para asegurarse que todos estén instalados
mason_lspconfig.setup({
    ensure_installed = server_names,
    automatic_installation = true,
})
