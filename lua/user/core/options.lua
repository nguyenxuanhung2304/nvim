local opt = vim.opt
local g = vim.g

opt.cursorline = true -- Show current line

opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.pumheight = 7 -- Maximum number of items in popup menu

opt.mouse = "a" -- Enable mouse

opt.title = true
opt.clipboard = "unnamedplus" -- Use clipboard in nvim

-- Indent
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2 -- 1 tab is equal 2 space
opt.softtabstop = 2

-- Numbers
opt.number = true
opt.numberwidth = 5
opt.ruler = false
opt.relativenumber = true

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

opt.shortmess:append "sI" -- disable nvim intro

g.mapleader = " "

opt.cmdheight = 0 -- Hide command status

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
