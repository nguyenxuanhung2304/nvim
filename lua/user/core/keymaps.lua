local utils = require("user.core.utils")
local keymap = utils.keymap

-- Yank and hold current cursor
keymap("v", "y", "ygv<Esc>")

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

-- Nvim Hlslens
keymap("n", "n", "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>")
keymap("n", "N", "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>")
keymap("n", "*", "*<Cmd>lua require('hlslens').start()<CR>")
keymap("n", "#", "#<Cmd>lua require('hlslens').start()<CR>")
keymap("n", "g*", "g*<Cmd>lua require('hlslens').start()<CR>")
keymap("n", "g#", "g#<Cmd>lua require('hlslens').start()<CR>")

-- Move in term mode
keymap("t", "<C-o>", "<C-\\><C-n>")
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h")
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j")
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k")
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l")

-- Git conflit
keymap("n", "<Leader>Cc", "<cmd>GitConflictChooseOurs<cr>", { desc = "Select current" })
keymap("n", "<Leader>Ci", "<cmd>GitConflictChooseTheirs<cr>", { desc = "Select incomming" })
keymap("n", "<Leader>Cb", "<cmd>GitConflictChooseBoth<cr>", { desc = "Select both" })
keymap("n", "<Leader>Cn", "<cmd>GitConflictNextConflict<cr>", { desc = "Next" })
keymap("n", "<Leader>Cp", "<cmd>GitConflictPrevConflict<cr>", { desc = "Previous" })

-- GitSign
keymap("n", "<Leader>;P", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview hunk" })
keymap("n", "<Leader>;s", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage hunk" })
keymap("n", "<Leader>;r", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Discard hunk" })
keymap("n", "<Leader>;u", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Unstage hunk" })
keymap("n", "<leader>;n", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next hunk" })
keymap("n", "<leader>;p", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Previous hunk" })
keymap("n", "<leader>;c", "<cmd>GitBlameCopyFileURL<cr>", { desc = "Copy file url in github" })

-- Diffview
keymap("n", "<Leader>Do", "<cmd>DiffviewOpen<cr>", { desc = "Open Diffiview" })
keymap("n", "<Leader>Dc", "<cmd>DiffviewClose<cr>", { desc = "Close Diffiview" })
keymap("n", "<Leader>Dh", "<cmd>DiffviewFileHistory<cr>", { desc = "Open files history" })

-- Marks
keymap("n", "<Leader>l", "<cmd>MarksListAll<cr>", { desc = "List all marks" })

-- Common
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Disable hlsearch" })
keymap("n", "<Leader>g", "<cmd>Neogit<cr>", { desc = "Open neogit" })
keymap("n", "<C-f>", "<cmd>silent !tmux neww '~/.local/bin/scripts/tmux-sessionizer'<CR>", { desc = "Find folders in ~/Dev" })
keymap("n", "yr", function()
	local relative_filepath = vim.fn.expand("%:.")
	vim.fn.setreg("+", relative_filepath)
end, { desc = "Copy relative filepath" })

keymap("n", "<C-q>", function()
	if #vim.api.nvim_tabpage_list_wins(0) > 1 then
		vim.cmd([[close]])
	elseif #vim.api.nvim_list_tabpages() > 1 then
		vim.cmd([[tabclose]])
	else
		vim.cmd([[qa]])
	end
end, { desc = "Quit buffer" })

keymap('i', '<C-c>', '<esc>$<S-a>,<CR>', { desc = "Add comma to endline" })
keymap('i', '<C-v>', '<esc>$<S-a>:<space>', { desc = "Add two dots to next word" })
keymap('i', '<C-b>', '<Esc>o', { desc = "Jump to new line" })
keymap('i', '<C-d>', '<Esc>$i,<space>', { desc = "Add a comma and space" })

keymap('n', '<leader>L', '<cmd>Lazy<cr>', { desc = "Lazy" })

keymap("v", ">", ">gv")
keymap("v", "<", "<gv")
