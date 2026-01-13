-- Using Lua functions
local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
map("n", "<leader>fb", '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
map("n", "<leader>fc", '<cmd>lua require("telescope.builtin").commands()<cr>', opts)
map("n", "<leader>fd", '<cmd>lua require("telescope.builtin").diagnostics()<cr>', opts)
map("n", "<leader>fs", '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
map("n", "<leader>fg", '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
map("n", "<leader>fgb", '<cmd>lua require("telescope.builtin").git_branches()<cr>', opts)
map("n", "<leader>fgc", '<cmd>lua require("telescope.builtin").git_commits()<cr>', opts)
map("n", "<leader>fgs", '<cmd>lua require("telescope.builtin").git_status()<cr>', opts)
map("n", "<leader>fh", '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
map("n", "<leader>tt", '<cmd>lua require("material.functions").find_style()<cr>', opts)

vim.api.nvim_set_keymap("n", "<space>fb", ":Telescope file_browser<cr>", { noremap = true }) --material theme

-- ["c"] = fb_actions.create,
-- ["r"] = fb_actions.rename,
-- ["m"] = fb_actions.move,
-- ["y"] = fb_actions.copy,
-- ["d"] = fb_actions.remove,
-- ["o"] = fb_actions.open,
-- ["g"] = fb_actions.goto_parent_dir,
-- ["e"] = fb_actions.goto_home_dir,
-- ["w"] = fb_actions.goto_cwd,
-- ["t"] = fb_actions.change_cwd,
-- ["f"] = fb_actions.toggle_browser,
-- ["h"] = fb_actions.toggle_hidden,
-- ["s"] = fb_actions.toggle_all,

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope file_browser <cr>", opts)
