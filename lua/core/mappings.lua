local keymap = require("core.utils").keymap
local opts = { silent = true, noremap = true}

-- Telescope
keymap("n", "<leader>p", "<cmd>Telescope find_files<cr>")
keymap("n", "<leader>f", "<cmd>Telescope grep_string<cr>")

-- NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

-- Trouble
keymap("n", "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
keymap("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>")

-- Navigator between window
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

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

