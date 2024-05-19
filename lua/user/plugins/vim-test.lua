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
}
