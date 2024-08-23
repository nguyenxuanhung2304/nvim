return {
	"romgrk/barbar.nvim",
	event = {
		"VeryLazy",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {},
	version = "^1.0.0",
	keys = {
		{ "<", "<Cmd>BufferPrevious<CR>" },
		{ ">", "<Cmd>BufferNext<CR>" } },
}
