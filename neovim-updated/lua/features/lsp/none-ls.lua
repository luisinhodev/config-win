local mason_null_ls = require("mason-null-ls")
local null_ls = require("null-ls")
local null_ls_utils = require("null-ls.utils")

mason_null_ls.setup({
  ensure_installed = {
    -- "prettier", -- prettier formatter
    "stylua", -- lua formatter
    -- "black", -- python formatter
    -- "pylint", -- python linter
    "eslint_d", -- js linter
  },
})

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- configure null_ls
null_ls.setup({
  -- add package.json as identifier for root (for typescript monorepos)
  root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
  -- setup formatters & linters
  sources = {
    formatting.stylua, -- lua formatter
    -- formatting.isort,
    formatting.black,
    -- diagnostics.pylint,
    -- diagnostics.eslint_d
    -- diagnostics.curlylint

  },
})
