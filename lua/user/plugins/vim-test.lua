return {
	cmd = {
		"TestNearest",
		"TestFile",
		"TestSuite",
	},
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
	},
	config = function()
		vim.cmd("let test#strategy = 'vimux'")
	end,
	keys = {
		{ "<Leader>Tc", "<cmd>TestNearest<CR>", desc = "Run test under cursor" },
		{ "<Leader>Tf", "<cmd>TestFile<CR>", desc = "Run test in the current file" },
		{ "<Leader>Ta", "<cmd>TestSuite<CR>", desc = "Run all test" },
	},
}
