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

-- Git fugitive
keymap('n', 'gs', "<cmd>G status<cr>", opts)

-- Telescope
keymap('n', '<leader>p', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", opts)
keymap("n", "<leader>s", "<cmd>Telescope live_grep<cr>", opts)

-- NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- Toggle term
keymap("n", "<C-\\>", "<cmd>ToggleTerm<cr>", opts)

-- Hop
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})

keymap("n", "s", "<cmd>HopWord<cr>")

-- Lsp rename
vim.keymap.set("n", "<leader>h", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

-- Formatter
keymap('n', '<C-f>', '<cmd>Format<cr>')
keymap('i', '<C-f>', '<cmd>Format<cr>')
