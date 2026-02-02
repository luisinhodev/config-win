local map = vim.keymap.set
local default_opts = { noremap = true, silent = true }

-- don't use arrow keys
map("", "<up>", "<nop>", { noremap = true })
map("", "<down>", "<nop>", { noremap = true })
map("", "<left>", "<nop>", { noremap = true })
map("", "<right>", "<nop>", { noremap = true })

map("i", "<C-h>", "<left>", default_opts)
map("i", "<C-j>", "<down>", default_opts)
map("i", "<C-k>", "<up>", default_opts)
map("i", "<C-l>", "<right>", default_opts)

-- move first and last
map("i", "<C-a>", "<C-o>^", default_opts)
map("i", "<C-e>", "<C-o>$", default_opts)

-- fast saving with <leader> and s
map("n", "<leader>w", ":w<CR>", default_opts)
map("i", "ii", "<Esc><Esc>", default_opts)

-- if you haven't already set it
map("n", "j", "gj", default_opts)
map("n", "k", "gk", default_opts)

-- scroll mejorado
map("n", "<C-e>", "5<C-e>", default_opts)
map("n", "<C-y>", "5<C-y>", default_opts)

-- close all windows and exit from neovim
map("n", "<leader>q", ":q<CR>", default_opts)

-- nvim-tree
map("n", "<leader>tn", ":Neotree reveal<CR>", default_opts)

-- Mapear Ctrl + . para acciones de código (importaciones, correcciones, etc.)
vim.keymap.set({ "n", "i" }, "<leader>.", function()
	vim.lsp.buf.code_action()
end, { desc = "Code Actions" })

-- cokeline
map("n", "<leader>l", "<Plug>(cokeline-focus-next)", { silent = true })
map("n", "<leader>j", "<Plug>(cokeline-focus-prev)", { silent = true })
map("n", "<leader>bp", "<Plug>(cokeline-switch-prev)", { silent = true })
map("n", "<leader>bn", "<Plug>(cokeline-switch-next)", { silent = true })
map("n", "<leader>bi", "<Plug>(cokeline-pick-focus)", { silent = true })

map("n", "<leader>to", ":bufdo bd<cr>", default_opts) --close all bufers
map("n", "<leader>x", ":bdelete<CR>", default_opts)

for i = 1, 9 do
	map("n", ("<leader>%s"):format(i), ("<Plug>(cokeline-focus-%s)"):format(i), { silent = true })
	map("n", ("<Leader><leader>%s"):format(i), ("<Plug>(cokeline-switch-%s)"):format(i), { silent = true })
end

-- move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h", default_opts)
map("n", "<C-j>", "<C-w>j", default_opts)
map("n", "<C-k>", "<C-w>k", default_opts)
map("n", "<C-l>", "<C-w>l", default_opts)

-- tabulation
map("v", "<", "<gv", { desc = "Indent out and keeps the selection" })
map("v", ">", ">gv", { desc = "Indent in and keeps the selection" })

--move
map("x", "K", ":move '<-2<CR>gv-gv", { noremap = true })
map("x", "J", ":move '>+1<CR>gv-gv", { noremap = true })

-- punto y coma al final
map("n", "<leader>;", "$a;<Esc>", default_opts)

-- right, left, up, down => resize
map("n", "<right>", ":vertical resize +2<CR>", { silent = true })
map("n", "<left>", ":vertical resize -2<CR>", { silent = true })
map("n", "<up>", ":resize +2<CR>", { silent = true })
map("n", "<down>", ":resize -2<CR>", { silent = true })

-- symbols to add undo points
local symbols = { ",", ".", "!", "?", "$", ">", "<" }
for _, symbol in pairs(symbols) do
	map(
		"i",
		symbol,
		symbol .. "<c-g>u",
		{ desc = string.format("Add symbol %s to the undo list and writes it", symbol) }
	)
end

-- search result focus
map("n", "n", "nzzzv", { desc = "Goes to next result on the search and put the cursor in the middle of the screen" })
map("n", "N", "Nzzzv", { desc = "Goes to prev result on the search and put the cursor in the middle of the screen" })

-- telescope emojis
map("n", "<leader>ts", ":Telescope symbols<CR>", default_opts)

-- fzf
-- map("n", "<leader>fs", ":lua require('fzf-lua').files()<CR>", default_opts)

-- Terminal
-- map("n", "<C-t>", ":Term<CR>", { noremap = true })
-- map("t", "<Esc><Esc>", "<C-\\><C-n>")

-- ToggleTerm
-- map("n","<C-n>","<cmd>lua _NODE_TOGGLE()<cr>", {})
-- map("n","<C-h>","<cmd>lua _HTOP_TOGGLE()<cr>", {})
-- map("n","<C-p>","<cmd>lua _PYTHON_TOGGLE()<cr>", {})
map("n", "<C-t>", "<cmd>ToggleTerm direction=float<cr>", {})
map("t", "<C-t>", "<cmd>ToggleTerm direction=float<cr>", {})

map("n", "<leader>ht", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", {})
map("n", "<leader>vt", "<cmd>ToggleTerm size=30 direction=vertical<cr>", {})

-- quick env file edit
map("n", "<leader>ee", ":vsp .env<CR>", { desc = "Open .env file in a vertical split" })

-- hop
-- place this in one of your configuration file(s)
map(
	"n",
	"f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
	{}
)
map(
	"n",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
	{}
)
map(
	"n",
	"t",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
	{}
)
map(
	"n",
	"T",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>",
	{}
)
map("n", "<leader>hl", "<cmd>lua require'hop'.hint_lines_skip_whitespace()<cr>", {})
map("n", "<leader>hw", "<cmd>lua require'hop'.hint_words()<cr>", {})
map("n", "<leader>hc", "<cmd>lua require'hop'.hint_char1()<cr>", {})
