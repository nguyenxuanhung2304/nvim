return {
	"CRAG666/code_runner.nvim",
	config = true,
	opts = {
		filetype_path = vim.fn.expand("~/.config/nvim/code_runner.json"),
	},
	keys = {
		{ "<leader>r", "<cmd>RunCode<CR>", desc = "Code runner" },
	},
}
