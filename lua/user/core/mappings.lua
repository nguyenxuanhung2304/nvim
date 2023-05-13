local utils = require("user.core.utils")
local keymap = utils.keymap
-- Ctrl+s is save file
keymap('n', "<C-s>", "<cmd>w<cr>")
keymap('i', "<C-s>", "<cmd>w<cr>")

-- Navigator between window
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Resize pane
keymap("n", "<M-Right>", "<C-w>>")
keymap("n", "<M-Left>", "<C-w><")

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>")

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-k>", ":m .-2<CR>==")
keymap("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Telescope
keymap('n', '<leader>ff', "<cmd>Telescope find_files<cr>")
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")
keymap("n", "<leader>fb", "<cmd>Telescope git_branches<cr>")
keymap("n", "<leader>fs", "<cmd>Telescope git_stash<cr>")

-- NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

-- Formatter
keymap('n', '<C-f>', '<cmd>Format<cr>')
keymap('i', '<C-f>', '<cmd>Format<cr>')

-- Nvim Hlslens
keymap('n', 'n', "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>")
keymap('n', 'N', "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>")
keymap('n', '*', "*<Cmd>lua require('hlslens').start()<CR>")
keymap('n', '#', "#<Cmd>lua require('hlslens').start()<CR>")
keymap('n', 'g*', "g*<Cmd>lua require('hlslens').start()<CR>")
keymap('n', 'g#', "g#<Cmd>lua require('hlslens').start()<CR>")

-- Fold
keymap("n", "zR", "<cmd>lua require('ufo').openAllFolds()<CR>")
keymap("n", "zM", "<cmd>lua require('ufo').closeAllFolds()<CR>")
keymap("n", "zr", "<cmd>lua require('ufo').openFoldsExceptKinds()<CR>")
keymap("n", "zm", "<cmd>lua require('ufo').closeFoldsWith()<CR>")
keymap("n", "zp","<cmd>lua require('ufo').peekFoldedLinesUnderCursor()<CR>")

-- Toggleterm
keymap("t", "<C-o>", "<C-\\><C-n>")
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h")
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j")
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k")
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l")
keymap("t", "<C-\\>", "<cmd>ToggleTerm<cr>")
keymap("n", "<C-\\>", "<cmd>ToggleTerm<cr>")

keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")
keymap("n", "<Space>g", "<cmd>Gtabedit:<cr>")
keymap("n", "<Space>p", "<cmd>Legendary<cr>")
keymap("n", "<Space>c", "<cmd>Bdelete!<cr>")
