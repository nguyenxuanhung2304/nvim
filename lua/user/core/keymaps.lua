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

keymap("n", "<leader>cc", "<cmd>Cppath<cr>", { desc = "Copy relative filepath" })
keymap("t", "<Esc>", "<C-\\><C-n>")

keymap("v", ">", ">gv", { desc = "Indent in" })
keymap("v", "<", "<gv", { desc = "Indent out" })

function CopyCurrentDiagnostic()
	local diagnostics = vim.diagnostic.get(0)
	local line = vim.api.nvim_win_get_cursor(0)[1] - 1
	local current_diagnostic = nil

	for _, diag in ipairs(diagnostics) do
		if diag.lnum == line then
			current_diagnostic = diag.message
			break
		end
	end

	if current_diagnostic then
		vim.fn.setreg("+", current_diagnostic)
		print("Copy diagnostics to clipboard!")
	else
		print("Not found diagnostics at current cursor")
	end
end

vim.keymap.set("n", "<leader>cd", "<cmd>lua CopyCurrentDiagnostic()<cr>", { desc = "Copy current diagnostic" })

-- Xcode
vim.keymap.set("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
vim.keymap.set("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" })
vim.keymap.set("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" })
vim.keymap.set("n", "<leader>xs", "<cmd>XcodebuildFailingSnapshots<cr>", { desc = "Show Failing Snapshots" })
vim.keymap.set("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
vim.keymap.set("n", "<leader>xq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" })
vim.keymap.set("n", "<leader>xx", "<cmd>XcodebuildQuickfixLine<cr>", { desc = "Quickfix Line" })
vim.keymap.set("n", "<leader>xa", "<cmd>XcodebuildCodeActions<cr>", { desc = "Show Code Actions" })

-- Barbar
keymap('n', '[b', '<Cmd>BufferPrevious<CR>', { desc = "Next buffer" })
keymap('n', ']b', '<Cmd>BufferNext<CR>', { desc = "Previous buffer" })
keymap('n', '<leader>bc', '<Cmd>BufferClose<CR>', { desc = "Close buffer" })

keymap('n', '<leader>bh', '<Cmd>BufferCloseBuffersLeft<CR>', { desc = "Close buffers on left side" })
keymap('n', '<leader>bl', '<Cmd>BufferCloseBuffersRight<CR>', { desc = "Close buffers on right side" })
keymap('n', '<leader>ba', '<Cmd>BufferCloseAllButCurrent<CR>', { desc = "Close another buffers" })
