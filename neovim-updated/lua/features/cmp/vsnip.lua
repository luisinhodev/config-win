--" location to store vsnip files
-- vim.g.vsnip_snippet_dir = vim.fn.expand('~/.config/nvim/extra/snippets')

vim.g.vsnip_snippet_dir = vim.fn.expand("$LOCALAPPDATA/nvim/extra/snippets")

-- keymaps for vsnip
vim.cmd([[
  imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
  smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
  imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
  smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
]])
