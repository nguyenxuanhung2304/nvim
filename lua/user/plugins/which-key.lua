return {
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			defaults = {
				mode = { "n", "v" },
				["<leader>s"] = { name = "+Search" },
				["<leader>z"] = { name = "+Fold" },
				["<leader>C"] = { name = "+Conflict" },
				["<leader>;"] = { name = "+Git" },
				["<leader>D"] = { name = "+Diff" },
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
