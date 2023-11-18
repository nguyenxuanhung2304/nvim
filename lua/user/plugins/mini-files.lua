return {
	"echasnovski/mini.files",
	lazy = true,
	version = false,
	opts = {},
	keys = {
		{
			"<leader>ec",
			function()
				require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
			end,
			desc = "Open mini.files (directory of current file)",
		},
		{
			"<leader>er",
			function()
				require("mini.files").open(vim.loop.cwd(), true)
			end,
			desc = "Open mini.files (cwd)",
		},
	},
}
