vim.defer_fn(function()
	pcall(require, "impatient")
end, 0)

-- Bootstraap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

if vim.g.shadowvim then
	require("xcode.keymaps")
	require("lazy").setup({
		spec = {
			{ import = "xcode.plugins" },
		},
		change_detection = { enabled = false },
	})
else
	require("lazy").setup({
		spec = {
			{ import = "user.plugins" },
		},
		change_detection = { enabled = false },
		keys = {
			{ "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" } },
		},
	})

	require("user.core")
end
