local exec = vim.api.nvim_exec -- execute Vimscript
local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	callback = function()
		vim.cmd([[%s/\s\+$//e]])
	end,
})

-- remember files
exec(
	[[
  augroup AutoSaveGroup
  autocmd!
  autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end
]],
	false
)

-- highlight on yank
au("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 700 })
	end,
	group = ag("yank_highlight", {}),
})

-- highlight with enter seleccion and no
vim.cmd([[
  let g:highlighting = 0
  function! Highlighting()
      if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
          let g:highlighting = 0
          return ":silent nohlsearch\<CR>"
      endif
      let @/ = '\<'.expand('<cword>').'\>'
      let g:highlighting = 1
      return ":silent set hlsearch\<CR>"
  endfunction
  nnoremap <silent> <expr> <CR> Highlighting()
]])

-- open a terminal pane on the right using :Term
vim.cmd([[command Term :botright split term://$SHELL]])
vim.cmd([[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave term://* stopinsert
]])

-- don't auto commenting new lines
vim.cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])
