-- LSP configuration
require("features.lsp.mason")

-- local lspconfig = require("lspconfig")
local langs = require("features.lsp.servers")

local lsp_attach = require("features.lsp.attach")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = lsp_attach
})

-- Define sign icons for each severity
local signs = {
    [vim.diagnostic.severity.ERROR] = " ",
    [vim.diagnostic.severity.WARN] = " ",
    [vim.diagnostic.severity.HINT] = "󰠠 ",
    [vim.diagnostic.severity.INFO] = " ",
}

-- Set diagnostic config
vim.diagnostic.config({
    signs = {
        text = signs,
    },
    virtual_text = true,
    underline = true,
    update_in_insert = false,
})

-- Setup servers
local cmp_nvim_lsp = require("cmp_nvim_lsp")
-- local capabilities = cmp_nvim_lsp.default_capabilities()
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Global LSP settings (applied to all servers)
vim.lsp.config('*', {
    capabilities = capabilities,
})

for name, srv in pairs(langs) do
  if srv.autoload then
    -- lspconfig[name].setup(srv.config)
    vim.lsp.config(name, srv.config)
  end
end

local servers_to_enable = {}
for name, srv in pairs(langs) do
    if srv.autoload then
        table.insert(servers_to_enable, name)
    end
end

vim.lsp.enable(servers_to_enable)

-- lspconfig.biome.setup{}
require("features.lsp.none-ls")
