local utils = require("user.core.utils")
local keymap = utils.keymap
local opts = { silent = true, noremap = true}

-- Ctrl+s is save file
keymap('n', "<C-s>", "<cmd>w<cr>", opts)
keymap('i', "<C-s>", "<cmd>w<cr>", opts)

-- Navigator between window
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize pane
keymap("n", "<M-Right>", "<C-w>>")
keymap("n", "<M-Left>", "<C-w><")

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal mode -- 
keymap("t", "<C-o>", "<C-\\><C-n>", opts)
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)
keymap("t", "<C-\\>", "<cmd>ToggleTerm<cr>", opts)

-- Telescope
keymap('n', '<leader>ff', "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")
keymap("n", "<leader>fb", "<cmd>Telescope git_branches<cr>")
keymap("n", "<leader>fs", "<cmd>Telescope git_stash<cr>")

-- NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- Toggle term
keymap("n", "<C-\\>", "<cmd>ToggleTerm<cr>", opts)

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
