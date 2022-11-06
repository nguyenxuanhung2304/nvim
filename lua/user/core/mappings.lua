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
keymap('n', '<leader>ff', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require'telescope.builtin'.live_grep({ default_text = vim.fn.expand('<cword>') })<cr>", opts)
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")
keymap("n", "<leader>fb", "<cmd>Telescope git_branches<cr>")
keymap("n", "<leader>fs", "<cmd>Telescope git_stash<cr>")
keymap("n", "<leader>fhs", "<cmd>Telescope search_history<cr>")
keymap("n", "<leader>fhc", "<cmd>Telescope command_history<cr>")

-- NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- Toggle term
keymap("n", "<C-\\>", "<cmd>ToggleTerm<cr>", opts)

-- Formatter
keymap('n', '<C-f>', '<cmd>Format<cr>')
keymap('i', '<C-f>', '<cmd>Format<cr>')
