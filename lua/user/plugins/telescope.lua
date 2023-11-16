return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	cmd = "Telescope",
	opts = {
		pickers = {
			colorscheme = {
				enable_preview = true,
			},
		},
	},
	keys = {
		{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>sr", "<cmd>Telescope oldfiles<cr>",  desc = "Find oldfiles" },
		{ "<leader>sB", "<cmd>Telescope git_branches<cr>",  desc = "Find branches" },
		{ "<leader>ss", "<cmd>Telescope git_stash<cr>",  desc = "Find stashes" },
		{ "<leader>si", "<cmd>Telescope media_files<cr>",  desc = "Find media files" },
		{ "<leader>sb", "<cmd>Telescope buffers<cr>",  desc = "Buffers" },
	},
}
