local keymap = require("core.utils").keymap

keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>")
keymap("n", "<C-f>", "<cmd>Telescope grep_string<cr>")
keymap("n", "<C-e>", "<cmd>NvimTreeToggle<cr>")
