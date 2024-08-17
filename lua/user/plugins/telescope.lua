return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		cmd = "Telescope",
		opts = {
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
				oldfiles = {
					cwd_only = true,
				},
			},
			extensions = {
				smart_open = {
					match_algorithm = "fzf",
					cwd_only = true,
					ignore_patterns = { "*.git/*", "*/tmp/*", ".idea/" },
				},
			},
		},
		keys = {
			{
				"<leader>sf",
				function()
					require("telescope").extensions.smart_open.smart_open()
				end,
				desc = "Find files",
			},
			{ "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Find oldfiles" },
			{ "<leader>sB", "<cmd>Telescope git_branches<cr>", desc = "Find branches" },
			{ "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
		},
	},
	{
		"danielfalk/smart-open.nvim",
		lazy = true,
		branch = "0.2.x",
		dependencies = {
			"kkharji/sqlite.lua",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},
}
