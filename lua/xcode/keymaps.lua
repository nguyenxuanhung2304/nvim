vim.keymap.set("n", "gd", "<Cmd>SVPress <LT>C-D-j><CR>", { desc = "Jump to Definition" })
vim.keymap.set("n", "gr", "<Cmd>SVPress <LT>C-S-D-f><CR>", { desc = "Find selected Symbol" })
vim.keymap.set("n", "K", "<Cmd>SVPress <LT>M-LeftMouse><CR>", { desc = "Show infor under cursor" })
vim.keymap.set("n", "<C-o>", "<Cmd>SVPress <LT>C-D-Left><CR>", { desc = "Map <C-O>" })
vim.keymap.set("n", "<C-i>", "<Cmd>SVPress <LT>C-D-Right><CR>", { desc = "Map <C-i>" })
vim.keymap.set("n", "ga", "<Cmd>SVPress <LT>D-LeftMouse><CR>", { desc = "Code actions" })
-- Split
vim.keymap.set("n", "<C-w>v", "<Cmd>SVPress <LT>C-D-t><CR>", { desc = "Split vertical" })
vim.keymap.set("n", "<C-w>s", "<Cmd>SVPress <LT>C-M-D-t><CR>", { desc = "Split horizontal" })

vim.keymap.set("n", "<C-w>c", "<Cmd>SVPress <LT>C-S-D-w><CR><Cmd>SVPress <LT>C-`><CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<C-w>o", "<Cmd>SVPress <LT>C-S-M-D-w><CR>", { desc = "Close other buffers" })

vim.keymap.set("n", "<C-w>h", "<Cmd>SVPress <LT>D-j><CR><Cmd>SVPress h<CR><Cmd>SVPress <LT>CR><CR>")
vim.keymap.set("n", "<C-w>j", "<Cmd>SVPress <LT>D-j><CR><Cmd>SVPress j<CR><Cmd>SVPress <LT>CR><CR>")
vim.keymap.set("n", "<C-w>k", "<Cmd>SVPress <LT>D-j><CR><Cmd>SVPress k<CR><Cmd>SVPress <LT>CR><CR>")
vim.keymap.set("n", "<C-w>l", "<Cmd>SVPress <LT>D-j><CR><Cmd>SVPress l<CR><Cmd>SVPress <LT>CR><CR>")
