vim.g.mapleader = " "
vim.g.snippets = "vsnip"

local opt = vim.o
local g = vim.g

opt.mouse = ""
opt.number = true
opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker', 'marker')
opt.showmatch = true          -- highlight matching parenthesis
opt.synmaxcol = 1000      -- max column for syntax highlight
opt.history = 100         -- remember n lines in history
opt.conceallevel = 0 --json
opt.relativenumber = true
opt.hidden = true
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.errorbells = false
opt.wrap = true
opt.swapfile = false
opt.undofile = true
-- opt.undodir = os.getenv "HOME" .. "/.cache/nvim/undodir"
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.scrolloff = 4
opt.sidescrolloff = 4
opt.showmode = false
opt.clipboard = "unnamedplus"
-- vim.opt.clipboard="unnamedplus"
opt.splitbelow = true
opt.splitright = true
opt.autowrite = true
opt.list = true
-- opt.listchars = "tab:\\ ,trail:•"
opt.listchars = "tab:│ ,trail:•"
-- opt.listchars = "trail:•,extends:›,precedes:‹"

opt.laststatus = 3
opt.cmdheight = 1
opt.updatetime = 100
opt.signcolumn = "yes"
opt.equalalways = false

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.cursorline = true
opt.confirm = true

opt.breakindent = true
opt.showbreak = '↪'

vim.opt.guifont = 'Lexsa'

opt.pumblend = 30
opt.pumheight = 15

--Syntax highlight astro "js/ts/tsx/jsx"
g.astro_typescript = 'enable'

-- Syntax highlight python: for spaces
g.python_recommended_style = 0

-- g.indentLine_char = '▏'       --|┊ set indentLine character

g.loaded_perl_provider = 0


-- vim.g.html_indent_script1 = "inc"
-- vim.g.html_indent_style1 = "inc"
