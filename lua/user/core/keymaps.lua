local utils = require("user.core.utils")
local keymap = utils.keymap

-- Yank and hold current cursor
keymap("v", "y", "ygv<Esc>")

-- Press jk fast to enter
keymap("i", "jk", "<ESC>")

keymap("v", "p", '"_dP')

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move current line to down" })
keymap("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move current line to up" })

-- Move in term mode
keymap("t", "<C-o>", "<C-\\><C-n>", { desc = "Normal mode in terminal" })
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Move to left in terminal" })
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Move to bottom in terminal" })
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Move to top in terminal" })
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Move to right in terminal" })

-- Common
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Disable hlsearch" })
keymap(
	"n",
	"<C-f>",
	"<cmd>silent !tmux neww '~/.local/bin/scripts/tmux-sessionizer'<CR>",
	{ desc = "Find folders in ~/Dev" }
)

vim.api.nvim_create_user_command("Cppath", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

keymap("n", "<leader>c", "<cmd>Cppath<cr>", { desc = "Copy relative filepath" })
keymap("t", "<Esc>", "<C-\\><C-n>")

keymap("v", ">", ">gv", { desc = "Indent in" })
keymap("v", "<", "<gv", { desc = "Indent out" })
