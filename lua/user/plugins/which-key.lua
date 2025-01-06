return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		win = {
			border = "single",
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.add({
			mode = { "n", "v" },
			{ "<leader>C", desc = "Conflict" },
			{ "<leader>D", desc = "Diff" },
			{ "<leader>T", desc = "Test" },
			{ "<leader>b", desc = "Buffer" },
			{ "<leader>c", desc = "Code" },
			{ "<leader>g", desc = "Git" },
			{ "<leader>s", desc = "Search" },
			{ "<leader>x", desc = "Xcode" },
		})
		wk.setup(opts)
	end,
}
