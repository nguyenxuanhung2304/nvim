local utils = require("user.core.utils")
local keymap = utils.keymap

keymap("n", "<C-s>", "<cmd>:w!<cr>", { desc = "Save file" })
keymap("i", "<C-s>", "<cmd>:w!<cr>", { desc = "Save file" })

keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

keymap("v", "y", "ygv<Esc>", { desc = "Yank and hold current cursor" })

keymap("i", "jk", "<ESC>")

keymap("v", "p", '"_dP')

keymap("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move current line to down" })
keymap("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move current line to up" })

keymap("t", "<C-o>", "<C-\\><C-n>", { desc = "Normal mode in terminal" })
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Move to left in terminal" })
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Move to bottom in terminal" })
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Move to top in terminal" })
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Move to right in terminal" })

keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Disable hlsearch" })
keymap(
	"n",
	"<C-f>",
	"<cmd>silent !tmux neww '~/.local/bin/scripts/tmux-sessionizer'<CR>",
	{ desc = "Find folders in ~/Dev" }
)

keymap("n", "<leader>c", "<cmd>Cppath<cr>", { desc = "Copy relative filepath" })
keymap("t", "<Esc>", "<C-\\><C-n>")

keymap("v", ">", ">gv", { desc = "Indent in" })
keymap("v", "<", "<gv", { desc = "Indent out" })

vim.keymap.set("n", "<C-t>", function()
	require("menu").open("default")
end, {})

vim.keymap.set("n", "<RightMouse>", function()
	vim.cmd.exec('"normal! \\<RightMouse>"')

	local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
	require("menu").open(options, { mouse = true })
end, {})
