return {
	"folke/which-key.nvim",
	opt = true,
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 100
	end,
	opts = {
		defaults = {
			mode = { "n", "v" },
			["<leader>s"] = { name = "+Search" },
			["<leader>z"] = { name = "+Fold" },
			["<leader>C"] = { name = "+Conflict" },
			["<leader>D"] = { name = "+Diff" },
			["<leader>B"] = { name = "+Bufferline" },
			["<leader>T"] = { name = "+Test" },
			["<leader>g"] = { name = "+Git" },
			["<leader>x"] = { name = "+Xcode" },
			["<leader>c"] = { name = "+Code" },
			["<leader>b"] = { name = "+Buffer" },
		},
		window = {
			border = "single",
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
}
