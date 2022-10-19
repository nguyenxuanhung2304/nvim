local opt = vim.opt
local g = vim.g

opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.pumheight = 7 -- Maximum number of items in popup menu

opt.mouse = "a"

opt.title = true
opt.clipboard = "unnamedplus"

-- Indent
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false
opt.relativenumber = true

opt.fillchars = opt.fillchars + 'diff:╱'

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- disable nvim intro
opt.shortmess:append "sI"

g.mapleader = " "
